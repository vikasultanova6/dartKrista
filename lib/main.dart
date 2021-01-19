import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_shop/pages/catalog.dart';
import 'package:online_shop/pages/cart.dart';
import 'package:online_shop/pages/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.deepOrange,
        primaryColor: Colors.cyanAccent,
        //primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
    var _currentIndex = 0;

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
            index: _currentIndex,
            children: [Catalog(), Profile(), Cart()], 
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (selectedIndex){
                setState(() {
                    _currentIndex = selectedIndex;
                });
            },
            currentIndex: _currentIndex, 
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Каталог")),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("Профиль")),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("Корзина"))
            ],
        ),
    );
  }
}
