{ config, pkgs, lib, ...}:

{ security = {
    rtkit.enable = true;
    setuidPrograms = [ "VirtualBox" "VBoxManage" ];
  };
}
