import 'package:flutter/material.dart';
import 'package:mobdev_practice/models/models.dart';
import 'package:mobdev_practice/screens/home.dart';
import 'package:mobdev_practice/screens/toggleView.dart';
import 'package:provider/provider.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

     final user = Provider.of<UserFirebase>(context);
     
     if(user == null){
       return ToggleForm();
     }else{
       return Homepage();
     }
  }
}