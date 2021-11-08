import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/CartProvider.dart';
import 'Providers/OrderProvider.dart';
import 'Providers/Product_Provider.dart';
import 'Screens/AddEdit_Screen.dart';
import 'Screens/Orders_Screen.dart';
import 'Screens/Product_Detail_Screen.dart';
import 'Screens/Products_OverView_Screen.dart';
import 'Screens/Cart_Screen.dart';
import 'Screens/User_Product_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => OrderProvider(),
          )
        ],
        child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primaryColor: Color.fromRGBO(24, 154, 180, 1),
            accentColor: Color.fromRGBO(117, 230, 218, 1),
            canvasColor: Color.fromRGBO(248, 250, 253, 1),
            buttonColor: Color.fromRGBO(108, 194, 138, 1),
            indicatorColor: Color.fromRGBO(253, 121, 36, 1),
            fontFamily: 'Lato',

            //back color rgb(212,241,244) rgb(163,235,177)
          ),
          home: ProductOveriviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrderScreen.routeName: (ctx) => OrderScreen(),
            UserProductScreen.routeName: (ctx) => UserProductScreen(),
            AddEditProductScreen.routeName: (ctx) => AddEditProductScreen(),
          },
        ));
  }
}
