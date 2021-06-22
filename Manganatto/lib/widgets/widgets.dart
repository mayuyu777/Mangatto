import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobdev_practice/services/auth.dart';
import 'package:mobdev_practice/models/models.dart';
import 'package:mobdev_practice/main/home.dart';
import 'package:mobdev_practice/main/login.dart';
import 'package:mobdev_practice/main/register.dart';

Widget customdrawer(BuildContext context, UserFirebase user) {
  final Authenticate _auth = Authenticate();
  return Drawer(
    child: Container(
      margin: EdgeInsets.only(top: 80),
      child: SingleChildScrollView(
        child: Container(
          height: 740,
          child: Column(
            children: [
              ...account(context, user, _auth),
              Divider(
                color: Colors.grey[400],
                thickness: 0.2,
              ),
              ListTile(
                  title: Text(
                'CONNECT',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              )),
              ListTile(
                  leading: Icon(
                    Icons.info,
                    size: 30,
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  onTap: () {}),
              ListTile(
                  leading: Icon(
                    Icons.message,
                    size: 30,
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  onTap: () {}),
            ],
          ),
        ),
      ),
    ),
  );
}

List<Widget> account(
    BuildContext context, UserFirebase user, Authenticate _auth) {
  if (user != null) {
    return [
      ListTile(
          leading: Icon(
            Icons.home,
            size: 30,
          ),
          title: Text(
            'Home',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Homepage()));
          }),
      Divider(
        color: Colors.grey[400],
        thickness: 0.2,
      ),
      ListTile(
          title: Text(
        'ACCOUNT',
        style: TextStyle(
            fontSize: 19, fontWeight: FontWeight.w400, color: Colors.grey),
      )),
      ListTile(
          leading: Icon(
            Icons.person,
            size: 30,
          ),
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
          onTap: () {}),
      ListTile(
          leading: Icon(
            Icons.logout,
            size: 30,
          ),
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
          onTap: () async {
            await _auth.logout();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => Login()));
          }),
    ];
  } else {
    return [
      Divider(
        color: Colors.grey[400],
        thickness: 0.2,
      ),
      ListTile(
          title: Text(
        'ACCOUNT',
        style: TextStyle(
            fontSize: 19, fontWeight: FontWeight.w400, color: Colors.grey),
      )),
      ListTile(
          leading: Icon(
            Icons.person,
            size: 30,
          ),
          title: Text(
            'Sign In',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => Login()));
          }),
      ListTile(
          leading: Icon(
            Icons.logout,
            size: 30,
          ),
          title: Text(
            'Register',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Register()));
          }),
    ];
  }
}

Widget showLoading() {
  return Scaffold(
    backgroundColor: Color(0xff15191b),
    body: Center(
      child: SpinKitCubeGrid(
        color: Colors.white,
        size: 90,
      ),
    ),
  );
}
