import 'package:backpackers/model/cartbloc.dart';
import 'package:backpackers/model/model.dart';
import 'package:backpackers/pages/cartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {

  final BackPack product;

  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);

    var favBloc = Provider.of<CartBloc>(context);
    int cost = product.cost;

    Icon iconChange(bool isTrue){
      if(isTrue == true){
        return Icon(Icons.shopping_cart, color: Colors.black87, size: 20.0);
      }

      return Icon(Icons.add_shopping_cart, color: Colors.black87, size: 20.0);
    }

    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 10,
      color: Colors.transparent,
      shadowColor: Colors.black12,
      child: Container(
        margin: EdgeInsets.only(right: 10.0, left: 10.0),
        width: 175.0,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 8),
                  blurRadius: 8
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130.0,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(product.name, style: TextStyle(fontSize: 18.0)),
                  Container(
                    width: double.infinity - 10,
                      height: 40.0,
                      child: Text(product.description, style: TextStyle(fontSize: 14), maxLines: 2, overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),
            Spacer(),
            Material(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        favBloc.addToFav(product);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Item added to favourites list", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.blueGrey,
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              action: SnackBarAction(
                                label: "Go To Favs",
                                textColor: Colors.greenAccent,
                                onPressed: (){

                                },
                              ),
                            )
                        );
                      },
                        child: Icon(Icons.favorite_border, color: Colors.black87, size: 20.0)),
                    SizedBox(width: 10.0),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: (){
                        bloc.addToCart(product);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Item added to cart", style: TextStyle(color: Colors.white, fontSize: 16.0)),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.blueGrey,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            action: SnackBarAction(
                              label: "GO TO CART",
                              textColor: Colors.greenAccent,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                              },
                            ),
                          )
                        );
                        iconChange(!true);
                      },
                        child: iconChange(!true)
                    ),
                    Spacer(),
                    Text("R$cost", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, fontFamily: 'Raleway'))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
