{
  # https://firefox-admin-docs.mozilla.org/reference/policies/preferences/
  programs.firefox.policies.Preferences = {
    # https://searchfox.org/firefox-main/source/modules/libpref/init/StaticPrefList.yaml

    # UI
    "browser.tabs.inTitlebar".Value = 0;
    "browser.tabs.inTitlebar".Status = "locked";

    # Misc
    "browser.translations.automaticallyPopup".Value = false;
    "browser.translations.automaticallyPopup".Status = "locked";
  };
}