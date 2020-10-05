import 'package:backpackers/model/model.dart';
import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {

  static List<BackPack> _cart = [];

  List<BackPack> cart = _cart;

  int _totalCost = 0;

  int get totalCost => _totalCost;

  void addToCart(BackPack product){
    if(!_cart.contains(product)){
      _cart.add(product);
      _totalCost += product.cost;
    }
    notifyListeners();
  }

  void clearFromCart(BackPack product){
    if(_cart.contains(product)){
      _cart.remove(product);
      _totalCost -= product.cost;
    }
    notifyListeners();
  }

  static List<BackPack> _fav = [];
  List<BackPack> fav = _fav;

  void addToFav(BackPack product){
   if(_fav.contains(product)){
     _fav.add(product);
   }
    notifyListeners();
  }

  void clearFav(BackPack product){
    if(_fav.contains(product)){
      _fav.remove(product);
    }
  }

}
