import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'forgot _password..dart';
import 'homepage.dart';
import 'manage/static_method.dart';
import 'my_location.dart';
import 'otp.dart';
import 'sign_up.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late BuildContext ctx;
  TextEditingController mobileCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Clr().white,
      appBar: AppBar(toolbarHeight: Dim().d100,
        leadingWidth: 100,
        title: Text(
          'Sign in',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: Dim().d16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height:Dim().d32),
              Padding(
                padding: EdgeInsets.all(Dim().d16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: mobileCtrl,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        if (value.length != 10) {
                          return 'Mobile number digits must be 10';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),

                        hintText: "Enter Mobile Number / Email",
                        labelText: 'Mobile Number / Email',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                          color: Clr().shimmerColor,
                        ),
                        counterText: "",
                      ),
                      maxLength: 10,
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: passwordCtrl,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isHidden,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter your Password",
                        hintStyle: Sty().mediumText.copyWith(
                          color: Clr().shimmerColor,
                        ),
                        counterText: "",
                        labelText: 'Password',
                        labelStyle: TextStyle(color:Clr().black2),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: InkWell(
                            child: Icon(
                              isHidden
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                isHidden ^= true;
                              });
                            },
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !RegExp(r'(.{6,})').hasMatch(value)) {
                          return Str().invalidPassword;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: Dim().d4,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(onPressed: (){
                        STM().redirect2page(ctx, ForgetPass());
                      }
                        , child: Text("Forgot Password ?", style: Sty().smallText.copyWith(
                          color: Clr().primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),),),
                    ),
                    SizedBox(
                      height: Dim().d20,
                    ),
                    SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                            STM().redirect2page(ctx, OTPVerification());
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
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                // registerSend();
                              });
                            }
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
                      height: Dim().d20,
                    ),
                  ],
                ),
              ),
              Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                          color: Colors.redAccent,
                          endIndent: 20,
                          indent: 20,
                        )
                    ),
                    Text("or sign up with"),
                    Expanded(
                        child: Divider(
                          color: Colors.redAccent,
                          endIndent: 20,
                          indent: 20,
                        )
                    ),
                  ]
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        // STM().redirect2page(ctx, SignUp());
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0.5,
                          backgroundColor: Colors.white,
                          side:
                          BorderSide(width: 0.5, color: Clr().primaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: SvgPicture.asset('assets/facebook.svg',height: 64,width: 64),),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: ElevatedButton(
                      onPressed: () {
                         STM().redirect2page(ctx, HomePage());
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0.5,
                          backgroundColor: Colors.white,
                          side:
                          BorderSide(width: 0.5, color: Clr().primaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: SvgPicture.asset('assets/Google.svg',height: 64,width: 64),),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        // STM().redirect2page(ctx, SignUp());
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0.5,
                          backgroundColor: Colors.white,
                          side:
                          BorderSide(width: 0.5, color: Clr().primaryColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: SvgPicture.asset('assets/Apple.svg',height: 64,width: 64),),
                  ),
                ],

              ),

              SizedBox(
                height: Dim().d20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text("Terms of use", style: Sty().smallText.copyWith(
                      color: Clr().primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),),),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(onPressed: (){}, child: Text("Privacy Policy", style: Sty().smallText.copyWith(
                      color: Clr().primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),),),
                ],
              ),
              SizedBox(
                height: Dim().d16,
              ),

              InkWell(
                onTap: () {
                  STM().redirect2page(ctx, SignUp());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account?",
                    style: Sty().smallText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Clr().black),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Register Now',
                        style: Sty().smallText.copyWith(
                            color: Clr().primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}