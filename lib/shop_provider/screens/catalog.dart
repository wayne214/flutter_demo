import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/shop_provider/models/cart.dart';
import 'package:flutter_app/shop_provider/models/catalog.dart';


class MyCatalog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12,)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index)=> _MyListItem(index)),
          )
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget{
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
        onPressed: cart.items.contains(item) ? null : () => cart.add(item),
        child: cart.items.contains(item) ?
            Icon(Icons.check, semanticLabel: 'ADDED')
            : Text('ADD'),
    );
  }
}


class _MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.headline),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: ()=> Navigator.pushNamed(context, '/cart'),
        )
      ]
    );
  }

}

class _MyListItem extends StatelessWidget{
  final int index;

  const _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context);
    var item = catalog.getByPosition(index);
    var textTheme = Theme.of(context).textTheme.headline;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme)),
            SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }

}