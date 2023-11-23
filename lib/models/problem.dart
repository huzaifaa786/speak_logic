class Config {
  int? id;
  String? name;
  String? value;
  String? description;

  Config(config) { 
    id = config['id'];
    name = config['name'];
    value = config['value'];
    description = config['description'];
  }
}
