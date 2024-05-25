import 'dart:io';
import 'package:e_learning/bindings/initial_bindings.dart';
import 'package:e_learning/core/services/services.dart';
import 'package:e_learning/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDI3jWTSr9V6cLl0ZZzDtDlYi9ROCOVV_0",
          appId: "1:998993142564:android:bb877d335cfc02338c09b1",
          messagingSenderId: "998993142564",
          projectId: "back-up-class"));
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Back-up Class',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: routes,
      builder: EasyLoading.init(),
    );
  }
}
