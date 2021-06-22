import 'package:flutter/material.dart';
import 'package:mobdev_practice/services/auth.dart';
import 'package:mobdev_practice/widgets/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:mobdev_practice/models/models.dart';
import 'package:mobdev_practice/main/register.dart';

class GenreAllManga extends StatefulWidget {
  const GenreAllManga({Key key}) : super(key: key);

  @override
  _GenreAllMangaState createState() => _GenreAllMangaState();
}

class _GenreAllMangaState extends State<GenreAllManga> {
  @override
  bool isobscure = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
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
            child: Scaffold()),
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
