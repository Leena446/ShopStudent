import 'package:flutter/material.dart';
import 'Product.dart';
class Products with ChangeNotifier {
  List <Product> _items = [
    Product(
      idd: "p4",
      title: "iPhone 12 Pro Max",
      description: "Apple iPhone 12 Pro Max 128 GB, Pacific Blue, 5G",
      price: 5999,
      imageUrl: "https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false",
      imageUrl2: "https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false",
      imageUrl3: "https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false",
      imageUrl4: "https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false",
      capicty: "Memory (internal): 128GB",
      OperatingSystem: "Operating System: IOS 14",
      network: "Network: 5G",
      other: "2 Year Warranty",
      storeApp: "https://mawso3a.net/wp-content/uploads/2020/11/طريقة-حجز-موعد-في-اكسترا.png",

    ),
    Product(
      idd: "p3",
      title: "MacBook PRO ",
      description: "raid",
      price: 3999,
      imageUrl: "https://media.extra.com/i/aurora/100157834_100_01?w=800&h=800&img404=missing_product&v=false",
      imageUrl2: "https://media.extra.com/i/aurora/100157834_100_02?w=800&h=800&img404=missing_product&v=false",
      imageUrl3: "https://media.extra.com/i/aurora/100157834_100_03?w=800&h=800&img404=missing_product&v=false",
      imageUrl4: "https://media.extra.com/i/aurora/100157834_100_03?w=800&h=800&img404=missing_product&v=false",
      capicty: "Memory (internal): 128GB",
      OperatingSystem: "Operating System: IOS 14",
      network: "Network: 5G",
      other: "2 Year Warranty",
      storeApp: "https://mawso3a.net/wp-content/uploads/2020/11/طريقة-حجز-موعد-في-اكسترا.png",

    ),
    Product(
      idd: "p2",
      title: "iPhone",
      description: "af",
      price: 2999,
      imageUrl:
      "https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false",
      storeApp: "https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png",

    ),
    Product(
      idd: "p1",
      title: "iPhone",
      description: "afnan",
      price: 4999,
      imageUrl:
      "https://media.extra.com/i/aurora/100203575_100_01?w=800&h=800&img404=missing_product&v=false",
      storeApp: "https://upload.wikimedia.org/wikipedia/ar/thumb/7/7e/Extra_Logo.svg/1200px-Extra_Logo.svg.png",

    ),
  ];

  //var _showFavoriteOnly = false;
  List<Product> get items {
    // if (_showFavoriteOnly){
    //  return _items.where((prodItem) => prodItem.isFavorite).toList();


    return [..._items];
  }

// void showFavoriteOnly(){
  // _showFavoriteOnly = true;
  //notifyListeners();
//}
//void showAll(){
  // _showFavoriteOnly = false;
//  notifyListeners();
//}
  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String idd) {
    // error
    return items.firstWhere((prod) => prod.idd == idd);
  }

  void addProduct(Product product) {
    final newProduct = Product(
        title: product.title,
        imageUrl: product.imageUrl,
        capicty: product.capicty,
        network: product.network,
        other: product.other,
        storeApp: product.storeApp,
        price: product.price,
        idd: DateTime.now().toString(),
        description: product.description,
        count: product.count
    );
    _items.add(newProduct);
    _items.insert(0, newProduct);
    notifyListeners();
  }
}
/*
void deleteProduct(String id) {
  _items.removeWhere((prod) => prod.id == id);
  notifyListeners();
}
}

 */