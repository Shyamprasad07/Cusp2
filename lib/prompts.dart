import 'package:cusp/values/colors.dart';
import 'package:cusp/your_interests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'premium.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(Prompts());

class Prompts extends StatefulWidget {
  @override
  State<Prompts> createState() => _PromptsState();
}

class _PromptsState extends State<Prompts> {
  late BuildContext ctx;
  TextEditingController nameCtrl = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  String? dayValue;
  List<String> dayList = [
    'My shower song ...',
    'My dating elevator pitch is..',
    'My shower song is...',
    'My dating elevator pitch is...',
  ];
  String t = "0";

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
          ' Prompts',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dim().d32),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dim().d32,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: Dim().d16, vertical: Dim().d2),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.8,
                              blurRadius: 2,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: Clr().transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Clr().red)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dayValue,
                          hint: Text('Select Prompts'),
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 28,
                          ),
                          style: TextStyle(color: Color(0xff787882)),
                          items: dayList.map((String string) {
                            return DropdownMenuItem<String>(
                              value: string,
                              child: Text(
                                string,
                                style: TextStyle(
                                    color: Color(0xff787882), fontSize: 14),
                              ),
                            );
                          }).toList(),
                          onChanged: (t) {
                            // STM().redirect2page(ctx, Home());
                            setState(() {
                              dayValue = t!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dim().d24,
                    ),
                    TextFormField(
                      maxLines: 5,
                      // controller: mobileCtrl,
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
                          borderSide: BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: EdgeInsets.all(18),
                        // label: Text('Enter Your Number'),
                        hintText: 'Tell us...',
                        counterText: "",
                      ),
                    ),
                    Align(
                      alignment:  Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: Dim().d8),
                        child: Text(
                          'Add new prompts',
                          style: Sty().largeText.copyWith(
                              color: Clr().red,
                              fontSize: 14,fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: Dim().d32,
                    ),

                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SizedBox(
                    height: 65,
                    width: 370,
                    child: ElevatedButton(
                        onPressed: () {
                          STM().redirect2page(ctx, Premium());
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
                          'Save prompts',
                          style: Sty().largeText.copyWith(
                              color: Clr().white, fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                SizedBox(
                  height: Dim().d64,
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
