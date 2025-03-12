import 'dart:convert';

class PostResponse {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostResponse({this.userId, this.id, this.title, this.body});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  static List<PostResponse> fromJsonList(String jsonString) {
    final List<dynamic> data = json.decode(jsonString);
    return data.map((json) => PostResponse.fromJson(json)).toList();
  }

  static String toJsonList(List<PostResponse> posts) {
    final List<Map<String, dynamic>> data = posts.map((post) => post.toJson()).toList();
    return json.encode(data);
  }
}