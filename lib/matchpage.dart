import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'matchpage2.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(MatchPage());

class MatchPage extends StatefulWidget {
  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  late BuildContext ctx;
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
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: Dim().d16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Dim().d64,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 70,
                       backgroundImage: AssetImage('assets/matchimggirl.png'),
                      ),
                      SizedBox(
                        width: Dim().d8,
                      ),

                      SvgPicture.asset('assets/heartic.svg',height: 40,width: 40,),
                      SizedBox(
                        width: Dim().d8,
                      ),

                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('assets/matchimgboy.png'),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: Dim().d24,
                  ),


                  Text(
                    'It’s a Match',
                    style: Sty()
                        .largeText
                        .copyWith(color: Clr().primaryColor, fontSize: 22,fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: Dim().d16,
                  ),
                  Text(
                    "You just matched with\n Jessica Parker, you two can now chat.",
                    textAlign: TextAlign.center,
                    style: Sty().smallText.copyWith(
                        height: 1.5,fontSize: 14,fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(
                    height: Dim().d32,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65,
                          width: 370,
                          child: ElevatedButton(
                              onPressed: () {
                                STM().redirect2page(ctx, MatchPage2());
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
                                ' Say “Hi” ',
                                style: Sty().largeText.copyWith(
                                    color: Clr().white, fontWeight: FontWeight.w600),
                              )),
                        ),
                        SizedBox(
                          height: Dim().d20,
                        ),
                        SizedBox(
                          height: 65,
                          width: 370,
                          child: ElevatedButton(
                              onPressed: () {
                                // STM().redirect2page(ctx, SignUp());
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.5,
                                  backgroundColor: Colors.white,
                                  side:
                                  BorderSide(width: 1, color: Clr().primaryColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Text(
                                'Keep Searching',
                                style: Sty().largeText.copyWith(
                                    color: Clr().primaryColor,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
