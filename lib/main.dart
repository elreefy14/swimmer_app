import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swimmer_app/home/business_logic/Home/home_cubit.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/otp_cubit.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/sign_up_cubit.dart';
import 'package:swimmer_app/registeration/business_logic/auth_cubit/login_cubit.dart';
import 'package:swimmer_app/routiong.dart';
import 'core/bloc_observer.dart';
import 'core/cashe_helper.dart';
import 'core/constants/routes_manager.dart';
import 'core/network/web_services.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message:\n\n\n ${message.messageId}');
}
Future<void> main() async {
  //await initializeDateFormatting('ar', null);

  //wait widget tree to be built
  WidgetsFlutterBinding.ensureInitialized();
  //await AndroidAlarmManager.initialize();

  //init git it
  //initGetIt();
  //init shared pref
//  await PurshaseApi.init();
//  await CacheHelper.init();
  //prevent landscape mode
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
  //await //init shared pref and dio
  await CacheHelper.init();

  // RegisterationRepo repo = getIt<RegisterationRepo>();
  // repo.signIn(
  // 'ahemd@gmail.com',
  //    '123456789',
  // );
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  await DioHelper.init();
  FirebaseMessaging.onMessage.listen((event) {
    print('onMessage\n\n\n');
    print(event.notification!.title);
    print(event.notification!.body);
  });
  // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('onMessageOpenedApp\n\n\n\n\n\n\n');
    print(event.notification!.title);
    print(event.notification!.body);

  });
  // background notification
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
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


  //setupDependencies();
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: MyBlocObserver());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()
           // ..editUserData(
           //   firstName: 'ahmed',
           // )
          //..getProfileImage()
          //  ..signIn(
      //    phone: '01097051812',
      //    password: '123456',
      //  )
        ),
        BlocProvider(create: (context) => OtpCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => HomeCubit()
        ..getAllSchedulesForSpecificUser()
            ..getUserData()
        //..getNotifications()
         // ..generateRandomNotifications()
        //    ..getAllSchedulesForSpecificUser()
       // ..addScheduleToCoachCollection()
      // ..getAllSchedulesForSpecificUser()
       //   ..getSchedules(specificDate: DateTime.now())
          //  ..getAllSchedulesForSpecificUser()
        //    .._listenToConnectivityChanges()
      //  ..onQRCodeScanned(
      //    coachId: '4rC6uhZzsAbsdCFH0mHW6Qt0TTC3',
      //    scheduleId: '3HEtmWiDk7K9iGVGNEsV'
      //  )
        //..generateQrImageBasedOnNearestSchedule()
        //..setUpPeriodicAlarm()
        //   ..startScanning()
        // ..getSchedules(specificDate:
        // DateTime.now()
       //  )
          //..addSchedule('rafik',
           //       '3', '4', 7)
    ),
       // BlocProvider(create: (context) => SignUpCubit()),
       // BlocProvider(create: (context) => HomeCubit()
        //    ..searchCourse('mat')
        //    ..addTeacherAndCourseAndachaptersAndLessons()
        //   ..sendNotification(
        //   'integration test yto one', 'math'
        //    )
        //     ..sendNotificationToAllStudent('1',
        //       'integration test to math students')
        //..enrollCourse(
        // ' 7Ww1DVgs0gX6eeLochZfVHgIPKz2','1'
        //),
         // ..firebaseMessagingGetToken()
         // ..sendFCMNotification(
           //   token: 'fCM_RJZERkWTJ-gOF3HqLg:APA91bEaT3iRG6kXJfYFCxZYic5ylKTYtRVmf0U7vQCiTj0XLm4z6MQgMQU6SeqVjXcEUt2WrX9v-fFwGzMqs58Gepf9HeFcnu_FxI4wIlUtpX6D2pOhNNeyAM00SUptj6esIpHc08dX', senderName: 'ahmed attack' ,messageImage: 'hiiii')
          // ..sendNotification(
          //  '6EAx9TEpHDc5N0ivwDEaTrufL2X2',
          // 'math', 'en')
          // ..getNotification('6EAx9TEpHDc5N0ivwDEaTrufL2X2')
       // ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context , child) => MaterialApp(

          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', "AE"),
          ],

          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.home,
          onGenerateRoute:RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
//
//You can listen for connectivity changes and call the syncOfflineAttendanceData() function when the device reconnects to the internet.
//
// import 'package:connectivity/connectivity.dart';
//
// void main() {
//   runApp(MyApp());
//   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
//     if (result != ConnectivityResult.none) {
//       await syncOfflineAttendanceData();
//     }
//   });
// }

