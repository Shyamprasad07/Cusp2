import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cusp/profile_details.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(AroundYou());

class AroundYou extends StatefulWidget {
  @override
  State<AroundYou> createState() => _AroundYouState();
}

class _AroundYouState extends State<AroundYou> {
  late BuildContext ctx;

  RangeValues _currentRangeValues =  RangeValues(16,60);
  TextEditingController nameCtrl = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    ctx = context;



    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 1),
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
          'Around You',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          SvgPicture.asset(
            'assets/award.svg',
          ),
          InkWell(
            onTap: (){
              _plansDialog(ctx);
              // STM().redirect2page(ctx, MyProfile());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d24),
              child: SvgPicture.asset(
                'assets/settings.svg',
                height: 26,
                width: 26,
              ),
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dim().d32),
                child: Column(
                  children: [

                    GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 15,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 140,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return   Column(
                          children: [
                            InkWell(
                              onTap: () {
                                STM().redirect2page(ctx, ProfileDetails());
                              },
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('assets/around.png'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text("Jessica Parker")
                          ],
                        );
                      },
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

  bool isChecked = true;
  String?  sGender;
  List<dynamic> GenderList = ["Men", "Women","Transgender",];

  _plansDialog(ctx) {


    AwesomeDialog(
      context: ctx,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      alignment: Alignment.centerLeft,
      isDense: true,
      body: Container(
        padding: EdgeInsets.all(Dim().d4),
        child: Column(
          children: [
            SizedBox(height: 12,),
            Text(
              "Looking For:",
              textAlign: TextAlign.center,
              style: Sty().smallText.copyWith(
                  height: 1.5,fontSize: 20,fontWeight: FontWeight.w600
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d16),
              child: Column(
                children: [
                  RadioListTile<dynamic>(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Dim().d2,
                    ),
                    activeColor: Clr().primaryColor,
                    value: "Men",
                    groupValue: sGender,
                    onChanged: (value) {
                      setState(() {
                        sGender = value!;
                      });
                    },
                    title: Transform.translate(
                      offset: Offset(-6,0),

                      child: Text(
                        GenderList[0],
                        style: Sty().mediumText,
                      ),
                    ),
                  ),
                  RadioListTile<dynamic>(
                    contentPadding: EdgeInsets.all(Dim().d0),
                    activeColor: Clr().primaryColor,
                    value: "Women",
                    groupValue: sGender,
                    onChanged: (value) {
                      setState(() {
                        sGender = value!;
                      });
                    },
                    title: Transform.translate(
                      offset: Offset(-6,0),
                      child: Text(
                        GenderList[1],
                        style: Sty().mediumText.copyWith(
                          fontFamily: 'outfit',
                        ),
                      ),
                    ),
                  ),
                  RadioListTile<dynamic>(
                    dense: true,
                    contentPadding: EdgeInsets.all(Dim().d0),
                    activeColor: Clr().primaryColor,
                    value: "Transgender",
                    groupValue: sGender,
                    onChanged: (value) {
                      setState(() {
                        sGender = value!;
                      });
                    },
                    title: Transform.translate(
                      offset: Offset(-6,0),
                      child: Text(
                        GenderList[2],
                        style: Sty().mediumText.copyWith(
                          fontFamily: 'outfit',
                        ),
                      ),
                    ),
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    max: 100,
                    divisions: 10,
                    activeColor: Clr().primaryColor,
                    inactiveColor: Color(0xffDBDBDB),
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ).show();
  }
}
