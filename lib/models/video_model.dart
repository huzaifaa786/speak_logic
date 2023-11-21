class Video {
  int? id;
  // int? is_link;
  String? title;
  String? type;
  String? video;
  var link;

  Video(Map<String, dynamic> video) {
    print('***************88');
    print(video['link']);
    id = video['id'];
    title = video['title'];
    type = video['type'];
    video = video['video'] ?? null;
    link = video['link'].toString();
    // is_link = video['is_link'];
  }
}
