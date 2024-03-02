{ lib, pkgs, ...}: {
  # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
  sound.enable = true;
  # Disable pulseaudio, it conflicts with pipewire too.
  hardware.pulseaudio.enable = false;
  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # PipeWire is a new low-level multimedia framework.
  # It aims to offer capture and playback for both audio and video with minimal latency.
  # It support for PulseAudio-, JACK-, ALSA- and GStreamer-based applications.
  # PipeWire has a great bluetooth support, it can be a good alternative to PulseAudio.
  #     https://nixos.wiki/wiki/PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gst_all_1.gstreamer
  ];

  environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" (with pkgs.gst_all_1; [
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
    gst-libav
  ]);

  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  location.provider = "geoclue2";

  services = {
    printing.enable = true;
    geoclue2.enable = true;
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];
  };
}
