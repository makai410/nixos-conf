{lib, ...}: {
  imports = [
    ./security.nix
    ./users.nix
    ../nix
    ../programs/fish.nix
  ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
  };

  # don't touch this
  system.stateVersion = lib.mkDefault "24.05";
  system = {
    switch.enable = true;
    rebuild.enableNg = true;
  };

  time.timeZone = lib.mkDefault "Asia/Shanghai";
  time.hardwareClockInLocalTime = lib.mkDefault true;

  # compresses half the ram for use as swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };
}
