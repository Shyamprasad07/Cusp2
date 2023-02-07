import 'package:cusp/personaldetails.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Let’s start with2.dart';
import 'manage/static_method.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(Letstart());

class Letstart extends StatefulWidget {
  @override
  State<Letstart> createState() => _LetstartState();
}
class _LetstartState extends State<Letstart> {
  late BuildContext ctx;
  bool isChecked = false;
  String?  sGender;
  List<dynamic> GenderList = ["Man", "Woman","Transgender","Non-binary","Prefer not to say"];


  @override
  Widget build(BuildContext context) {
    ctx = context;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Clr().white,
      appBar: AppBar(toolbarHeight: Dim().d100,
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.all( Dim().d20),
          child: InkWell(
              onTap: (){
                STM().back2Previous(ctx);
              },
              child: SvgPicture.asset('assets/back.svg')),
        ),
        title: Text(
          ' Let’s start with',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () {
                    STM().redirect2page(ctx, PersonalDetails());
                  },
                  child: Text(
                    'Skip',
                    style: Sty().mediumText.copyWith(
                        color: Color(0xff3F3F41), fontSize: 16,fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: Dim().d16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Dim().d16),
              child: Column(
                children: [
                  SizedBox(height: Dim().d32,),
                  Align(
                    alignment : Alignment.centerLeft,
                    child: Text(
                      'I am a..',
                      style: Sty()
                          .mediumText
                          .copyWith(height: 1.7,color: Clr().red, fontWeight: FontWeight.w600,fontSize: 20),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xff3F3F41),width: 0.5,
                      ),
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Clr().white,
                    child: Column(
                      children: [
                        RadioListTile<dynamic>(

                          dense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Dim().d2,
                          ),
                          activeColor: Clr().primaryColor,
                          value: "Man",
                          groupValue: sGender,
                          onChanged: (value) {
                            setState(() {
                              sGender = value!;
                            });
                          },
                          title: Transform.translate(
                            offset: Offset(-6,0),

                            child: Text(
                              GenderList[0],
                              style: Sty().mediumText,
                            ),
                          ),
                        ),
                        RadioListTile<dynamic>(
                          contentPadding: EdgeInsets.all(Dim().d0),
                          activeColor: Clr().primaryColor,
                          value: "Woman",
                          groupValue: sGender,
                          onChanged: (value) {
                            setState(() {
                              sGender = value!;
                            });
                          },
                          title: Transform.translate(
                            offset: Offset(-6,0),
                            child: Text(
                              GenderList[1],
                              style: Sty().mediumText.copyWith(
                                fontFamily: 'outfit',
                              ),
                            ),
                          ),
                        ),
                        RadioListTile<dynamic>(
                          dense: true,
                          contentPadding: EdgeInsets.all(Dim().d0),
                          activeColor: Clr().primaryColor,
                          value: "Transgender",
                          groupValue: sGender,
                          onChanged: (value) {
                            setState(() {
                              sGender = value!;
                            });
                          },
                          title: Transform.translate(
                            offset: Offset(-6,0),
                            child: Text(
                              GenderList[2],
                              style: Sty().mediumText.copyWith(
                                fontFamily: 'outfit',
                              ),
                            ),
                          ),
                        ),
                        RadioListTile<dynamic>(
                          dense: true,
                          contentPadding: EdgeInsets.all(Dim().d0),
                          activeColor: Clr().primaryColor,
                          value: "Non-binary",
                          groupValue: sGender,
                          onChanged: (value) {
                            setState(() {
                              sGender = value!;
                            });
                          },
                          title: Transform.translate(
                            offset: Offset(-6,0),
                            child: Text(
                              GenderList[3],
                              style: Sty().mediumText.copyWith(
                                fontFamily: 'outfit',
                              ),
                            ),
                          ),
                        ),
                        RadioListTile<dynamic>(
                          dense: true,
                          contentPadding: EdgeInsets.all(Dim().d0),
                          activeColor: Clr().primaryColor,
                          value: "Prefer not to say",
                          groupValue: sGender,
                          onChanged: (value) {
                            setState(() {
                              sGender = value!;
                            });
                          },
                          title: Transform.translate(
                            offset: Offset(-6,0),
                            child: Text(
                              GenderList[4],
                              style: Sty().mediumText.copyWith(
                                fontFamily: 'outfit',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dim().d16,
                  ),
                  SizedBox(
                    height: 65,
                    width: 370,
                    child: ElevatedButton(
                        onPressed: () {
                          STM().redirect2page(ctx, Letstart2());
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
                          // if (_formKey.currentState!.validate()) {
                          //   setState(() {
                          //     // registerSend();
                          //   });
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Clr().primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text(
                          'Save & Next',
                          style: Sty().largeText.copyWith(
                              color: Clr().white, fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(
                    height: Dim().d20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
