class Video {
  int? id;
  // int? is_link;
  String? title;
  String? type;
  String? mvideo;
  var link;

  Video(video) {
    id = video['id'];
    title = video['title'];
    type = video['type'];
    mvideo = video['video'] ?? null;
    link = video['link'].toString();
    // is_link = video['is_link'];
  }
}
