import 'package:cusp/add%20_your_selfie.dart';
import 'package:cusp/Let’s start with2.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'sign_in.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

void main() => runApp(YourInterests());

class YourInterests extends StatefulWidget {
  @override
  State<YourInterests> createState() => _YourInterestsState();
}

class _YourInterestsState extends State<YourInterests> {
  late BuildContext ctx;
  int _selectedIndex = 0;
  TextEditingController nameCtrl = TextEditingController();

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
          'Your interests',
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
                    STM().redirect2page(ctx, AddSelfie());
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
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dim().d20,
                ),
                Text(
                  "Select some of your interests and let everyone\n know what you’re passionate about",
                  style: Sty().smallText.copyWith(
                      height: 1.5, fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: Dim().d16,),
                // GridView.count(
                //   scrollDirection: Axis.vertical,
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 10.0,
                //   mainAxisSpacing: 10.0,
                //   shrinkWrap: true,
                //   children: List.generate(10, (index) {
                //     return Padding(
                //       padding: const EdgeInsets.all(10.0),
                //       child: InkWell(
                //         onTap: (){},
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.red,
                //           ),
                //         ),
                //       ),
                //     );
                //   },),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 14,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 60,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (BuildContext context, int index ) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Card(
                          color: _selectedIndex == index
                              ? Color(0xffFA3C5A)
                              : null,

                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color(0xff3F3F41),width: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.camera_alt),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Photography"),
                                      ),
                                    ],
                                  ),
                                )),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: Dim().d20,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dim().d16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dim().d16,
                      ),
                      SizedBox(
                        height: 65,
                        width: 370,
                        child: ElevatedButton(
                            onPressed: () {
                              STM().redirect2page(ctx, AddSelfie());
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
                              'Continue',
                              style: Sty().largeText.copyWith(
                                  color: Clr().white,
                                  fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
