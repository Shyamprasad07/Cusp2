import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'forgot _password2.dart';
import 'manage/static_method.dart';
import 'sign_in.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

void main() => runApp(ForgetPass());

class ForgetPass extends StatefulWidget {
  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  late BuildContext ctx;
  TextEditingController mobileCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

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
              Padding(
                padding: EdgeInsets.all(Dim().d16),
                child: Column(
                  children: [
                    SizedBox(height: Dim().d32,),
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
                      height: Dim().d32,
                    ),
              SizedBox(
                height: 65,
                width: 370,
                child: ElevatedButton(
                    onPressed: () {
                       STM().redirect2page(ctx, ForgetPass2());
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
                      'Send OTP',
                      style: Sty().largeText.copyWith(
                          color: Clr().white, fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
    ]
    )
    )
      )
    );
  }
}
