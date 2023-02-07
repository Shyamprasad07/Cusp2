import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cusp/my_location.dart';
import 'package:cusp/myprofile.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'account.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';
import 'values/dimens.dart';

import 'values/styles.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BuildContext ctx;

  bool isChecked = false;
  String?  sGender;
  List<dynamic> GenderList = ["₹50 Plan, includes 1 search", "₹150 Plan, includes 10 searches","₹200 Plan, includes 20 searches",];

  TextEditingController nameCtrl = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 0),
      resizeToAvoidBottomInset: false,
      backgroundColor: Clr().white,
      appBar: AppBar(
        toolbarHeight: Dim().d100,
        leadingWidth: 250,
        leading: Padding(
          padding: EdgeInsets.only(left: Dim().d16),
          child: Image.asset('assets/cuslogo.png', height: 200, width: 200),
        ),
        // title:  SvgPicture.asset('assets/home.svg'),
        actions: [
          InkWell(
            onTap: (){
              STM().redirect2page(ctx, Account());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d24),
              child: SvgPicture.asset(
                'assets/profile.svg',
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        controller: ScrollController(),
        physics: BouncingScrollPhysics(),
        children: [
          Column(

            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        'assets/locationhome.svg',
                      ),
                      Text(
                          "Shop No 1ganesh Nagar, Thane West,\nMumbai, Maharashtra 400607"),
                      InkWell(
                        onTap: (){
                          STM().redirect2page(ctx, MyLocation());
                        },
                        child: SvgPicture.asset(
                          'assets/edit.svg',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dim().d72,
                  ),

                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,


                    children: [
                      // SvgPicture.asset(
                      //   'assets/eye_contact.svg',width: 100,height: 55,
                      // ),
                     Container(
                       height: MediaQuery.of(context).size.height * 0.65,
                       width: MediaQuery.of(context).size.width ,

                        child: Image.asset(
                          'assets/GoogleMap.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(

                          top: -64,

                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _plansDialog(ctx);

                              });
                              // _plansDialog(ctx);

                            },
                            child: SvgPicture.asset('assets/eyefinal.svg',width: 185,height: 110),
                          )),
                    ],

                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  _plansDialog(ctx) {

    AwesomeDialog(
      context: ctx,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      alignment: Alignment.centerLeft,
      isDense: true,
      body: StatefulBuilder(
        builder: (BuildContext context,setState){
          return Container(
            padding: EdgeInsets.all(Dim().d4),
            child: Column(
              children: [
                SizedBox(height: 12,),
                Text('Your 10 free searches for the day \nare over ', textAlign: TextAlign.center,
                    style: Sty().largeText.copyWith(
                        color: Color(0xffFA3C5A),
                        fontSize: 18)),
                SizedBox(height: Dim().d16,),
                Text(
                  "You get 10 free searches every day for\nthe first 30 days. Please come back\ntomorrow.",
                  textAlign: TextAlign.center,
                  style: Sty().smallText.copyWith(
                      height: 1.5,fontSize: 16,fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: Dim().d8,),
                Text('OR', textAlign: TextAlign.center,
                    style: Sty().mediumText.copyWith(
                        color: Color(0xffFA3C5A), fontWeight: FontWeight.w600,
                        fontSize: 18)),
                SizedBox(height: Dim().d8,),
                Padding(
                  padding: EdgeInsets.only(left: Dim().d24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Subscribe to the below plans',
                        style: Sty().mediumText.copyWith(
                            color: Color(0xffFA3C5A), fontWeight: FontWeight.w600,
                            fontSize: 18)),
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
                        value: "₹50 Plan, includes 1 search",
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
                        value: "₹150 Plan, includes 10 searches",
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
                        value: "₹200 Plan, includes 20 searches",
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
                    ],
                  ),
                ),




                SizedBox(height: Dim().d20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dim().d8),
                  child: SizedBox(
                    height: 65,
                    width: 370,
                    child: ElevatedButton(
                        onPressed: () {
                          // STM().redirect2page(ctx, ForgetPass2());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Clr().primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text(
                          'Subscribe',
                          style: Sty().largeText.copyWith(
                              color: Clr().white, fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                SizedBox(height: Dim().d24,),
              ],
            ),
          );
        },
      ),
    ).show();


  }
}
