import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobdev_practice/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mobdev_practice/models/models.dart';
import 'package:mobdev_practice/services/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MangaDetails extends StatefulWidget {
  final String id;
  const MangaDetails({Key key, @required this.id}) : super(key: key);

  @override
  _MangaDetailsState createState() => _MangaDetailsState(id);
}

class _MangaDetailsState extends State<MangaDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = ScrollController();
  bool changeColorAppBar = false;
  bool openDrawer = false;
  Future<Manga> _manga;
  String id;
  _MangaDetailsState(this.id);

  @override
  void initState() {
    _manga = API().getManga(id);
    super.initState();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<UserFirebase>(context);
    return Scaffold(
      backgroundColor: Color(0xff15191b),
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
            child: SingleChildScrollView(
                controller: controller,
                child: FutureBuilder<Manga>(
                  future: _manga,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        height: 1500,
                        child: Column(
                          children: [
                            Container(
                              height: 380,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(snapshot.data.imageurl),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30, bottom: 30),
                              color: Colors.black54,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      snapshot.data.title,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: 'Rating : ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70)),
                                      TextSpan(
                                          text: snapshot.data.rate,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.w900))
                                    ]))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Synopsis',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      snapshot.data.synopsis,
                                      style: TextStyle(fontSize: 17),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Genres',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Wrap(
                                        children: <Widget>[
                                          for (var item in snapshot.data.genre)
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: Text(item,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white60)),
                                            )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.only(top: 310),
                        child: Center(
                          child: SpinKitCubeGrid(
                            color: Colors.white,
                            size: 90,
                          ),
                        ),
                      );
                    }
                  },
                ))),
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
