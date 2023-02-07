import 'package:cusp/homepage.dart';
import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'manage/static_method.dart';
import 'matchpage.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

void main() => runApp(AddSelfie());

class AddSelfie extends StatefulWidget {
  @override
  State<AddSelfie> createState() => _AddSelfieState();
}

class _AddSelfieState extends State<AddSelfie> {
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
        title: Text(
          'Add your selfie',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextButton(
                  onPressed: () {
                    STM().redirect2page(ctx, HomePage());
                  },
                  child: Text(
                    'Skip',
                    style: Sty().mediumText.copyWith(
                        color: Color(0xff3F3F41), fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
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
                Center(child: Stack(
                  clipBehavior: Clip.none,

                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset('assets/photo.png'),// Back image
                    Positioned(
                        right: 0,
                        bottom: -12,
                        child: InkWell(
                          onTap: () {

                          },
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: SvgPicture.asset('assets/camera.svg',height: 40,width: 40)),
                        )),// Front image
                  ],
                ),),
                SizedBox(
                  height: Dim().d32,
                ),
                Text(
                  "Upload 5 photos to get better matches.",

                  style: Sty().smallText.copyWith(
                      height: 1.5,fontSize: 14,fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: Dim().d20,
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 140,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return  DottedBorder(
                          color: Colors.red,//color of dotted/dash line
                          strokeWidth: 2, //thickness of dash/dots
                          radius: Radius.circular(15),
                          borderType: BorderType.RRect,
                          dashPattern: [10,6],
                          child: Container(
                            child: Center(child: InkWell(
                                onTap: (){},
                                child: SvgPicture.asset('assets/addphoto.svg',height: 40,width: 40))),
                            decoration: BoxDecoration(color: Color(0xffBAF1E4),borderRadius: BorderRadius.all(Radius.circular(15))),

                          ));
                    },
                  ),
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
                           STM().redirect2page(ctx,HomePage());
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
                          'Next',
                          style: Sty().largeText.copyWith(
                              color: Clr().white, fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                SizedBox(
                  height: Dim().d20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
