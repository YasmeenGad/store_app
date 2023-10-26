class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? image;
  RatingModel? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.image,
      this.rating});

  ProductModel.fromJson(json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    rating = RatingModel.fromJson(json['rating']);
  }
}

class RatingModel {
  double? rate;
  int? count;

  RatingModel({this.rate, this.count});

  RatingModel.fromJson(json) {
    rate = json['rate'];
    count = json['count'];
  }
}
