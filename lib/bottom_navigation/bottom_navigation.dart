import 'package:flutter/material.dart';
import '../around_you.dart';
import '../homepage.dart';
import '../manage/static_method.dart';
import '../messages_page.dart';
import '../mymatches.dart';
import '../values/colors.dart';

Widget bottomBarLayout(ctx, index) {

  return BottomNavigationBar(
    elevation: 0,
    backgroundColor: Color(0xffBAF1E4),
    selectedItemColor: Clr().red,
    unselectedItemColor: Clr().white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    selectedFontSize: 0,

    currentIndex: 1,
    onTap: (i) async {
      switch (i) {
        case 0:
            STM().replacePage(ctx, HomePage());
          break;
        case 1:
            STM().replacePage(ctx, AroundYou());
          break;
        case 2:
           STM().replacePage(ctx, MessagesPage());
          break;
        case 3:
           STM().replacePage(ctx, MyMatches());
          break;
      }
    },
    items: STM().getBottomList(index),
  );
}