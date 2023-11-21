class Setting {
  int? id;

  String? name;
  String? value;
  String? description;

  Setting(setting) {
    id = setting['id'];
    name = setting['name'];
    value = setting['value'];
    description = setting['description'];
  }
}
