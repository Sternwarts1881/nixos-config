{
  services.hardware.bolt.enable = true;

  hardware = {
    cpu.amd.ryzen-smu.enable = true;
    sensor.iio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    cpu.amd.updateMicrocode = true; # amd-ucode
    sane.enable = true; # sane (tarayıcı desteği)
    enableRedistributableFirmware = true;
  };

  services.xserver.wacom.enable = true;


      powerManagement = {
      cpufreq = {
        min = 200000;
        max = 3200000;

      };
    };
}
