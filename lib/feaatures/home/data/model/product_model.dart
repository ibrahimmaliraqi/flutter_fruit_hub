class ReviewModel {
  final String name;
  final String image;
  final String reviewDescription;
  final num ratting;
  final String date;

  ReviewModel({
    required this.name,
    required this.image,
    required this.reviewDescription,
    required this.ratting,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      reviewDescription: json['reviewDescription'] ?? '',
      ratting: json['ratting'] ?? 0,
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'reviewDescription': reviewDescription,
      'ratting': ratting,
      'date': date,
    };
  }

  ReviewModel copyWith({
    String? name,
    String? image,
    String? reviewDescription,
    num? ratting,
    String? date,
  }) {
    return ReviewModel(
      name: name ?? this.name,
      image: image ?? this.image,
      reviewDescription: reviewDescription ?? this.reviewDescription,
      ratting: ratting ?? this.ratting,
      date: date ?? this.date,
    );
  }
}

class ProductModel {
  final String code;
  final String description;
  final int expirationsMonths;
  final String imageUrl;
  final bool isFeatured;
  final bool isOrganic;
  final String name;
  final int numberOfCalories;
  final num price;
  final List<ReviewModel> reviews;
  final int sellingCount;
  final int unitAmount;

  ProductModel({
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.imageUrl,
    required this.isFeatured,
    required this.isOrganic,
    required this.name,
    required this.numberOfCalories,
    required this.price,
    required this.reviews,
    required this.sellingCount,
    required this.unitAmount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      expirationsMonths: json['expirationsMonths'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      isFeatured: json['isFeatured'] ?? false,
      isOrganic: json['isOrganic'] ?? false,
      name: json['name'] ?? '',
      numberOfCalories: json['numberOfCalories'] ?? 0,
      price: json['price'] ?? 0,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellingCount: json['sellingCount'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'description': description,
      'expirationsMonths': expirationsMonths,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'name': name,
      'numberOfCalories': numberOfCalories,
      'price': price,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'sellingCount': sellingCount,
      'unitAmount': unitAmount,
    };
  }

  ProductModel copyWith({
    String? code,
    String? description,
    int? expirationsMonths,
    String? imageUrl,
    bool? isFeatured,
    bool? isOrganic,
    String? name,
    int? numberOfCalories,
    num? price,
    List<ReviewModel>? reviews,
    int? sellingCount,
    int? unitAmount,
  }) {
    return ProductModel(
      code: code ?? this.code,
      description: description ?? this.description,
      expirationsMonths: expirationsMonths ?? this.expirationsMonths,
      imageUrl: imageUrl ?? this.imageUrl,
      isFeatured: isFeatured ?? this.isFeatured,
      isOrganic: isOrganic ?? this.isOrganic,
      name: name ?? this.name,
      numberOfCalories: numberOfCalories ?? this.numberOfCalories,
      price: price ?? this.price,
      reviews: reviews ?? this.reviews,
      sellingCount: sellingCount ?? this.sellingCount,
      unitAmount: unitAmount ?? this.unitAmount,
    );
  }
}
