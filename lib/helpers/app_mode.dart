enum AppModeType { offline, online }

class AppMode {
  static String getModeTitle(AppModeType type) {
    String title = "";
    switch (type) {
      case AppModeType.online:
        title = "Online";
        break;
      case AppModeType.offline:
        title = "Offline";
        break;
      default:
        title = "Undefined";
        break;
    }
    return title;
  }
}
