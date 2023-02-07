import 'package:cusp/myprofile.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'around_match.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late BuildContext ctx;

  double _value = 20;


  TextEditingController nameCtrl = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final items = [
    'My Profile',
    'My Matches',
    'Privacy Policy',
    'Terms & Conditions',
    'About Us',
    'Contact Us',
    'Log Out'
  ];

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 0),
      resizeToAvoidBottomInset: false,
      backgroundColor: Clr().white,
      appBar: AppBar(
        toolbarHeight: Dim().d100,
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.all(Dim().d20),
          child: InkWell(
              onTap: () {
                STM().back2Previous(ctx);
              },
              child: SvgPicture.asset('assets/back.svg')),
        ),
        title: Text(
          'Account',
          style:
              Sty().largeText.copyWith(color: Clr().primaryColor, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: Dim().d16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: Dim().d16,
                ),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/accountprofile.png'),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                            height: 40,
                            width: 40,
                            child: SvgPicture.asset('assets/camera.svg',
                                height: 40, width: 40)),
                      ), // Front image
                    ],
                  ),
                ),
                SizedBox(
                  height: Dim().d32,
                ),
                Slider(
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,

                  activeColor: Clr().primaryColor,
                  label: '${_value.round().toString()}',

                  inactiveColor: Color(0xffDBDBDB),
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                SizedBox(
                  height: Dim().d16,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            index == 0
                                ? STM().redirect2page(ctx, MyProfile())
                                :index== 1?  STM().redirect2page(ctx,AroundMatch()) : null;
                          },
                          child: ListTile(
                            title: Text(items[index]),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,
                                color: Colors.black),
                          ),
                        ),
                        Divider(
                          color: Colors.redAccent,
                          endIndent: 10,
                          indent: 10,
                        ), //
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: Dim().d32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
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
                          'Delete my account',
                          style: Sty().largeText.copyWith(
                              color: Clr().primaryColor,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                SizedBox(
                  height: Dim().d32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
