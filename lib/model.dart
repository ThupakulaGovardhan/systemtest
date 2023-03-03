class Post {
  final String type;
  final String name;
  final String time;
  final List<String> postdata;

  Post({
    required this.type,
    required this.name,
    required this.time,
    required this.postdata,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      type: json['type'],
      name: json['name'],
      time: json['time'],
      postdata: List<String>.from(json['postdata']),
    );
  }
}
