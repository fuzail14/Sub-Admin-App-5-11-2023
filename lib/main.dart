import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Services/Alarm%20Services/alarm_services.dart';

import 'Routes/route_managment.dart';
import 'Routes/screen_binding.dart';
import 'Routes/set_routes.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.notification!.title}");
  print("Handling a background message: ${message.notification!.body}");
  print("Handling a background message: ${message.sentTime}");
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await AndroidAlarmManager.initialize();
  AlarmServices.initAlarm();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print('Fire Base token');
      print('--------');
      print(token);
      print('--------');


    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(375, 812),
        builder: (ctx, child) {
           ScreenUtil.init(ctx);
          return GetMaterialApp(

            initialRoute: splashscreen,
            getPages: RouteManagement.getPages(),
            initialBinding: ScreenBindings(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
          );
        });
  }
}
