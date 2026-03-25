{
  services.hardware.bolt.enable = true;

  hardware = {
    sensor.iio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    cpu = {
      amd = {
        ryzen-smu.enable = true;
        updateMicrocode = true; # amd-ucode
      };
    };

    amdgpu = {
      overdrive={
        enable = true;
        ppfeaturemask = "0xffffffff";
      };
    };

    sane.enable = true; # sane (tarayıcı desteği)
    enableRedistributableFirmware = true;
  };

  services.xserver.wacom.enable = true;


#      powerManagement = {
 #     cpufreq = {
  #      min = 200000;
   #     max = 3200000;

  #    };
  #  };
}
