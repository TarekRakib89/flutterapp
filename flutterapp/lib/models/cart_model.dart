// ignore_for_file: public_member_api_docs, sort_constructors_first

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExit;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExit,
    this.time,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      img: map['img'] != null ? map['img'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      isExit: map['isExit'] as bool,
      time: map['time'] != null ? map['time'] as String : null,
    );
  }
}
