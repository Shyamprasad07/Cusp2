import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'lets_start.dart';
import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';



class OTPVerification extends StatefulWidget {
  final  smobile, semail, sname, stype;

  const OTPVerification(
      {super.key, this.smobile, this.semail, this.sname, this.stype});
  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late BuildContext ctx;

  bool again = false;
  bool isResend = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController otpCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(resizeToAvoidBottomInset: false,
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
          'OTP verification',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dim().d16),
          child: Column(
            children: [
              SizedBox(height: Dim().d32,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dim().d16),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            // ' A 4 digit code has been sent to + 91 \n ${widget.smobile}',style: Sty().mediumText.copyWith(
                            ' A 4 digit code has been sent to \n 5895458795',style: Sty().mediumText.copyWith(

                            color: Clr().black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                           ),),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Dim().d2),
                      child: PinCodeTextField(
                        // controller: otpCtrl,
                        // errorAnimationController: errorController,
                        appContext: context,
                        enableActiveFill: true,
                        textStyle: Sty().largeText,
                        length: 4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        animationType: AnimationType.scale,
                        cursorColor: Clr().primaryColor,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(Dim().d8),
                          fieldWidth: Dim().d64,
                          fieldHeight: Dim().d64,
                          selectedFillColor: Color(0xffFFE0DA),
                          activeFillColor: Color(0xffFFE0DA),
                          inactiveFillColor: Color(0xffFFE0DA),
                          inactiveColor: Clr().transparent,borderWidth: 0.5,
                          activeColor: Clr().primaryColor,
                          selectedColor: Clr().primaryColor,
                        ),
                        animationDuration: const Duration(milliseconds: 200),
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || !RegExp(r'(.{4,})').hasMatch(value)) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Visibility(
                            visible: !again,
                            child: TweenAnimationBuilder<Duration>(
                                duration: const Duration(seconds: 60),
                                tween: Tween(
                                    begin: const Duration(seconds: 60),
                                    end: Duration.zero),
                                onEnd: () {
                                  // ignore: avoid_print
                                  // print('Timer ended');
                                  setState(() {
                                    again = true;
                                  });
                                },
                                builder: (BuildContext context, Duration value,
                                    Widget? child) {
                                  final minutes = value.inMinutes;
                                  final seconds = value.inSeconds % 60;
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Didn’t receive code?',
                                            style: Sty()
                                                .mediumText
                                                .copyWith(color: Clr().black,fontSize: 14,fontWeight: FontWeight.w400),
                                          ),SizedBox(width: 2,),
                                          Text(
                                            'Request again',
                                            style: Sty()
                                                .mediumText
                                                .copyWith(color: Clr().red,fontSize: 14,fontWeight: FontWeight.w400),
                                          )

                                        ],
                                      ),
                                      SizedBox(
                                        height:Dim().d12,
                                      ),
                                      Text(
                                        "0$minutes:$seconds Sec",
                                        textAlign: TextAlign.center,
                                        style: Sty()
                                            .mediumText
                                            .copyWith(color: Clr().black,fontWeight:FontWeight.w600),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                        Visibility(
                          visible: again,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                again = false;
                                // VerifyOtp();
                              });
                              // STM.checkInternet().then((value) {
                              //   if (value) {
                              //     sendOTP();
                              //   } else {
                              //     STM.internetAlert(ctx, widget);
                              //   }
                              // });
                            },
                            child: Text(
                              'Re-send code',
                              style: Sty()
                                  .mediumBoldText
                                  .copyWith(color: Clr().primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                             STM().redirect2page(ctx, Letstart());
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
                            // //     // registerSend();
                            //    });
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Clr().primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          child: Text(
                            'Submit',
                            style: Sty().largeText.copyWith(
                                color: Clr().white, fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  _showSuccessDialog(ctx, message, Home,) {
    AwesomeDialog(
      context: ctx,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      alignment: Alignment.centerLeft,
      body: Container(
        padding: EdgeInsets.all(Dim().d4),
        child: Column(
          children: [
            Image.asset('assets/success.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'OTP verified successfully',
              style: Sty().mediumText.copyWith(
                color: Clr().black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ).show();
  }



}
