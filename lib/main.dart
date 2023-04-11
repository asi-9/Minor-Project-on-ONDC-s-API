import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '/controller/google_login_controller.dart';
//
import 'Screens/login.dart';
import 'bindings/bindings.dart';
import '/Screens/login.dart';
import 'package:minor/Screens/loggedin_page.dart';

import 'route_generator.dart';

void main() {
  runApp( const MyApp());
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ]
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: const LoginScreen(),
        )
      ],
      child: GetMaterialApp(

        initialBinding: MyBindings(),
        debugShowCheckedModeBanner: false,
        title: 'Login UI - Flutter',
        home: const LoginScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }

}