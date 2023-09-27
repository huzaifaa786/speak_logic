class DataModel {
  final String name;
  final String image;

  DataModel({required this.name, required this.image});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
