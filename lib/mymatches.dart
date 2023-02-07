import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'manage/static_method.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class MyMatches extends StatefulWidget {
  @override
  State<MyMatches> createState() => _MyMatchesState();
}

class _MyMatchesState extends State<MyMatches> {
  late BuildContext ctx;


  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 3),
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
          ' My Matches',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 14,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left:Dim().d24,right:Dim().d24,bottom: Dim().d12 ),
                  child: Card(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xff3F3F41),width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child: Padding(
                      padding: EdgeInsets.all(Dim().d12),
                      child: Row(
                        children: [
                          Image.asset('assets/mymatches.png',height: 80,width: 66),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:8),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Jessica Parker',
                                                style:
                                                Sty().mediumText.copyWith(
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontSize: 16,
                                                )),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Row(children: [
                                              Text('Age :',
                                                  style:
                                                  Sty().mediumText.copyWith(
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize: 16,

                                                  )),
                                              Text(' 5Y',
                                                style: TextStyle(
                                                    color: Color(0xff787882), fontSize: 16),
                                                  ),
                                              SizedBox(
                                                width: Dim().d16,
                                              ),

                                              Text('Sex :',
                                                  style:
                                                  Sty().mediumText.copyWith(
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontSize: 16,
                                                  )),
                                              Text(' Female',
                                                style: TextStyle(
                                                    color: Color(0xff787882), fontSize: 16),),
                                            ],),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text('My name is Jessica Parker and ...',style: TextStyle(
                                                color: Color(0xff787882), fontSize: 15),)
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),

                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
