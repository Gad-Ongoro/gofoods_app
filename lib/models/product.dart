class Product {
  final String id;
  final String name;
  final String description;
  final String category;
  final String price;
  final int quantityAvailable;
  final String unitOfMeasurement;
  final bool perishable;
  final String expirationDate;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.quantityAvailable,
    required this.unitOfMeasurement,
    required this.perishable,
    required this.expirationDate,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      quantityAvailable: json['quantity_available'].toInt(),
      unitOfMeasurement: json['unit_of_measurement'],
      perishable: json['perishable'],
      expirationDate: json['expiration_date'],
      image: json['image'],
    );
  }
}
