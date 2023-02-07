import 'package:cusp/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'values/dimens.dart';
import 'values/styles.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late BuildContext ctx;
  List<dynamic> list = [];

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
          'Jessica Parker',
          style: Sty().largeText.copyWith(
              color: Clr().primaryColor,
              fontSize: 22),
        ) ,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dim().d32),
              child: Column(
                children: [
                  SizedBox(
                    height: Dim().d32,
                  ),

                  SizedBox(
                    height: Dim().d24,
                  ),




                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: TextFormField(
                          maxLines: 1,
                          // controller: mobileCtrl,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                          decoration: InputDecoration(

                            fillColor: Color(0xffBAF1E4),
                            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(),),
                                // borderSide: BorderSide(color: Color(0xffBAF1E4),width: 5)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Clr().primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            contentPadding: EdgeInsets.all(18),
                            // label: Text('Enter Your Number'),
                            hintText: 'Your message',
                            counterText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dim().d16,
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
                          child: SvgPicture.asset("assets/chatpageimg.svg"
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dim().d32,
                  ),

                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(32.0),
          //   child: Row(
          //     children: [
          //       SizedBox(
          //         width: MediaQuery.of(context).size.width * 0.65,
          //         child: TextFormField(
          //           maxLines: 1,
          //           // controller: mobileCtrl,
          //           keyboardType: TextInputType.name,
          //           validator: (value) {
          //             if (value!.isEmpty) {
          //               return 'This field is required';
          //             }
          //           },
          //           decoration: InputDecoration(
          //             fillColor: Clr().lightGrey,
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(15),
          //                 borderSide: BorderSide(color: Clr().transparent)),
          //             focusedBorder: OutlineInputBorder(
          //               borderSide: BorderSide(color: Clr().primaryColor, width: 1.0),
          //               borderRadius: BorderRadius.circular(15.0),
          //             ),
          //             contentPadding: EdgeInsets.all(18),
          //             // label: Text('Enter Your Number'),
          //             hintText: 'Your message',
          //             counterText: "",
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: Dim().d16,
          //       ),
          //       SizedBox(
          //         width: 54,
          //         height: 54,
          //         child: ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               elevation: 0,
          //               backgroundColor: Clr().primaryColor,
          //               shape: RoundedRectangleBorder(
          //                   borderRadius:
          //                   BorderRadius.circular(15))),
          //           onPressed: () {
          //             STM().back2Previous(ctx);
          //           },
          //           child: SvgPicture.asset("assets/chatpageimg.svg"
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

}
