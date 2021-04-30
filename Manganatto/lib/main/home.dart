import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mobdev_practice/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mobdev_practice/models/models.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';




class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = ScrollController();
  bool changeColorAppBar = false;
  bool openDrawer = false;
   
  @override

  Widget build(BuildContext context) {
    final user = Provider.of<UserFirebase>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Mangatto',style: TextStyle(color: Colors.white,fontSize: 21,letterSpacing: -1),),
        backgroundColor:changeColorAppBar?Colors.black.withOpacity(0.95) : Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,size: 28,),onPressed: (){setState(()=>openDrawer=!openDrawer); customDrawer(context,openDrawer) ;},),
        actions: [
          IconButton(icon: Icon(Icons.search,color: Colors.white,size: 28),onPressed: (){},)
        ],
      ),
      body: Scaffold(
        key: _scaffoldKey,
          drawer: Container(
            width: 250,
            color: Color(0xff15191b),
            child: customdrawer(context,user)
          ),
            body: NotificationListener<UserScrollNotification>(
            onNotification: (notification){
              setState(() {
                if((controller.position.userScrollDirection == ScrollDirection.reverse)||(controller.position.pixels!=0)){
                  changeColorAppBar = true;
                }else{
                  changeColorAppBar = false;
                }
              });
              return true;
            },
            child: SingleChildScrollView(
            controller: controller,
            child: Container(
              color: Color(0xff15191b),
              height: 1500,
              child: Column(
                children: [
                  Container(
                    height: 400,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Carousel(
                      dotSize: 4,
                      dotSpacing: 10,
                      dotBgColor: Colors.transparent,
                      images: [
                        Container(
                            color: Color(0xff15191b),
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
                        ),
                         Container(
                            color: Color(0xff15191b),
                            child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset('lib/assets/2.jpg',fit: BoxFit.cover,),
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
                                child: Text('Boku no Hero Academia',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25,letterSpacing: 0.5),),
                              ),
                               Positioned(
                                height: 115,
                                width: 350,
                                bottom: 70,
                                left: 20,
                                child: Text('Izuku has dreamt of being a hero all his life—a lofty goal for anyone, but especially challenging for a kid with no superpowers. That’s right, in a world where eighty percent of the population has some kind of super-powered “quirk,”. ',textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 16.5,letterSpacing: 0.5),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            color: Color(0xff15191b),
                            child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset('lib/assets/3.jpg',fit: BoxFit.cover,),
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
                                child: Text('Attack on Titan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25,letterSpacing: 0.5),),
                              ),
                               Positioned(
                                height: 115,
                                width: 350,
                                bottom: 70,
                                left: 20,
                                child: Text('Known in Japan as Shingeki no Kyojin, many years ago, the last remnants of humanity were forced to retreat behind the towering walls of a fortified city to escape the massive, man-eating Titans that roamed the land outside their fortress.',textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 16.5,letterSpacing: 0.5),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            color: Color(0xff15191b),
                            child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset('lib/assets/4.png',fit: BoxFit.cover,),
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
                                child: Text('Mob Psycho 100',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25,letterSpacing: 0.5),),
                              ),
                               Positioned(
                                height: 115,
                                width: 350,
                                bottom: 70,
                                left: 20,
                                child: Text('Kageyama Shigeo is a 8th grader with psychic abilities. He could bend spoons and lift objects with his mind from a young age, but he slowly began to withhold from using his abilities in public due to the negative attention he kept receiving.',textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 16.5,letterSpacing: 0.5),),
                              ),
                            ],
                          ),
                        ),
                      ],//images
                    ),
                  ),
                  Container(
                    height: 35,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                      Align(alignment: Alignment.bottomLeft,child: Text('Latest',style: TextStyle(color: Colors.white,fontSize: 22,letterSpacing: 1))),
                      OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey[850],width: 1.5)),onPressed: (){},child: Text("ALL",style: TextStyle(color: Colors.white70,fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.w400)),)
                    ]
                  ),),
                  Container(
                    height: 250,
                    width: 410,
                    margin: EdgeInsets.only(bottom: 20,top:10),
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                        children: [
                          InkWell(
                              onTap: (){
                                print('HEHEHHE');
                              },
                              child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(const Radius.circular(5)),
                                color: Colors.grey[850],
                                boxShadow: [
                                 BoxShadow(
                                    color: Colors.black.withOpacity(0.3), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 3,
                                    offset: Offset(0, 2) // blur radius
                                 )
                                ]
                              ),
                              width: 150,
                              margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.65,
                                      widthFactor: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                          image: DecorationImage(image: AssetImage('lib/assets/6.jpg'),fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ),
                                  Positioned(
                                    bottom: 13,
                                    left: 10,
                                    child: Container(
                                      width: 130,
                                      height: 50,
                                      child: Text('The Rising Of The Shield Hero',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(const Radius.circular(5)),
                              color: Colors.grey[850],
                              boxShadow: [
                               BoxShadow(
                                  color: Colors.black.withOpacity(0.3), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3,
                                  offset: Offset(0, 2) // blur radius
                               )
                              ]
                            ),
                            width: 150,
                            margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.65,
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage('lib/assets/5.jpg'),fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 13,
                                  left: 10,
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    child: Text('Tomo-Chan Wa Onnanoko!',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(const Radius.circular(5)),
                              color: Colors.grey[850],
                              boxShadow: [
                               BoxShadow(
                                  color: Colors.black.withOpacity(0.3), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3,
                                  offset: Offset(0, 2) // blur radius
                               )
                              ]
                            ),
                            width: 150,
                            margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.65,
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage('lib/assets/7.jpg'),fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 13,
                                  left: 10,
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    child: Text('Tomo-Chan Wa Onnanoko!',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(const Radius.circular(5)),
                              color: Colors.grey[850],
                              boxShadow: [
                               BoxShadow(
                                  color: Colors.black.withOpacity(0.3), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3,
                                  offset: Offset(0, 2) // blur radius
                               )
                              ]
                            ),
                            width: 150,
                            margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.65,
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage('lib/assets/8.jpg'),fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 13,
                                  left: 10,
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    child: Text('The Ride-On King',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      )
                    )
                  ),
                  Container(
                   height: 35,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                      Align(alignment: Alignment.bottomLeft,child: Text('Hot',style: TextStyle(color: Colors.white,fontSize: 22,letterSpacing: 1))),
                      OutlinedButton(style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey[850],width: 1.5)),onPressed: (){},child: Text("ALL",style: TextStyle(color: Colors.white70,fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.w400)),)
                    ]
                  )
                  ),
                  Container(
                    height: 250,
                    width: 410,
                    margin: EdgeInsets.only(bottom: 20,top:10),
                    child: FractionallySizedBox(
                      heightFactor: 1,
                      widthFactor: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                        children: [
                          InkWell(
                              onTap: (){
                                print('HEHEHHE');
                              },
                              child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(const Radius.circular(5)),
                                color: Colors.grey[850],
                                boxShadow: [
                                 BoxShadow(
                                    color: Colors.black.withOpacity(0.3), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 3,
                                    offset: Offset(0, 2) // blur radius
                                 )
                                ]
                              ),
                              width: 150,
                              margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.65,
                                      widthFactor: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                          image: DecorationImage(image: AssetImage('lib/assets/6.jpg'),fit: BoxFit.cover),
                                        ),
                                      ),
                                    )
                                  ),
                                  Positioned(
                                    bottom: 13,
                                    left: 10,
                                    child: Container(
                                      width: 130,
                                      height: 50,
                                      child: Text('The Rising Of The Shield Hero',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(const Radius.circular(5)),
                              color: Colors.grey[850],
                              boxShadow: [
                               BoxShadow(
                                  color: Colors.black.withOpacity(0.3), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3,
                                  offset: Offset(0, 2) // blur radius
                               )
                              ]
                            ),
                            width: 150,
                            margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.65,
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage('lib/assets/5.jpg'),fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 13,
                                  left: 10,
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    child: Text('Tomo-Chan Wa Onnanoko!',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(const Radius.circular(5)),
                              color: Colors.grey[850],
                              boxShadow: [
                               BoxShadow(
                                  color: Colors.black.withOpacity(0.3), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3,
                                  offset: Offset(0, 2) // blur radius
                               )
                              ]
                            ),
                            width: 150,
                            margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.65,
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage('lib/assets/7.jpg'),fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 13,
                                  left: 10,
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    child: Text('Tomo-Chan Wa Onnanoko!',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(const Radius.circular(5)),
                              color: Colors.grey[850],
                              boxShadow: [
                               BoxShadow(
                                  color: Colors.black.withOpacity(0.3), //color of shadow
                                  spreadRadius: 1, //spread radius
                                  blurRadius: 3,
                                  offset: Offset(0, 2) // blur radius
                               )
                              ]
                            ),
                            width: 150,
                            margin: EdgeInsets.only(top:5,bottom: 10,right: 10),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: FractionallySizedBox(
                                    heightFactor: 0.65,
                                    widthFactor: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage('lib/assets/8.jpg'),fit: BoxFit.cover),
                                      ),
                                    ),
                                  )
                                ),
                                Positioned(
                                  bottom: 13,
                                  left: 10,
                                  child: Container(
                                    width: 130,
                                    height: 50,
                                    child: Text('The Ride-On King',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      )
                    )
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }


  void customDrawer(BuildContext context,bool openDrawer){
    if(openDrawer){
       _scaffoldKey.currentState.openDrawer();
    }else{
      Navigator.pop(context);
    }
  }
}