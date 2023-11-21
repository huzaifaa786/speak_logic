class Software {
  int? id;
  String? name;
  String? image;
  String? video;
  String? software;



  Software(software) {
    id = software['id'];
    name = software['name'];
    image = software['image'];
    video = software['video'];
    software = software['software'];


  }
}
