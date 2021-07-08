import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradproject/components/custom_surfix_icon.dart';
import 'package:gradproject/components/default_button.dart';
import 'package:gradproject/screens/privileges/admin_privileges/usersinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:gradproject/constants.dart';
import 'package:gradproject/screens/profile/components/profile_menu.dart';

import '../../../size_config.dart';

class deepsearch extends StatefulWidget {
  static String routeName = "/deepsearch";

  @override
  _deepsearch createState() => _deepsearch();
}

class _deepsearch extends State<deepsearch> {
  String title = 'DropDownButton';
  String _CoursesNO;
  List _CoursesNOName = ['   NAME', '   ID', '   DEP ID'];
  int constant = 1;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _depidController = TextEditingController();


  var status;
  var data;
  var id, fname, lname, depid;
  deepsearch1({
    id,
    fname,
    lname,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final key = 'token';
    final value = pref.get(key);

    String ServerUrl = "https://extra-hint.herokuapp.com/api/auth/deep_search";
    final response = await http.post(
      ServerUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${value}'
      },
      body: {
        'first_name': fname,
        'last_name': lname,
      },
    );
    status = response.body.contains("err");
    data = jsonDecode(response.body);

    if (status) {
      Fluttertoast.showToast(
        msg: '${data}',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print("data :${data}");
    } else {
      Fluttertoast.showToast(
        msg: '${data['others'][0]}',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print("intelege: ${data}");
    }
  }

  deepsearch2({id, phone, var advid, var dep_id, var sec_id}) async {
    final pref = await SharedPreferences.getInstance();
    final key = 'token';
    final value = pref.get(key);

    String ServerUrl = "https://extra-hint.herokuapp.com/api/auth/deep_search";
    final response = await http.post(
      ServerUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${value}'
      },
      body: {
        'id': id,
      },
    );
    status = response.body.contains("err");
    data = jsonDecode(response.body);

    if (status) {
      Fluttertoast.showToast(
        msg: '${data}',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print("data :${data}");
    } else {
      Fluttertoast.showToast(
        msg: '${data[0]}',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print("intelege: ${data}");
    }
  }

  deepsearch3({
    depid,
  }) async {
    final pref = await SharedPreferences.getInstance();
    final key = 'token';
    final value = pref.get(key);

    String ServerUrl = "https://extra-hint.herokuapp.com/api/auth/deep_search";
    final response = await http.post(
      ServerUrl,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${value}'
      },
      body: {
        'dept_id': depid,
      },
    );
    status = response.body.contains("err");
    print("intelege: ${response.body}");
    data = jsonDecode(response.body);

    if (status) {
      Fluttertoast.showToast(
        msg: '${data}',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print("data :${data}");
    } else {
      Fluttertoast.showToast(
        msg: '${data}',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      print("intelege: ${data}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Deep search",
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Deep search",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter the type u want to search through",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        (constant == 1)
                            ? Visibility(
                                visible: true,
                                child: buildFirstNameFormField(),
                              )
                            : Visibility(
                                visible: false,
                                child: buildFirstNameFormField(),
                              ),
                        (constant == 1)
                            ? Visibility(
                                visible: true,
                                child: SizedBox(
                                    height: getProportionateScreenHeight(30)),
                              )
                            : Visibility(
                                visible: false,
                                child: SizedBox(
                                    height: getProportionateScreenHeight(30)),
                              ),
                        (constant == 1)
                            ? buildlastNameFormField()
                            : (constant == 1)
                                ? SizedBox(
                                    height: getProportionateScreenHeight(30))
                                : (constant == 2)
                                    ? buildIDFormField()
                                    : (constant == 2)
                                        ? SizedBox(
                                            height:
                                                getProportionateScreenHeight(
                                                    30))
                                        : (constant == 4)
                                            ? buildEmailFormField()
                                            : (constant == 4)
                                                ? SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            30))
                                                : (constant == 3)
                                                    ? buildPhoneFormField()
                                                    : (constant == 3)
                                                        ? SizedBox(
                                                            height:
                                                                getProportionateScreenHeight(
                                                                    30))
                                                        : (constant == 5)
                                                            ? builddepidFormField()
                                                            : (constant == 5)
                                                                ? SizedBox(
                                                                    height:
                                                                        getProportionateScreenHeight(
                                                                            30))
                                                                : (constant ==
                                                                        5)
                                                                    ? buildsecidFormField()
                                                                    : (constant ==
                                                                            5)
                                                                        ? SizedBox(
                                                                            height:
                                                                                getProportionateScreenHeight(30))
                                                                        : null,
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.deepOrange),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(300)),
                            child: DropdownButton(
                              hint: Text('   Enter Search Type'),
                              dropdownColor: kPrimaryColor,
                              underline: SizedBox(),
                              elevation: 2,
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 36.0,
                              isExpanded: true,
                              value: _CoursesNO,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.0),
                              onChanged: (value) {
                                setState(() {
                                  _CoursesNO = value;
                                });
                                if (_CoursesNO == '   NAME') {
                                  constant = 1;
                                } else if (_CoursesNO == '   ID') {
                                  constant = 2;
                                } else if (_CoursesNO == '   PHONE') {
                                  constant = 3;
                                } else if (_CoursesNO == '   EMAIL') {
                                  constant = 4;
                                } else if (_CoursesNO == '   SEC ID') {
                                  constant = 5;
                                } else if (_CoursesNO == '   DEP ID') {
                                  constant = 5;
                                }
                              },
                              items: _CoursesNOName.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        DefaultButton(
                          text: "Submit",
                          press: () {
                            if (_CoursesNO == '   NAME' &&
                                _fnameController.text != null && _lnameController.text !=null) {

                              deepsearch1(
                                id: 1,
                                      fname: _fnameController.text,
                                      lname: _lnameController.text);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => userinfo()));

                            }
                            else if (_CoursesNO == '   ID' &&
                                _idController.text != null) {
                              deepsearch2(id: _idController.text)
                                  .whenComplete(() => () {});
                            }
                            else if (_CoursesNO == '   DEP ID' &&
                                _depidController.text != null) {
                              deepsearch3(depid: _depidController.text)
                                  .whenComplete(() => () {});
                            }
                          },
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: _fnameController,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter user name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildlastNameFormField() {
    return TextFormField(
      controller: _lnameController,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter user name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildIDFormField() {
    return TextFormField(
      controller: _idController,
      decoration: InputDecoration(
        labelText: "User Academic ID",
        hintText: "Enter user ID",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter user email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "User's phone",
        hintText: "Enter phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField builddepidFormField() {
    return TextFormField(
      controller: _depidController,
      decoration: InputDecoration(
        labelText: "User's department id",
        hintText: "Enter department id",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildsecidFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "User's section id",
        hintText: "Enter section id",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
