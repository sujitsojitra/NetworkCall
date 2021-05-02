// To parse this JSON data, do
//
//     final userAlbum = userAlbumFromJson(jsonString);

import 'dart:convert';

List<UserAlbum> userAlbumFromJson(String str) => List<UserAlbum>.from(json.decode(str).map((x) => UserAlbum.fromJson(x)));

String userAlbumToJson(List<UserAlbum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAlbum {
  UserAlbum({
    this.userId,
    this.id,
    this.title,
  });

  int userId;
  int id;
  String title;

  factory UserAlbum.fromJson(Map<String, dynamic> json) => UserAlbum(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
