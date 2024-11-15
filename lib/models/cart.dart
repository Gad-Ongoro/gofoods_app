class Cart {
  final String id;
  final String user;
  final String product;
  final String quantity;
  final double totalPrice;

  Cart({
    required this.id,
    required this.user,
    required this.product,
    required this.quantity,
    required this.totalPrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      user: json['user'],
      product: json['product'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
    );
  }
}
