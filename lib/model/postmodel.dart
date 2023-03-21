class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post({this.id, this.userId, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] =id;
    data['user_id'] = userId;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
