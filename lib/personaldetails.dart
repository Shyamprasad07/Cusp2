import 'package:cusp/Let’s start with2.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'sign_in.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';
import 'your_interests.dart';

void main() => runApp(PersonalDetails());

class PersonalDetails extends StatefulWidget {
  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  late BuildContext ctx;
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool isHidden = true;
  bool isHidden1 = true;
  Future datePicker() async {
    DateTime? picked = await showDatePicker(
      context: ctx,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(primary: Clr().primaryColor),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      //Disabled past date
      //firstDate: DateTime.now().subtract(Duration(days: 1)),
      //Disabled future date
      //lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        String s = STM().dateFormat('yyyy-MM-dd', picked);
        dobCtrl = TextEditingController(text: s);
      });
    }
  }

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
          'Personal details',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 20),
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
                    STM().redirect2page(ctx, YourInterests());
                  },
                  child: Text(
                    'Skip',
                    style: Sty().mediumText.copyWith(
                        color: Color(0xff3F3F41), fontSize: 16),
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(height: Dim().d16,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dim().d16),
                child: Column(
                  children: [
                    TextFormField(
                      // controller: emailCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
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
                        hintText: "Enter First name ",
                        labelText: 'First name',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                          color: Clr().shimmerColor,
                        ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: emailCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
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
                        hintText: "Enter Last name",
                        labelText: 'Last name',
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
                      readOnly: true,
                      onTap: () {
                        datePicker();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date of birth is required';
                        }
                      },

                      // controller: mobileCtrl,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: Color(0xffBAF1E4),
                        filled: true,
                        prefixIcon: Icon(Icons.calendar_month,color: Colors.red ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: EdgeInsets.all(22),

                        // label: Text('Enter Your Number'),
                        hintText: '"Select your date of birth"',
                        hintStyle: TextStyle( color: Colors.redAccent,fontWeight: FontWeight.w500),
                        counterText: "",
                      ),

                    ),


                    SizedBox(
                      height: Dim().d32,
                    ),
                    SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                              STM().redirect2page(ctx, YourInterests());
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
                            'Confirm',
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
      ),
    );
  }
}
