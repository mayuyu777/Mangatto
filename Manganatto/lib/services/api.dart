import 'dart:convert';
import 'package:mobdev_practice/models/models.dart';
import 'package:http/http.dart' as http;

class API {
  Future<List<Manga>> getMangaCollection(String genre) async {
    var response = await http.get(
        Uri.parse('https://kitsu.io/api/edge/manga?filter[genres]=' + genre));
    List jsonData = [];
    List<Manga> mangas = [];

    if (response.statusCode == 200) {
      jsonData = jsonDecode(response.body)['data'];
      print(jsonData.length);
      for (var item in jsonData) {
        var manga = new Manga(
            item['id'],
            item['attributes']['titles']['en_jp'],
            null,
            item['attributes']['synopsis'],
            item['attributes']['userCount'],
            item['attributes']['averageRating'],
            item['attributes']['posterImage']['large']);
        mangas.add(manga);
      }
      print(mangas.length);
    }

    return mangas;
  }

  Future<Manga> getManga(String id) async {
    var response =
        await http.get(Uri.parse('https://kitsu.io/api/edge/manga/' + id));
    var genreresponse = await http
        .get(Uri.parse('https://kitsu.io/api/edge/manga/' + id + '/genres'));
    var manga, item;
    List genresres = [];
    List<String> genre = [];

    if (response.statusCode == 200) {
      item = jsonDecode(response.body)['data'];
      genresres = jsonDecode(genreresponse.body)['data'];

      for (var item in genresres) {
        genre.add(item['attributes']['name']);
      }
      manga = new Manga(
          item['id'],
          item['attributes']['titles']['en_jp'],
          genre,
          item['attributes']['synopsis'],
          item['attributes']['userCount'],
          item['attributes']['averageRating'],
          item['attributes']['posterImage']['large']);
    }
    print(genre.length);
    return manga;
  }
}
