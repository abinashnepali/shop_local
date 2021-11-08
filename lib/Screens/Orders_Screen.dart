import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/OrderProvider.dart';
import '../Widgets/Order_Screen_item.dart';
import '../Widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/OrderScreen';

  @override
  Widget build(BuildContext context) {
    final orderObj = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderObj.getOrderItems.length,
        itemBuilder: (ctx, i) => OrderItemScreen(orderObj.getOrderItems[i]),
      ),
    );
  }
}
