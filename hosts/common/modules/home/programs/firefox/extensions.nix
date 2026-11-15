{
  programs.firefox.policies.ExtensionUpdate = true;

  # https://firefox-admin-docs.mozilla.org/reference/policies/extensionsettings/
  programs.firefox.policies.ExtensionSettings = {
    # Ghostery
    "firefox@ghostery.com" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox@ghostery.com/latest.xpi";
      installation_mode = "force_installed";
      private_browsing = true;
    };

    # Proton VPN
    "vpn@proton.ch" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/vpn@proton.ch/latest.xpi";
      installation_mode = "force_installed";
      private_browsing = true;
    };

    # Bitwarden
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
      installation_mode = "force_installed";
    };

    # TwitchNoSub
    "TwitchNoSub" = {
      install_url = "https://github.com/besuper/TwitchNoSub/releases/download/0.9.3/TwitchNoSub-firefox-0.9.3.xpi";
      installation_mode = "force_installed";
    };

    # SponsorBlock
    "sponsorBlocker@ajay.app" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorBlocker@ajay.app/latest.xpi";
      installation_mode = "force_installed";
    };

    # DeArrow
    "deArrow@ajay.app" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/deArrow@ajay.app/latest.xpi";
      installation_mode = "force_installed";
    };

    # Wappalyzer
    "wappalyzer@crunchlabz.com" = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer@crunchlabz.com/latest.xpi";
      installation_mode = "force_installed";
    };
  };
}