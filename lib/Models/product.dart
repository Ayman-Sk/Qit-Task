class Product {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
      {required int? id,
      required String? title,
      required String? price,
      required String? description,
      required String? category,
      required String? image,
      required Rating? rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toString();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  String? rate;
  int? count;

  Rating({required String? rate, required int? count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'].toString();
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
