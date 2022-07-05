// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

class AppStartUp {
  Future<void> setUp() async {
    getIt.allowReassignment = true;
    await initializedFirebase();
    await registerServices(getIt);

    loadStartUpConfig();
    await firebasePushNotification();
  }

  Future<void> registerServices(ioc) async {
    setupSharedServices(ioc);
  }

  void loadStartUpConfig() async {
    // clear cached token if the app is a newly installed.
    var isFirstTime =
        await LocalStorageUtils.read(AppConstants.isUserFirstTime);
    if (isFirstTime != "true") {
      await const FlutterSecureStorage().deleteAll();
    }
  }

  Future<void> initializedFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> firebasePushNotification() async {
    FirebaseNotificationManager notificationManager =
        FirebaseNotificationManager();
    await notificationManager.registerNotification();
    try {
      await notificationManager.deviceToken;
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
