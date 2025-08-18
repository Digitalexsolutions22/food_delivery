class CartResponse {
  final String status;
  final List<CartItem> cart;

  CartResponse({required this.status, required this.cart});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'],
      cart:
          (json['cart'] as List)
              .map((item) => CartItem.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'cart': cart.map((item) => item.toJson()).toList(),
    };
  }
}

class CartItem {
  final String cartId;
  final String quantity;
  final String foodName;
  final String offerPrice;
  final String actualPrice;
  final String imageUrl;

  CartItem({
    required this.cartId,
    required this.quantity,
    required this.foodName,
    required this.offerPrice,
    required this.actualPrice,
    required this.imageUrl,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartId: json['cart_id'],
      quantity: json['quantity'],
      foodName: json['food_name'],
      offerPrice: json['offer_price'],
      actualPrice: json['actual_price'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_id': cartId,
      'quantity': quantity,
      'food_name': foodName,
      'offer_price': offerPrice,
      'actual_price': actualPrice,
      'image_url': imageUrl,
    };
  }
}
