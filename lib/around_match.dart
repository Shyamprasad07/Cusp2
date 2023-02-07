import 'package:cusp/profile_details.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';
import 'values/dimens.dart';

class AroundMatch extends StatefulWidget {
  @override
  State<AroundMatch> createState() => _AroundMatchState();
}

class _AroundMatchState extends State<AroundMatch> {
  late BuildContext ctx;
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {
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
                padding: EdgeInsets.symmetric(horizontal: Dim().d16),
                child: Column(
                  children: [
                    Text(
                      '"Here are some other people around you \n who also made eye contact right now"',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: Dim().d16,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                          child: Column(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    height: 350,
                                    width: 350,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/girlabc.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ), // Back image
                                  Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 100,
                                          width: 350,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20)),
                                            color: Color(0x50000000),
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 8.0),
                                                    child: Text(
                                                      " Jessica Parker",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 70,
                                                    height: 45,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            elevation: 0.5,
                                                            backgroundColor:
                                                                Colors.white,

                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5))),
                                                        onPressed: () {},
                                                        child: SvgPicture.asset(
                                                          'assets/cut.svg',
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    height: 45,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            elevation: 0.5,
                                                            backgroundColor:
                                                                Colors.white,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5))),
                                                        onPressed: () {},
                                                        child: SvgPicture.asset(
                                                          'assets/right img.svg',
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )), // Front image
                                ],
                              ),
                            ],
                          ),
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
}
