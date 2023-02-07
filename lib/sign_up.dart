import 'package:cusp/matchpage.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'homepage.dart';
import 'manage/static_method.dart';
import 'my_location.dart';
import 'myprofile.dart';
import 'sign_in.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

void main() => runApp(SignUp());

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late BuildContext ctx;
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController enterPassCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   final _formKey = GlobalKey<FormState>();
  bool isHidden = true;
  bool isHidden1 = true;

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
          'Sign up to continue',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22, fontWeight: FontWeight.w700),
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
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         height: Dim().d160,
              //       ),
              //       SizedBox(
              //         width: 56,
              //         height: 56,
              //         child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               elevation: 0,
              //               backgroundColor: Clr().primaryColor,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15))),
              //           onPressed: () {
              //             STM().back2Previous(ctx);
              //           },
              //           child: Icon(
              //             Icons.arrow_back_ios_new,
              //             size: 20,
              //             color: Clr().white,
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 20),
              //         child: Text(
              //           ' Sign up to continue',
              //           style: Sty().largeText.copyWith(
              //               color: Clr().primaryColor,
              //               fontSize: 25),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                        hintText: "Enter Mobile Number",
                        labelText: 'Mobile Number',
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
                      controller: emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
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
                        hintText: "Enter Email Address ",
                        labelText: 'Email',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                          color: Clr().shimmerColor,
                        ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(
                      height:Dim().d28,
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
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: passwordCtrl,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isHidden1,
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
                        hintText: 'Confirm your Password',
                        hintStyle: Sty().mediumText.copyWith(
                          color: Clr().shimmerColor,
                        ),
                        counterText: "",
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color:Clr().black2),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: InkWell(
                            child: Icon(
                              isHidden1
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                isHidden1 ^= true;
                              });
                            },
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (enterPassCtrl.text != confirmPassCtrl.text) {
                          return "Password doesn't not match";
                        }
                        if (value!.isEmpty || !RegExp(r'(.{6,})').hasMatch(value)) {
                          return Str().invalidPassword;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height:Dim().d28,
                    ),
                    // Text(
                    // 'By signing up, you are agreeing to our terms of \nservice and privacy policy.',textAlign: TextAlign.center,
                    //   style: Sty()
                    //       .mediumText
                    //       .copyWith(height: 1.7,color: Clr().black, fontWeight: FontWeight.w500,fontSize: 15),
                    // ),
                RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'By signing up, you are agreeing to our',
                            style: TextStyle(
                              color: Color(0xff3F3F41),
                              fontSize: 15,fontWeight: FontWeight.w400
                            )
                            ),
                       TextSpan(
                            text: ' terms of\n',
                            style: TextStyle(
                              color: Color(0xffFA3C5A),
                                fontSize: 15,fontWeight: FontWeight.w400
                            )) ,
                        TextSpan(
                            text: 'service ',
                            style: TextStyle(
                                color: Color(0xffFA3C5A),
                                fontSize: 15,fontWeight: FontWeight.w400,
                            )),
                        TextSpan(
                            text: " and ",style: TextStyle(
                          color: Color(0xff3F3F41),
                            fontSize: 15,fontWeight: FontWeight.w400
                        )),
                        TextSpan(
                            text: ' privacy policy',
                            style: TextStyle(
                              color:Color(0xffFA3C5A),
                                fontSize: 15,fontWeight: FontWeight.w400
                            )),
                      ],
                    )),
                    SizedBox(
                      height: Dim().d16,
                    ),
                    SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                             STM().redirect2page(ctx, MatchPage());
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
                  STM().redirect2page(ctx, SignIn());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Sty().smallText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Clr().black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: Sty().smallText.copyWith(
                            color: Clr().primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Dim().d16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
