import 'package:flutter/material.dart';
import 'package:task_for_qit/Screens/home_screen.dart';
import 'package:task_for_qit/Screens/login_scren.dart';

import 'Api/dio_helper.dart';

void main() {
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
