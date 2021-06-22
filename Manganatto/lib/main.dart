import 'package:flutter/material.dart';
import 'package:mobdev_practice/main/genre.dart';
import 'package:mobdev_practice/main/login.dart';
import 'package:mobdev_practice/models/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<UserFirebase>.value(
    value: Authenticate().user,
    initialData: null,
    child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.yellow[700].withOpacity(0.9),
      ),
      home: GenreAllManga(),
    ),
  ));
}
