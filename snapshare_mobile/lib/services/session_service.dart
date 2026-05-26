class SessionService {

  static String? userName;

  static String? userEmail;

  static bool isLoggedIn = false;

  // NEW SETTINGS

  static bool autoShareEnabled = true;

  static bool smartScanEnabled = true;

  static void saveUser({

    required String name,

    required String email,
  }) {

    userName = name;

    userEmail = email;

    isLoggedIn = true;
  }

  static void logout() {

    userName = null;

    userEmail = null;

    isLoggedIn = false;

    autoShareEnabled = true;

    smartScanEnabled = true;
  }

  // AUTO SHARE SETTINGS

  static void toggleAutoShare(
    bool value,
  ) {

    autoShareEnabled = value;
  }

  static void toggleSmartScan(
    bool value,
  ) {

    smartScanEnabled = value;
  }
}