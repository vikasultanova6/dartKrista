import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_shop/pages/product.dart';
import 'package:online_shop/models/productModel.dart';
import 'package:online_shop/pages/data.dart';

class Catalog extends StatefulWidget {
  Catalog({Key key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<ProductModel> _products = List<ProductModel>();

  @override
  void initState() {
    _products = DataDumper.getProducts();
    DataDumper.getProductsOnline();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Каталог"),
        ),
        body: 
        FutureBuilder(
            future: DataDumper.getProductsOnline(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                    _products = snapshot.data;
                    return makeList();
                }
                else {
                    return Center(
                        child: CircularProgressIndicator(), 
                    );
                }
            }, 
        ),
        
    );
  }

  makeList(){
    return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                    leading: Container(
                        width: 36,
                        height: 36,                            
                        child: Image.network(
                            _products.elementAt(index).image,
                            fit: BoxFit.cover,
                        ),
                    ),
                    title: Text(_products.elementAt(index).title),
                    subtitle: Text(_products.elementAt(index).description),
                    trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                            setState(() {
                                DataDumper.addCart(_products.elementAt(index));
                            });                                
                        },
                        ),
                    onTap: () {
                        Navigator.push(
                            context, 
                            CupertinoPageRoute(builder: (_) => 
                            Product(model: _products.elementAt(index))));
                    },
                ),
                
            );
        },
    );
  }
}