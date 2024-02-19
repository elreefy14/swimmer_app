import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/routiong.dart';
import 'core/bloc_observer.dart';
import 'core/cashe_helper.dart';
import 'core/constants/routes_manager.dart';

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message:\n\n\n ${message.messageId}');
// }
late String mainRoute;
final remoteConfig = //firabase remote config
FirebaseRemoteConfig.instance;
Future<void> main() async {
  //aw1ait initializeDateFormatting('ar', null);
  //wait widget tree to be built
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //make bottom bar transparent
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await CacheHelper.init();
  // RegisterationRepo repo = getIt<RegisterationRepo>();
  // repo.signIn(
  // 'ahemd@gmail.com',
  //    '123456789',
  // );
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED
  );
  if (FirebaseAuth.instance.currentUser == null) {
    mainRoute = AppRoutes.welcome;
  } else {
    mainRoute = AppRoutes.home;
  }
  //await DioHelper.init();
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('onMessage\n\n\n');
  //   print(event.notification!.title);
  //   print(event.notification!.body);
  // });
  // // when click on notification to open app
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('onMessageOpenedApp\n\n\n\n\n\n\n');
  //   print(event.notification!.title);
  //   print(event.notification!.body);
  //
  // });
  // background notification
//  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //firebase messaging PERMISSION
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  //checkForAppUpdate();
    BlocOverrides.runZoned(() => runApp(const MyApp()),
        blocObserver: MyBlocObserver());

  //setupDependencies();


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //  designSize: const Size(360, 690),
      designSize: const Size(390, 845),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) => MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:mainRoute,
        onGenerateRoute:RouteGenerator.generateRoute,
      ),
    );
  }
}

