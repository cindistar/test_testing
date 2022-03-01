import 'dart:convert';

class CartItem {
  String id;
  String title;
  int quantity;
  double price;
  String image;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.image,
  });

  CartItem copyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
    String? image,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItem(id: $id, title: $title, quantity: $quantity, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartItem &&
      other.id == id &&
      other.title == title &&
      other.quantity == quantity &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
