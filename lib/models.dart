import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

class Account {
  String email;
  String name;
  String type;
  String password;
  ImageProvider<Object> avatar;

  Account(
      {required this.avatar,
      required this.email,
      required this.name,
      required this.type,
      required this.password});
}

class EventGallery {
  late String title;
  late String description;
  late DateTime date;
  late List<ImageProvider<Object>> images;
  late ImageProvider<Object> thumbnail;

  EventGallery({
    required this.title,
    required this.description,
    required this.date,
    required this.images,
    required this.thumbnail,
  });
}
