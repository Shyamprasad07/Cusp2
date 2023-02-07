import 'package:cusp/values/colors.dart';
import 'package:cusp/your_interests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'chatpage.dart';
import 'manage/static_method.dart';
import 'premium.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class MessagesPage extends StatefulWidget {
  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late BuildContext ctx;
  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      bottomNavigationBar: bottomBarLayout(ctx, 2),
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
          ' Messages',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d20),
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 16,
                      // padding: EdgeInsets.only(top: 2,bottom: 12),
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom:Dim().d20),
                          child: messagesLayout(ctx, index, list),
                        );
                      }),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget messagesLayout(ctx, index,list) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.075),
            spreadRadius: 0.1,
            blurRadius: 6,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/messagesgirl.png'),
            radius: Dim().d32,
          ),
          SizedBox(
            width: Dim().d16,
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                STM().redirect2page(ctx, ChatPage());
              }
              ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Emelie',
                        style: TextStyle( fontSize: 16,fontWeight: FontWeight.w500),

                      ),
                      Text('25-11-2022  3:02 PM', style: TextStyle( fontSize: 12,fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dim().d6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Hey! What’s up, long time Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week ..', overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle( fontSize: 14,fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          color: Colors.red
                        ),
                        child: Center(child: Text("1", style: TextStyle( fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),),

                      )

                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
