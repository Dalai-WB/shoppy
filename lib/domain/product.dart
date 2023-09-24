import 'dart:convert';

class Product {
  final int id;
  final String img;
  final String title;
  final String desc;
  final double price;
  final int quantity;
  Product({
    required this.id,
    required this.img,
    required this.title,
    required this.desc,
    required this.price,
    required this.quantity,
  });

  Product copyWith({
    int? id,
    String? img,
    String? title,
    String? desc,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      img: img ?? this.img,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'img': img,
      'title': title,
      'desc': desc,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      img: map['img'] as String,
      title: map['title'] as String,
      desc: map['desc'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, img: $img, title: $title, desc: $desc, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.img == img &&
      other.title == title &&
      other.desc == desc &&
      other.price == price &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      img.hashCode ^
      title.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
}
