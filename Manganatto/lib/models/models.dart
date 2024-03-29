class UserFirebase {
  final String uuid;

  UserFirebase({this.uuid});
}

class UserData {
  final String name;
  final String address;

  UserData({this.name, this.address});
}

class Manga {
  String id;
  String title;
  List<String> genre;
  String synopsis;
  String rate;
  String imageurl;

  Manga(
      this.id, this.title, this.genre, this.synopsis, this.rate, this.imageurl);
}
