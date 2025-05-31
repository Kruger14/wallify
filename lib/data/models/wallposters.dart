class Wallposters {
  late final int id;
  late final String name;
  late final String urlImage;
  late final String category;
  late final List<String> tags;

  Wallposters(this.id, this.name, this.urlImage, this.category, this.tags);

  Wallposters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    urlImage = json['urlImage'];
    category = json['category'];
    tags = json['tags'].cast<String>();
  }
}