import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'sign_in.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

void main() => runApp(ForgetPass2());

class ForgetPass2 extends StatefulWidget {
  @override
  State<ForgetPass2> createState() => _ForgetPass2State();
}

class _ForgetPass2State extends State<ForgetPass2> {
  late BuildContext ctx;
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
          'Forgot password',
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
        padding: EdgeInsets.symmetric(horizontal: Dim().d16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: Dim().d32,),
              Padding(
                padding: EdgeInsets.all(Dim().d16),
                child: Column(
                  children: [
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
                        hintText: "Enter your New Password",
                        hintStyle: Sty().mediumText.copyWith(
                          color: Clr().shimmerColor,
                        ),
                        counterText: "",
                        labelText: 'New Password',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
