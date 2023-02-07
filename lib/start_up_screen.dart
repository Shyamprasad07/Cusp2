import 'package:cusp/sign_up.dart';
import 'package:flutter/material.dart';

import 'manage/static_method.dart';
import 'sign_in.dart';
import 'values/colors.dart';
import 'values/styles.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(

      // resizeToAvoidBottomInset: false,
      backgroundColor: Clr().white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                children: [
                    Image.asset('assets/cuspsp2.png',width: 220,height: 80),
                    SizedBox(
                      height: 70,
                    ),
                    SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                            STM().redirect2page(ctx, SignIn());
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0.5,
                              backgroundColor: Clr().primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            ' Sign In',
                            style: Sty().largeText.copyWith(
                                color: Clr().white, fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                            STM().redirect2page(ctx, SignUp());
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0.5,
                              backgroundColor: Colors.white,
                              side:
                                  BorderSide(width: 1, color: Clr().primaryColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            'Sign Up',
                            style: Sty().largeText.copyWith(
                                color: Clr().primaryColor,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                ],
              ),
                  )),
            ),
          ]),
    );
  }
}
