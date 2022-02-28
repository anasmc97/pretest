part of "models.dart";

class Data {
  int? userId;
  int? id;
  String? title;
  String? body;

  Data({this.userId, this.id, this.body, this.title});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);
}

//    var response = await client.get(url, headers: {
    //   "Content-Type": "application/json",
    //   "Authorization": "Bearer ${User.token}"
    // });