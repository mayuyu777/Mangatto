import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobdev_practice/services/auth.dart';

Widget customappbar(bool changeColorAppBar,  GlobalKey<ScaffoldState> _scaffoldKey){
  return AppBar(
        title: Text('Mangatto',style: TextStyle(color: Colors.white,fontSize: 21,letterSpacing: -1),),
        backgroundColor:changeColorAppBar?Colors.black.withOpacity(0.95) : Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,size: 28,),onPressed: (){  _scaffoldKey.currentState.openDrawer();},),
        actions: [
          IconButton(icon: Icon(Icons.search,color: Colors.white,size: 28),onPressed: (){},)
        ],
      );
}

Widget customdrawer(){
  final Authenticate _auth = Authenticate();
  return Drawer(
  child: Container(
      margin: EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Container(
            height: 740,
            child: Column(
                children: [
                  Divider(color: Colors.grey[400],thickness: 0.2,),
                  ListTile(leading: Icon(Icons.home,size: 30,),title: Text('Home',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                  ListTile(leading: Icon(Icons.star,size: 30,),title: Text('Popular',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                  ListTile(leading: Icon(Icons.search,size: 30,),title: Text('Search',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                  ListTile(leading: Icon(Icons.list,size: 30,),title: Text('Genre',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                  Divider(color: Colors.grey[400],thickness: 0.2,),
                  ListTile(title: Text('ACCOUNT',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.grey),)),
                  ListTile(leading: Icon(Icons.person,size: 30,),title: Text('Profile',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                  ListTile(leading: Icon(Icons.logout,size: 30,),title: Text('Logout',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: ()async{await _auth.logout();}),
                  Divider(color: Colors.grey[400],thickness: 0.2,),
                  ListTile(title: Text('CONNECT',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400,color: Colors.grey),)),
                  ListTile(leading: Icon(Icons.info,size: 30,),title: Text('About Us',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                  ListTile(leading: Icon(Icons.message,size: 30,),title: Text('Contact Us',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),onTap: (){}),
                ],
              ),
          ),
        ),
  ),
  );
}

Widget slide(){
  return Container(
      color: Colors.blueAccent,
      child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('lib/assets/1.jpg',fit: BoxFit.cover,),
        FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end:Alignment.topCenter,
                begin: Alignment.bottomCenter,
                stops: [0.5,0.7],
                colors: [Colors.black.withOpacity(0.6),Colors.transparent]
              )
            )
          )
        ),
        Positioned(
          height: 50,
          bottom: 170,
          left: 20,
          child: Text('The Promised Neverland',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25,letterSpacing: 0.5),),
        ),
          Positioned(
          height: 115,
          width: 350,
          bottom: 70,
          left: 20,
          child: Text('Two top-scoring orphans, Emma and Norman, venture past the gate and unearth the horrifying reality behind their entire existence: they are all livestock, and their orphanage is a farm to cultivate food for a mysterious race of demons.',textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize:16.5,letterSpacing: 0.5),),
        ),
      ],
    ),
  );
}

Widget showLoading(){
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