import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_shop/Providers/OrderProvider.dart';

class OrderItemScreen extends StatefulWidget {
  final OrderModel orderModel;

  OrderItemScreen(this.orderModel);

  @override
  _OrderItemScreenState createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$ ${widget.orderModel.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy   hh:mm')
                  .format(widget.orderModel.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.orderModel.products.length * 20 + 50, 150),
              child: ListView(
                children: widget.orderModel.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${prod.quantity} x \$${prod.price}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
