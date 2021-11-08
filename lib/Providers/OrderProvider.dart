import 'package:flutter/foundation.dart';

import 'package:my_shop/Providers/CartProvider.dart';

class OrderModel {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderModel(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orderList = [];

  List<OrderModel> get getOrderItems {
    return [..._orderList];
  }

  void addOrderItems(List<CartItem> cartProducts, double total) {
    // it will add at the begining of the list
    _orderList.insert(
        0,
        OrderModel(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
