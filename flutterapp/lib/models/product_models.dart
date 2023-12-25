// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:collection/collection.dart';

class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  List<ProductModel>? _products;
  List<ProductModel>? get products => _products;
  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product copyWith({
    int? totalSize,
    int? typeId,
    int? offset,
    List<ProductModel>? products,
  }) {
    return Product(
      totalSize: totalSize ?? _totalSize,
      typeId: typeId ?? _typeId,
      offset: offset ?? _offset,
      products: products ?? _products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalSize': _totalSize,
      'typeId': _typeId,
      'offset': _offset,
      'products': products?.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      totalSize: map['totalSize'] != null ? map['totalSize'] as int : null,
      typeId: map['typeId'] != null ? map['typeId'] as int : null,
      offset: map['offset'] != null ? map['offset'] as int : null,
      products: map['products'] != null
          ? List<ProductModel>.from(
              (map['products'] as List<int>).map<ProductModel?>(
                (x) => ProductModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'Product(totalSize: $_totalSize, typeId: $_typeId, offset: $_offset, products: $products)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other._totalSize == _totalSize &&
        other._typeId == _typeId &&
        other._offset == _offset &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return _totalSize.hashCode ^
        _typeId.hashCode ^
        _offset.hashCode ^
        products.hashCode;
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updateAt;
  int? typeId;
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updateAt,
    this.typeId,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stars,
    String? img,
    String? location,
    String? createdAt,
    String? updateAt,
    int? typeId,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stars: stars ?? this.stars,
      img: img ?? this.img,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      typeId: typeId ?? this.typeId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stars': stars,
      'img': img,
      'location': location,
      'createdAt': createdAt,
      'updateAt': updateAt,
      'typeId': typeId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      stars: map['stars'] != null ? map['stars'] as int : null,
      img: map['img'] != null ? map['img'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updateAt: map['updateAt'] != null ? map['updateAt'] as String : null,
      typeId: map['typeId'] != null ? map['typeId'] as int : null,
    );
  }

  

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, stars: $stars, img: $img, location: $location, createdAt: $createdAt, updateAt: $updateAt, typeId: $typeId)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.stars == stars &&
      other.img == img &&
      other.location == location &&
      other.createdAt == createdAt &&
      other.updateAt == updateAt &&
      other.typeId == typeId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      stars.hashCode ^
      img.hashCode ^
      location.hashCode ^
      createdAt.hashCode ^
      updateAt.hashCode ^
      typeId.hashCode;
  }
}
