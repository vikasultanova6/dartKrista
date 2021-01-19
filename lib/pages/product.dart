import 'package:flutter/material.dart';
import 'package:online_shop/models/productModel.dart';
import 'package:online_shop/pages/data.dart';

class Product extends StatefulWidget {
  final ProductModel model;

  Product({Key key, this.model}) : super(key: key);

  @override
  _ProductState createState() => _ProductState(model);
}

class _ProductState extends State<Product> {
  final ProductModel model;

  _ProductState(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(model.title)
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                        model.image,
                        fit: BoxFit.cover,)
                    ),
                Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                model.title, 
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), 
                            ),
                            Text(
                                model.cost.toString() + " руб.", 
                                style: TextStyle(fontSize: 20), 
                            ),
                            Text(model.description),
                        ],
                    ),                    
                ),
                Center(
                    child: RaisedButton(
                        padding: EdgeInsets.all(24),
                        onPressed: () {
                            setState(() {
                                DataDumper.addCart(model);
                            });
                        }, 
                        child: Text("Купить") 
                    ),
                ),                
            ],
        ),  
    );
  }
}