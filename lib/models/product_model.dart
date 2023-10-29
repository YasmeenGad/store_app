class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? image;
  String? caregory;
  RatingModel? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.image,
      this.rating,
      this.caregory});

  ProductModel.fromJson(json) {
    id = json['id'];
    caregory = json['caregory'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    image = json['image'];
    rating =
        json['rating'] == null ? null : RatingModel.fromJson(json['rating']);
  }
}

class RatingModel {
  double? rate;
  int? count;

  RatingModel({this.rate, this.count});

  RatingModel.fromJson(json) {
    rate = json['rate'].toDouble();
    count = json['count'];
  }
}
