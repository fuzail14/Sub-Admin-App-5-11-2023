import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Routes/route_managment.dart';
import 'package:societyadminapp/Routes/screen_binding.dart';
import 'package:societyadminapp/Routes/set_routes.dart';

import 'Module/Generate Bill/View/generate_bill.dart';
import 'Module/HomeScreen/Controller/home_screen_controller.dart';
import 'Module/Payments/payments.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await Firebase.initializeApp();

   runApp(MyApp());
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  RemoteMessage? initialMessage =
  await FirebaseMessaging.instance.getInitialMessage();

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (initialMessage != null) {
    _handleMessage(initialMessage);
  }
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  // print(message.data['data']);
  final HomeScreenController _homeScreenController = Get.put(HomeScreenController());
  RemoteNotification? notification = message.notification;


  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message}");
}

void _handleMessage(RemoteMessage message) {

       print( message.data['data'] );

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
    return GetMaterialApp(
      // home: GenerateBill(),
      initialRoute: splashscreen,
      getPages: RouteManagement.getPages(),
      initialBinding: ScreenBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
