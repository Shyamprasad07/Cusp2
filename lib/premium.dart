import 'package:cusp/values/colors.dart';
import 'package:cusp/your_interests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(Premium());

class Premium extends StatefulWidget {
  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  late BuildContext ctx;


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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Dim().d36,
              ),
              Center(child: Image.asset('assets/premiumfe.png')),
              SizedBox(
                height: Dim().d16,
              ),
              Text(
                ' Premium features',
                style: Sty().largeText.copyWith(
                    color: Clr().black,
                    fontSize: 25,fontWeight: FontWeight.w500),
              ) ,
              SizedBox(
                height: Dim().d4,
              ),
              Text(
                'Coming soon',
                style: Sty().largeText.copyWith(
                    color: Clr().primaryColor,
                    fontSize: 22,fontWeight: FontWeight.w500),
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}
