import 'dart:convert';

import 'package:edstest/models/album.dart';
import 'package:edstest/models/comment.dart';
import 'package:edstest/models/photo.dart';
import 'package:edstest/models/post.dart';
import 'package:edstest/models/user.dart';
import 'package:edstest/providers/cache_provider.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<List<User>> apiGetListOfUsers({bool isReloadForce = false}) async {
    try {
      List<dynamic> result = List.empty();
      final cache = await CacheProvider.getObjectJson(key: CacheProvider.users);
      if (isReloadForce || cache == null) {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users/'),
          headers: {'Content-Type': 'application/json'},
        );
        CacheProvider.saveObjectJson(key: CacheProvider.users, objectJson: response.body);
        result = json.decode(response.body) as List<dynamic>;
      } else {
        result = json.decode(cache) as List<dynamic>;
      }
      return result.map((data) => User.fromJson(data)).toList();
    } on Exception catch (_) {}
    return [];
  }

  static Future apiSendComment(int postid, String body, String name, String mail) async {
    try {
      var message = {'email': mail, 'name': name, 'body': body};

      final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/$postid/comments'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: json.encode(message));
    } on Exception catch (_) {}
  }

  static Future<List<Post>> apiGetPostsForUser(
      {required int id, bool isReloadForce = false}) async {
    try {
      List<dynamic> result = List.empty();
      final cache = await CacheProvider.getObjectJson(key: '${CacheProvider.posts}$id');
      if (isReloadForce || cache == null) {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users/$id/posts'),
          headers: {'Content-Type': 'application/json'},
        );
        CacheProvider.saveObjectJson(key: '${CacheProvider.posts}$id', objectJson: response.body);
        result = json.decode(response.body) as List<dynamic>;
      } else {
        result = json.decode(cache) as List<dynamic>;
      }
      return result.map((data) => Post.fromJson(data)).toList();
    } on Exception catch (_) {}
    return [];
  }

  static Future<List<Comment>> apiGetCommentsForPost(
      {required int id, bool isReloadForce = false}) async {
    try {
      List<dynamic> result = List.empty();
      final cache = await CacheProvider.getObjectJson(key: '${CacheProvider.comments}$id');
      if (isReloadForce || cache == null) {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/$id/comments'),
          headers: {'Content-Type': 'application/json'},
        );
        CacheProvider.saveObjectJson(
            key: '${CacheProvider.comments}$id', objectJson: response.body);
        result = json.decode(response.body) as List<dynamic>;
      } else {
        result = json.decode(cache) as List<dynamic>;
      }
      return result.map((data) => Comment.fromJson(data)).toList();
    } on Exception catch (_) {}
    return [];
  }

  static Future<List<Album>> apiGetAlbumsForUser(
      {required int id, bool isReloadForce = false}) async {
    try {
      List<dynamic> result = List.empty();
      final cache = await CacheProvider.getObjectJson(key: '${CacheProvider.albums}$id');
      if (isReloadForce || cache == null) {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users/$id/albums'),
          headers: {'Content-Type': 'application/json'},
        );
        CacheProvider.saveObjectJson(key: '${CacheProvider.albums}$id', objectJson: response.body);
        result = json.decode(response.body) as List<dynamic>;
      } else {
        result = json.decode(cache) as List<dynamic>;
      }
      return result.map((data) => Album.fromJson(data)).toList();
    } on Exception catch (_) {}
    return [];
  }

  static Future apiGetPhotosForAlbum({required Album album, bool isReloadForce = false}) async {
    try {
      List<dynamic> result = List.empty();
      final cache = await CacheProvider.getObjectJson(key: '${CacheProvider.photos}${album.id}');
      if (isReloadForce || cache == null) {
        final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/${album.id}/photos'),
          headers: {'Content-Type': 'application/json'},
        );
        CacheProvider.saveObjectJson(
            key: '${CacheProvider.photos}${album.id}', objectJson: response.body);
        result = json.decode(response.body) as List<dynamic>;
      } else {
        result = json.decode(cache) as List<dynamic>;
      }
      album.photos = result.map((data) => Photo.fromJson(data)).toList();
    } on Exception catch (_) {}
  }
}
