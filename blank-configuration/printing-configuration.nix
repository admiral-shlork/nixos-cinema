{pkgs, ...}: {

  services.printing = {
    enable = true;
    drivers = [pkgs.brlaser];
  };

  hardware.printers = let
    brl2370d = "Brother_HL-L2370DN";
  in {
    ensureDefaultPrinter = brl2370d;
    ensurePrinters = [
      {
        name = brl2370d;
        description = "Brother HL-L2370DN Laser Printer";
        location = "Big Office Space";
        deviceUri = "ipp://10.0.0.181";
        model = "drv:///brlaser.drv/brl2370d.ppd";
        ppdOptions.PageSize = "A4";
      }
    ];
  };
}
