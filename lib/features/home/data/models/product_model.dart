class ProductModel {
  final int id;
  final num price;
  final num oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  const ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      price: jsonData['price'],
      oldPrice: jsonData['old_price'],
      discount: jsonData['discount'],
      image: jsonData['image'],
      name: jsonData['name'],
      description: jsonData['description'],
      images: List<String>.from(jsonData['images']),
      inFavorites: jsonData['in_favorites'],
      inCart: jsonData['in_cart'],
    );
  }
}
