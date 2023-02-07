import 'package:cusp/values/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'manage/static_method.dart';
import 'premium.dart';
import 'values/dimens.dart';
import 'values/strings.dart';
import 'values/styles.dart';

void main() => runApp(MyProfile());

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

int _selectedIndex = 0;

class _MyProfileState extends State<MyProfile> {
  late BuildContext ctx;
  // final List<int> selectedIndexes = [];
  final List<String> _wordName = [
    "Photography",
    "Yoga",
    "Video games",
    "Video game",
  ];

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController enterPassCtrl = TextEditingController();
  bool isHidden = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
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
          'My Profile',
          style:
              Sty().largeText.copyWith(color: Clr().primaryColor, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dim().d36),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dim().d8,
                    ),
                    TextFormField(
                      // controller: emailCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter First name ",
                        labelText: 'First name',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                              color: Clr().shimmerColor,
                            ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: emailCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter Last name",
                        labelText: 'Last name',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                              color: Clr().shimmerColor,
                            ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: emailCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter First name ",
                        labelText: 'Gender',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                              color: Clr().shimmerColor,
                            ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: mobileCtrl,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        if (value.length != 10) {
                          return 'Mobile number digits must be 10';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter Mobile Number",
                        labelText: 'Mobile Number',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                              color: Clr().shimmerColor,
                            ),
                        counterText: "",
                      ),
                      maxLength: 10,
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter Email Address ",
                        labelText: 'Email',
                        labelStyle: TextStyle(color:Clr().black2),
                        hintStyle: Sty().mediumText.copyWith(
                              color: Clr().shimmerColor,
                            ),
                        counterText: "",
                      ),
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                    TextFormField(
                      // controller: passwordCtrl,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isHidden,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(20),

                        // label: Text('Enter Your Number'),
                        hintText: "Enter your Password",
                        hintStyle: Sty().mediumText.copyWith(
                              color: Clr().shimmerColor,
                            ),
                        counterText: "",
                        labelText: 'Password',
                        labelStyle: TextStyle(color:Clr().black2),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: InkWell(
                            child: Icon(
                              isHidden
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                isHidden ^= true;
                              });
                            },
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'(.{6,})').hasMatch(value)) {
                          return Str().invalidPassword;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: Dim().d28,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dim().d24),
                      child: Text(
                        'Interests',
                        style: Sty().largeText.copyWith(
                            color: Clr().black, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dim().d24, vertical: Dim().d12),
                    child: GridView.builder(
                      shrinkWrap: true,
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
                            color: _selectedIndex == index
                                ? Clr().primaryColor
                                : Clr().primaryColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xff3F3F41),
                                width: 0.2,
                              ),
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
                                        style: TextStyle(color: Clr().white)),
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
                        'Tell us',
                        style: Sty().largeText.copyWith(
                            color: Clr().black, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:Dim().d32 ,left: Dim().d32,top:Dim().d16 ,bottom: Dim().d20,),
                    child: TextFormField(
                      maxLines: 5,
                      // controller: mobileCtrl,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Clr().lightGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Clr().transparent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Clr().primaryColor, width: 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        contentPadding: EdgeInsets.all(18),
                        // label: Text('Enter Your Number'),
                        hintText: 'Tell us...',
                        counterText: "",
                      ),
                    ),
                  ),


                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: Dim().d24),
                      child: Text(
                        'Prompts',
                        style: Sty().largeText.copyWith(
                            color: Clr().black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dim().d32),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dim().d20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Rate my fit',
                            style: Sty().mediumText.copyWith(
                                color: Color(0xffFA3C5A),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d4,
                        ),
                        TextFormField(
                          readOnly: true,
                          // controller: emailCtrl,
                          keyboardType: TextInputType.name,

                          decoration: InputDecoration(
                            fillColor: Clr().lightGrey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Clr().transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Clr().primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Lorem Ipsum is simply dummy',
                            hintStyle: TextStyle(
                                color: Color(0xff3F3F41), fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'I go crazy for',
                            style: Sty().mediumText.copyWith(
                                color: Color(0xffFA3C5A),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d4,
                        ),
                        TextFormField(
                          readOnly: true,
                          // controller: emailCtrl,
                          keyboardType: TextInputType.name,

                          decoration: InputDecoration(
                            fillColor: Clr().lightGrey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Clr().transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Clr().primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Lorem Ipsum is simply dummy',
                            hintStyle: TextStyle(
                                color: Color(0xff3F3F41), fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'The best way to ask me out is by',
                            style: Sty().mediumText.copyWith(
                                color: Color(0xffFA3C5A),
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: Dim().d4,
                        ),
                        TextFormField(
                          readOnly: true,
                          // controller: emailCtrl,
                          keyboardType: TextInputType.name,

                          decoration: InputDecoration(
                            fillColor: Clr().lightGrey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Clr().transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Clr().primaryColor, width: 1.0),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hintText: 'Lorem Ipsum is simply dummy',
                            hintStyle: TextStyle(
                                color: Color(0xff3F3F41), fontSize: 14),
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
                        'Gallery',
                        style: Sty().largeText.copyWith(
                            color: Clr().black, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dim().d8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dim().d20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 140,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // return  DottedBorder(
                        //     color: Colors.red,//color of dotted/dash line
                        //     strokeWidth: 2, //thickness of dash/dots
                        //     radius: Radius.circular(5),
                        //     borderType: BorderType.RRect,
                        //     dashPattern: [10,6],
                        //     child: Container(
                        //       child: Center(child: InkWell(
                        //           onTap: (){},
                        //           child: SvgPicture.asset('assets/addphoto.svg',height: 40,width: 40))),
                        //       decoration: BoxDecoration(color: Color(0xffBAF1E4),borderRadius: BorderRadius.all(Radius.circular(5))),
                        //     ));

                        return Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset("assets/myprofileboyimg.png"),
                            // CircleAvatar(
                            //   radius: 70,
                            //   backgroundImage:
                            //   AssetImage('assets/myprofileboyimg.png'),
                            // ),
                            Positioned(
                              right: -12,
                              bottom: -14,
                              child: SizedBox(
                                height: 40,width: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0.5,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    onPressed: () {},
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/cutnew.svg',
                                        width: 25,
                                        height: 25,
                                      ),
                                    )),
                              ),
                            ), // Front image
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dim().d32),
                    child: SizedBox(
                      height: 65,
                      width: 370,
                      child: ElevatedButton(
                          onPressed: () {
                            STM().redirect2page(ctx, Premium());
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
                            'Save Changes',
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
    );
  }
}
