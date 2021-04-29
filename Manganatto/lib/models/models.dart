

class UserFirebase {
   final String uuid;

  UserFirebase({this.uuid});

}

class UserData {
  final String name;
  final String address;
  
  UserData({this.name,this.address});
}

class Manga {

  final String id;
  final String title;
  final List<String> authors;
  final List<int> genre;
  final String desc;
  final int views;
  final double rate;
  
  Manga({this.id,this.title,this.authors,this.genre,this.desc,this.views,this.rate});

}