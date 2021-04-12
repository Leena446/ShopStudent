
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'cartt.dart';

class OrderItem{
  final String idd;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
      @required this.idd,
      @required this.amount,
      @required this.products,
      @required this.dateTime});
}
class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    _orders.insert(0,
      OrderItem(
        idd: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProduct,
      ),);
    notifyListeners();
  }
}