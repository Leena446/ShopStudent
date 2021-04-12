import 'package:flutter/foundation.dart';

class CartItem {
  final String idd;
  final String title;
  final int quantity;
  final double price;


  CartItem(
      {@required this.idd,
        @required this.title,
        @required this.quantity,
        @required this.price});
}

class Cartt with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total+= cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
      String producrid,
      String title,
      double price) {
    if (_items.containsKey(producrid)) {
      _items.update(
          producrid,
              (existingCartItem) =>
              CartItem(
                  idd: existingCartItem.idd,
                  title: existingCartItem.title,
                  quantity: existingCartItem.quantity + 1,
                  price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          producrid,
              () =>
              CartItem(
                title: title,
                idd: DateTime.now().toString(),
                quantity: 1,
                price: price,
              ),);
    }
    notifyListeners();
  }
  void removeItem(String producrid){
    _items.remove(producrid);
    notifyListeners();
  }

  void removeSingleItem(String producrid){
   if( !_items.containsKey(producrid)){
     return;
   }
     if (_items[producrid].quantity>1){
       _items.update(producrid,(existingCartItem) => CartItem(
           idd:existingCartItem.idd,
           price:existingCartItem.price,
           title:existingCartItem.title,
           quantity:existingCartItem.quantity,

       ));
     }else{
       _items.remove(producrid);
     }
     notifyListeners();
  }
  void clear(){
    _items ={};
    notifyListeners();
  }

}


