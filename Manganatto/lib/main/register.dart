import 'package:flutter/material.dart';
import 'package:mobdev_practice/services/auth.dart';
import 'package:mobdev_practice/widgets/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:mobdev_practice/models/models.dart';
import 'package:mobdev_practice/main/login.dart';

class Register extends StatefulWidget {
  Register({
    Key key,
  }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isobscure = true;
  bool isobscure2 = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Authenticate auth = Authenticate();
  bool isloading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = ScrollController();
  bool changeColorAppBar = false;
  bool openDrawer = false;

  @override
  void initState() {
    super.initState();
    _emailcontroller.addListener(() => setState(() {}));
  }

  Widget build(BuildContext context) {
    final user = Provider.of<UserFirebase>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Mangatto',
          style:
              TextStyle(color: Colors.white, fontSize: 21, letterSpacing: -1),
        ),
        backgroundColor: changeColorAppBar
            ? Colors.black.withOpacity(0.95)
            : Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            setState(() => openDrawer = !openDrawer);
            customDrawer(context, openDrawer);
          },
        ),
      ),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: Container(
            width: 250,
            color: Color(0xff15191b),
            child: customdrawer(context, user)),
        body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                if ((controller.position.userScrollDirection ==
                        ScrollDirection.reverse) ||
                    (controller.position.pixels != 0)) {
                  changeColorAppBar = true;
                } else {
                  changeColorAppBar = false;
                }
              });
              return true;
            },
            child: isloading
                ? showLoading()
                : Scaffold(
                    body: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/4.png'),
                              fit: BoxFit.cover)),
                      child: Container(
                        color: Color(0xff15191b).withOpacity(0.95),
                        child: SingleChildScrollView(
                          controller: controller,
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 120, left: 35, right: 35),
                            height: 830,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _namecontroller,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Fullname",
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter an Name';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    controller: _addresscontroller,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Address",
                                      prefixIcon: Icon(Icons.place),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter an Address';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    controller: _emailcontroller,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: "Email",
                                        prefixIcon: Icon(Icons.email),
                                        suffixIcon: _emailcontroller
                                                .text.isEmpty
                                            ? Container(width: 0)
                                            : IconButton(
                                                icon: Icon(Icons.close),
                                                onPressed: () =>
                                                    _emailcontroller.clear(),
                                              )),
                                    validator: (value) {
                                      final pattern =
                                          r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                                      final regExp = RegExp(pattern);

                                      if (value.isEmpty) {
                                        return 'Enter an email';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Enter a valid email';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    controller: _passwordcontroller,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Password",
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                          icon: Icon(isobscure
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () => setState(() {
                                                isobscure = !isobscure;
                                              })),
                                    ),
                                    obscureText: isobscure,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Password';
                                      } else if (value.length < 7) {
                                        return 'Password must be at least 7 characters long';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    controller: _confirmpasswordcontroller,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Confirm Password",
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                          icon: Icon(isobscure
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () => setState(() {
                                                isobscure2 = !isobscure2;
                                              })),
                                    ),
                                    obscureText: isobscure2,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Password';
                                      } else if (value.length < 7) {
                                        return 'Password must be at least 7 characters long';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      auth.errorM,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            width: 1, color: Colors.white),
                                        minimumSize: Size(400, 60)),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        if (_passwordcontroller.text ==
                                            _confirmpasswordcontroller.text) {
                                          setState(
                                              () => isloading = !isloading);
                                          _formKey.currentState.save();
                                          await auth.signUp(
                                              context,
                                              _emailcontroller.text,
                                              _passwordcontroller.text);
                                          setState(
                                              () => isloading = !isloading);
                                        } else {
                                          auth.errorM =
                                              'Passwords does not match.';
                                        }
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          " Register",
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: TextButton(
                                      child: Text(
                                        'Already have an Account? Sign In',
                                        style: TextStyle(
                                            fontSize: 18.5,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Login()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
      ),
    );
  }

  void customDrawer(BuildContext context, bool openDrawer) {
    if (openDrawer) {
      _scaffoldKey.currentState.openDrawer();
    } else {
      Navigator.pop(context);
    }
  }
}
