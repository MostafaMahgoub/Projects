import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/components/custom_surfix_icon.dart';
import 'package:gradproject/components/default_button.dart';

import 'package:gradproject/constants.dart';
import 'package:gradproject/screens/profile/components/profile_menu.dart';

import '../../../size_config.dart';

class userinfo extends StatefulWidget {
  static String routeName = "/userinfo";

  @override
  _userinfo createState() => _userinfo();
}

class _userinfo extends State<userinfo> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "User information",
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
                  "User information",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(

                      children: [
                        Divider(),
                        ListTile(
                          title: Text('FirstName'),
                          subtitle: Text('FirstName'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/User.svg"),
                        ),
                        ListTile(
                          title: Text('LastName'),
                          subtitle: Text('LastName'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/User.svg"),
                        ),
                        ListTile(
                          title: Text('Phone'),
                          subtitle: Text('Phone'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/Phone.svg"),
                        ),
                        ListTile(
                          title: Text('Email'),
                          subtitle: Text('Email'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/Mail.svg"),
                        ),
                        ListTile(
                          title: Text('Type'),
                          subtitle: Text('Type'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/receipt.svg"),
                        ),
                        ListTile(
                          title: Text('ID'),
                          subtitle: Text('ID'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/User.svg"),
                        ),
                        ListTile(
                          title: Text('DepID'),
                          subtitle: Text('DepID'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/User.svg"),
                        ),
                        ListTile(
                          title: Text('SecID'),
                          subtitle: Text('SecID'),
                          leading: CustomSurffixIcon(
                              svgIcon: "assets/icons/User.svg"),
                        ),
                        Divider(),
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
}
