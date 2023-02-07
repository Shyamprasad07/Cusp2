import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(MyLocation());

class MyLocation extends StatefulWidget {
  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(Dim().d32),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                SvgPicture.asset('assets/location.svg'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enable Location',
                  style: Sty().largeText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,color: Clr().primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "We'll need your location to give you the\n best possible eye contact matching\nexperience",
                    textAlign: TextAlign.center,
                    style: Sty().smallText.copyWith(
                          height: 1.5,fontSize: 14,fontWeight: FontWeight.w400
                        ),
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 65,
                  width: 370,
                  child: ElevatedButton(
                      onPressed: () {
                        // STM().redirect2page(ctx, Home());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Clr().primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                          'Get Current  Location',
                        style: Sty().largeText.copyWith(
                            color: Clr().white,
                            fontWeight: FontWeight.w600,fontSize: 16),
                      )),
                ),
                SizedBox(height: Dim().d28,),
                SizedBox(
                  height: 65,
                  width: 370,
                  child: ElevatedButton(
                      onPressed: () {
                        // STM().redirect2page(ctx, Verification());
                        // if (formKey.currentState!
                        //     .validate()) {
                        //   STM()
                        //       .checkInternet(
                        //       context, widget)
                        //       .then((value) {
                        //     if (value) {
                        //       sendOtp();
                        //     }
                        //   });
                        // }
                      },
                      style: ElevatedButton.styleFrom(elevation: 0,
                          backgroundColor: Clr().white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Clr().primaryColor
                            ),
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Enter Location manually',
                        style: Sty().largeText.copyWith(
                            color: Clr().black,
                            fontWeight: FontWeight.w600,fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
