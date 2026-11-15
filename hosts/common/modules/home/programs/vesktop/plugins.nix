{
  # https://github.com/Vendicated/Vencord/tree/main/src/plugins
  programs.vesktop.vencord.settings.plugins = {
    BetterGifPicker.enabled = true;
    BetterSessions.enabled = true;
    BetterSettings.enabled = true;
    CallTimer.enabled = true;
    DisableCallIdle.enabled = true;
    Experiments.enabled = true;
    FavoriteEmojiFirst.enabled = true;
    FavoriteGifSearch.enabled = true;
    FriendsSince.enabled = true;
    FixImagesQuality.enabled = true;
    FixSpotifyEmbeds.enabled = true;
    FixYoutubeEmbeds.enabled = true;
    ForceOwnerCrown.enabled = true;
    FullSearchContext.enabled = true;
    FullUserInChatbox.enabled = true;
    MemberCount.enabled = true;
    MentionAvatars.enabled = true;
    MessageLatency.enabled = true;
    NotificationVolume.enabled = true;
    PermissionsViewer.enabled = true;
    PlatformIndicators.enabled = true;
    PreviewMessage.enabled = true;
    RoleColorEverywhere.enabled = true;
    SecretRingToneEnabler.enabled = true;
    ServerInfo.enabled = true;
    ShowAllMessageButtons.enabled = true;
    SortFriendRequest.enabled = true;
    ShowConnections.enabled = true;
    ShowTimeoutDuration.enabled = true;
    ShowHiddenThings.enabled = true;
    UnlockedAvatarZoom.enabled = true;
    UserMessagesPronouns.enabled = true;
    UserVoiceShow.enabled = true;
    ValidUser.enabled = true;
    ValidReply.enabled = true;
    VolumeBooster.enabled = true;

    MessageLogger = {
      enabled = true;

      ignoreBots = true;
      ignoreSelf = true;
    };

    PinDMs = {
      enabled = true;

      canCollapseDmSection = true;
    };

    RelationshipNotifier= {
      enabled = true;

      noticies = true;
    };
  };
}