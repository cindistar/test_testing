import 'dart:convert';

class Product {
  String id;
  String title;
  String brand;
  String tag;
  double price;
  String image;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.tag,
    required this.price,
    required this.image,
  });

  

  Product copyWith({
    String? id,
    String? title,
    String? brand,
    String? tag,
    double? price,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      tag: tag ?? this.tag,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'tag': tag,
      'price': price,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      brand: map['brand'] ?? '',
      tag: map['tag'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, brand: $brand, tag: $tag, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.title == title &&
      other.brand == brand &&
      other.tag == tag &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      brand.hashCode ^
      tag.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
