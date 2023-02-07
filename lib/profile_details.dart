import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'manage/static_method.dart';
import 'values/colors.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

void main() => runApp(ProfileDetails());

class ProfileDetails extends StatefulWidget {
  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late BuildContext ctx;
  final List<String> _wordName = [
    "Photography",
    "Yoga",
    "Video games",
    "Video game",
  ];
  int _selectedIndex = 0;

  final List<String> imageList = ["assets/detailspagegirl.png"];
  List<dynamic> resultList = [];

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      backgroundColor: Clr().transparent,
      extendBodyBehindAppBar: true,
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
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: true,
              height: 850,
              enableInfiniteScroll: true,
              enlargeFactor: 2,
              autoPlay: true,
            ),
            items: imageList
                .map((e) => ClipRRect(
                      child: Stack(
                        fit: StackFit.loose,
                        children: <Widget>[
                          Image.asset(
                            e,
                            cacheWidth: 650,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
          Positioned(
            top: 360,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Clr().white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Dim().d24,top: Dim().d24,right: Dim().d24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jessica Parker, 23',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffFA3C5A),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 54,
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Clr().primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: () {
                                    STM().back2Previous(ctx);
                                  },
                                  child: SvgPicture.asset("assets/messagesend.svg"
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dim().d16,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: Dim().d24),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: Dim().d32, top: Dim().d8),
                            child: Text(
                              'Female',
                              style: TextStyle(
                                  color: Color(0xffFA3C5A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d24,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: Dim().d24),
                            child: Text(
                              'About',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d12,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: Dim().d32,),
                            child: Text(
                              'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..',
                              style: TextStyle(
                                  color: Color(0xff787882), fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d24,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: Dim().d24),
                            child: Text(
                              'Interests',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dim().d24, vertical: Dim().d12),
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 60,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                child: Card(
                                  elevation: 0,
                                  color: _selectedIndex == index
                                      ? Color(0xffBAF1E4)
                                      : Color(0xffBAF1E4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.camera_alt),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_wordName[index],
                                              style: TextStyle(
                                                  color: Clr().black)),
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: Dim().d24),
                            child: Text(
                              'Prompts',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dim().d32),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Rate my fit',
                                  style: Sty().mediumText.copyWith(
                                      color: Color(0xffFA3C5A),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Lorem Ipsum is simply dummy ',
                                  style: TextStyle(
                                      color: Color(0xff787882), fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: Dim().d12,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'I go crazy for',
                                  style: Sty().mediumText.copyWith(
                                      color: Color(0xffFA3C5A),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Lorem Ipsum is simply dummy ',
                                  style: TextStyle(
                                      color: Color(0xff787882), fontSize: 14),
                                ),
                              ),


                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dim().d20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: Dim().d24),
                            child: Text(
                              'Other Images',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d16,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dim().d20),
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            itemCount: 5,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 140,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.asset("assets/profile_girl2.png");
                            },
                          ),
                        ),
                        SizedBox(
                          height: Dim().d32,
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dim().d32),
                          child: SizedBox(
                            height: 65,
                            width: 370,
                            child: ElevatedButton(
                                onPressed: () {
                                  // STM().redirect2page(ctx, Premium());
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
                                  // if (_formKey.currentState!.validate()) {
                                  //   setState(() {
                                  //     // registerSend();
                                  //   });
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Clr().primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                child: Text(
                                  ' Say “Hi”',
                                  style: Sty().largeText.copyWith(
                                      color: Clr().white,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
