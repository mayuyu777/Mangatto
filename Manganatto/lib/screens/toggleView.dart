import 'package:flutter/material.dart';
import 'package:mobdev_practice/screens/login.dart';
import 'package:mobdev_practice/screens/register.dart';

class ToggleForm extends StatefulWidget {
  ToggleForm({Key key}) : super(key: key);

  @override
  _ToggleFormState createState() => _ToggleFormState();
}

class _ToggleFormState extends State<ToggleForm> {

  bool showLogin = true;
  @override
  Widget build(BuildContext context) {

    void toggle(){
      setState(()=>showLogin = !showLogin);
    }
    
    if(showLogin){
      return Login(toggleForm: toggle);
    }else{
      return Register(toggleForm: toggle);
    }


}
}