

class Book {
  int? id;
  String? name;
  String? image;
  String? Pdf;
  String? image2;
  String? epub;
  String? type;
  int? pdf_download;



  Book(book) {
    id = book['id'];
    name = book['name'];
    image = book['image'];
    Pdf = book['pdf'];
    image2 = book['image2'];
    epub = book['epub'];
    type = book['type'];
    pdf_download = book['pdf_download'];
  }
}
