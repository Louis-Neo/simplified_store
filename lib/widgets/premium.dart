import 'dart:math';

import 'package:backpackers/model/model.dart';
import 'package:backpackers/pages/entireList.dart';
import 'package:backpackers/pages/productPage.dart';
import 'package:backpackers/widgets/productCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PremiumBags extends StatelessWidget {

  static final _random = Random();

  var _randomPicture = premiumProducts[_random.nextInt(premiumProducts.length)];

  String title = "Business Style";

  @override
  Widget build(BuildContext context) {

    var productsList = premiumProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
          child: Text("Business Style", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        ),
        SizedBox(height: 15.0),
        Container(
          height: 260.0,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              while(index <= 3){
                var product = premiumProducts[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Product(productItem: product)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 25.0),
                    child: ProductCard(
                        product: product,
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(products: productsList, title: title)));
                },
                splashColor: Colors.black12.withOpacity(0.8),
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 25.0),
                    child: Container(
                      margin: EdgeInsets.only(right: 20.0, left: 10.0),
                      width: 175.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_randomPicture.image),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 8),
                                blurRadius: 8
                            )
                          ]
                      ),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xfff3f6fb).withOpacity(0.75),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("See", style: TextStyle(color: Colors.black54, fontSize: 25.0)),
                              Text("All", style: TextStyle(color: Colors.black54, fontSize: 25.0)),
                              Text("Items", style: TextStyle(color: Colors.black54, fontSize: 25.0))
                            ],
                          ),
                        )
                      ),
                    )
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
