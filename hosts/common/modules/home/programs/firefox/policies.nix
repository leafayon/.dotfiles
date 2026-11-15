{
  # https://firefox-admin-docs.mozilla.org/reference/policies/
  programs.firefox.policies = {
    # Search
    FirefoxSuggest =  {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
      Locked = true;
    };
    SearchBar = "unified";
    #TODO SearchEngines
    SearchSuggestEnabled = false;
    VisualSearchEnabled = true;

    # Security
    DisableTelemetry = true;
    EnableTrackingProtection = {
      value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
      EmailTracking = true;
      SuspectedFingerprinting = true;
      BaselineExceptions = true;
      ConvenienceExceptions = false;
    };
    HttpsOnlyMode = "force_enabled";
    LocalNetworkAccess = {
      Enabled = true;
      BlockTrackers = true;
      EnablePrompting = true;
      Locked = true;
    };
    PostQuantumKeyAgreementEnabled = true;

    # UI
    DisplayBookmarksToolbar = "never";
    DisplayMenuBar = "never";
    DisableFirefoxScreenshots = true;
    DisableFirefoxStudies = true;
    DisableForgetButton = true;
    FirefoxHome = {
      Search = false;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights =  false;
      Stories = false;
      SponsoredStories = false;
      Locked = true;
    };
    #TODO Homepage
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    PasswordManagerEnabled = false;
    PromptForDownloadLocation = false;

    # Misc
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    #TODO DefaultDownloadDirectory
    #TODO DisableAccounts
    #TODO DisableFirefoxAccounts
    DisableFormHistory = true;
    DisableMasterPasswordCreation = true;
    DisableRemoteImprovements = false;
    #TODO DownloadDirectory

    #TODO GoToIntranetSiteForSingleWordEntryInAddressBar
    HardwareAcceleration = true;
    NetworkPrediction = true;
    PictureInPicture = {
      Enabled = false;
      Locked = true;
    };
    GenerativeAI = {
      Enabled = false;
      Locked = true;
    };
    #TODO RequestedLocales
    SkipTermsOfUse = true;
  };
}