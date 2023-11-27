class CategoryResponce {
  CategoriesModel? categories;

  CategoryResponce({this.categories});

  CategoryResponce.fromJson(Map<String, dynamic> json) {
    categories = json['categories'] != null
        ? CategoriesModel.fromJson(json['categories'])
        : null;
  }
}

class CategoriesModel {
  String? href;
  List<Categoriess>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  CategoriesModel(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <Categoriess>[];
      json['items'].forEach((v) {
        items!.add(Categoriess.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }
}

class Categoriess {
  String? href;
  List<Iconss>? icons;
  String? id;
  String? name;

  Categoriess({this.href, this.icons, this.id, this.name});

  Categoriess.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['icons'] != null) {
      icons = <Iconss>[];
      json['icons'].forEach((v) {
        icons!.add(Iconss.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
  }
}

class Iconss {
  int? height;
  String? url;
  int? width;

  Iconss({this.height, this.url, this.width});

  Iconss.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }
}
