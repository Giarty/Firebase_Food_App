import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/notification_api.dart';
import "package:timezone/data/latest.dart" as tz;
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationApi.init();
  tz.initializeTimeZones();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB7TblybgeAFS4yD3mQZbWJEVUrVYYgBE4",
      appId: "1:534904445423:android:067b6919edd2f3a142fe1a",
      messagingSenderId: "534904445423",
      projectId: "learningx-task",
      storageBucket: "learningx-task.appspot.com",
    ),
  );
  runApp(
    ScreenUtilInit(
      child: GetMaterialApp(
        title: "Firebase_Food_App",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
