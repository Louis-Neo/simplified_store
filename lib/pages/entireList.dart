import 'package:backpackers/model/model.dart';
import 'package:backpackers/pages/cartPage.dart';
import 'package:backpackers/widgets/productCards.dart';
import 'package:backpackers/widgets/recommendItem.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {

  String title;
  List<BackPack> products;

  ProductList({this.products, this.title});

  @override
  Widget build(BuildContext context) {

    double childWidth = MediaQuery.of(context).size.width/1.5;
    double childHeight = MediaQuery.of(context).size.height - 330.0;

    _buildSliverGrid(){
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30.0,
          childAspectRatio: (childWidth/childHeight)
        ),
        delegate: SliverChildBuilderDelegate((context, index){
          return ProductCard(product: products[index]);
        },
        childCount: products.length
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xfff3f6fb),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black87, size: 22.0),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite, size: 22.0, color: Colors.black87),
                onPressed: (){

                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, size: 22.0, color: Colors.black87),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              SizedBox(width: 20.0)
            ],
            floating: true,
            backgroundColor: Color(0xfff3f6fb),
            elevation: 0.0,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Accessories", style: TextStyle(color: Colors.black87, fontSize: 18)),
              ),
              Recommended(),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(title, style: TextStyle(color: Colors.black87, fontSize: 22)),
              ),
              SizedBox(height: 30.0)
            ]),
          ),
          _buildSliverGrid()
        ],
      )
    );
  }

}
