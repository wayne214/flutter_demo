import 'package:flutter/foundation.dart';
import 'package:flutter_app/shop_provider/models/catalog.dart';


class CartModel extends ChangeNotifier{
  CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    assert(_itemIds.every((id)=> newCatalog.getById(id) !=null),
      "The catalog does not have one of in it."
    );

    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id)=> _catalog.getById(id)).toList();


  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // 添加item, this is the only way to modify the cart from outside;
  void add(Item item){
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}