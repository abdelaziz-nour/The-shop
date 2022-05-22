class ItemModel {
  String name;
  int price;
  String image;

  ItemModel({
    required this.name,
    required this.price,
    required this.image,
  });

  factory ItemModel.fromMap(map) {
    return ItemModel(
      name: map['name'],
      price: map['price'],
      image: map['image'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
