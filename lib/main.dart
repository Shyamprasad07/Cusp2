import 'package:cusp/sign_in.dart';
import 'package:flutter/material.dart';

import 'start_up_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences sp = await SharedPreferences.getInstance();
  //  bool isLogin =
  // sp.getBool('is_login') ?? false;
  // bool isID = sp.getString('user_id') != null ? true : false;

  await Future.delayed(const Duration(seconds: 3));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage()
      //     ? Home()
      //     : const SignIn(),
      // // home: SignIn(),
    ),
  );
}