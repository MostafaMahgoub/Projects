import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradproject/screens/privileges/privileges_student.dart';
import 'package:gradproject/screens/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../size_config.dart';
import 'profile_menu.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Bodystudent extends StatefulWidget {
  @override
  _BodystudentState createState() => _BodystudentState();
}

class _BodystudentState extends State<Bodystudent> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  String sname = "", email = "", id = "", level = "";
  _clear() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  _read() async {
    final pref = await SharedPreferences.getInstance();

    sname = await pref.get('uname');
    email = await pref.get('uemail');
    id = await pref.get('uid');
    level = await pref.get('level');

    print("name:$sname");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _read(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      fit: StackFit.expand,
                      // ignore: deprecated_member_use
                      overflow: Overflow.visible,
                      children: [
                        CircleAvatar(
                          backgroundImage:_imageFile == null
                              ?
                              AssetImage("assets/images/ASLOGO.png"): FileImage(File(_imageFile.path)),
                        ),
                        Positioned(
                          right: -16,
                          bottom: 0,
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.white),
                              ),
                              color: Color(0xFFF5F6F9),
                              onPressed: () {showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );},
                              child: SvgPicture.asset(
                                  "assets/icons/Camera Icon.svg"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    "Hello, Student",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(25),
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Student Name: ${sname}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Student Email: ${email}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Student ID: ${id}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Student Level: ${level}",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 150),
                  ProfileMenu(
                    text: "My privileges",
                    icon: "assets/icons/Question mark.svg",
                    press: () {
                      Navigator.pushNamed(context, privilegesstudent.routeName);
                    },
                  ),
                  ProfileMenu(
                    text: "Log Out",
                    icon: "assets/icons/Log out.svg",
                    press: () {
                      _clear();
                      Navigator.pushReplacementNamed(
                          context, SignInScreen.routeName);
                    },
                  ),
                ],
              ),
            );
          }
        });
  }
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
