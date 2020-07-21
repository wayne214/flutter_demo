import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/shop_provider/models/cart.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headline,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline;
    var cart = Provider.of<CartModel>(context);

    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: Text(
                cart.items[index].name,
                style: itemNameStyle,
              ),
            ));
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.headline.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CartModel>(
              builder: (context, cart, child) => Text(
                '\$${cart.totalPrice}',
                style: hugeStyle,
              ),
            ),
            SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not support yet')));
              },
              color: Colors.white,
              child: Text('BUY'),
            )
          ],
        ),
      ),
    );
  }
}
