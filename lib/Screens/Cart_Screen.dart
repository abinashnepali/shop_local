import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import '../Providers/OrderProvider.dart';
import '../Widgets/CartScreen_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  @override
  Widget build(BuildContext context) {
    final cartobj = Provider.of<CartProvider>(context);
    // it call the  getter method which return map of object so
    // to get the value of  cart items values  is used and the return values is of Iterable so
    // toList() is used
    var cartinfo = cartobj.cartItems.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart Details"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$: ${cartobj.cardTotalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      onPressed: () {
                        Provider.of<OrderProvider>(context, listen: false)
                            .addOrderItems(cartinfo, cartobj.cardTotalAmount);
                        cartobj.clearallCart();
                      })
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CardScreenItem(
                cartinfo[i].id,
                cartobj.cartItems.keys.toList()[i],
                cartinfo[i].price,
                cartinfo[i].quantity,
                cartinfo[i].title),
            itemCount: cartobj.carditemCount,
          ))
        ],
      ),
    );
  }
}
