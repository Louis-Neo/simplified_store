import 'package:backpackers/model/cartbloc.dart';
import 'package:backpackers/pages/cartPage.dart';
import 'package:backpackers/widgets/accessoriesSection.dart';
import 'package:backpackers/widgets/photographer.dart';
import 'package:backpackers/widgets/premium.dart';
import 'package:backpackers/widgets/regular.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/classic.dart';
import '../widgets/gym.dart';

class BackPack extends StatefulWidget {
  @override
  _BackPackState createState() => _BackPackState();
}

class _BackPackState extends State<BackPack> {

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart.length;

    return Scaffold(
      backgroundColor: Color(0xfff3f6fb),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("BackPackers", style: TextStyle(fontSize: 23.0, color: Colors.black)),
            actions: <Widget>[
              IconButton(
                onPressed: cart > 0 ? (){

                } : (){
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          backgroundColor: Color(0xfff3f6fb),
                          title: Text("Wish List", style: TextStyle(fontSize: 18.0)),
                          titlePadding: EdgeInsets.only(left: 15.0, top: 15.0),
                          content: Text("All favoured items will be listed in here for future reference and be shared with friends", style: TextStyle(fontSize: 15.0)),
                          contentPadding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
                          actions: <Widget>[
                            RaisedButton(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Okay Cool", style: TextStyle(fontSize: 14.0, color: Colors.black)),
                              color: Color(0xfff3f6fb),
                            )
                          ],
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        );
                      }
                  );
                },
                icon: Icon(Icons.favorite_border, color: Colors.black87),
              ),
              IconButton(
                  onPressed: cart > 0 ? (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                  }:(){
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            backgroundColor: Color(0xfff3f6fb),
                            title: Text("Basket", style: TextStyle(fontSize: 18.0)),
                            titlePadding: EdgeInsets.only(left: 15.0, top: 15.0),
                            content: Text("All items ready for purchase will be listed in the cart ready for checkout", style: TextStyle(fontSize: 15.0)),
                            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
                            actions: <Widget>[
                              RaisedButton(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("Okay Cool", style: TextStyle(fontSize: 14.0, color: Colors.black)),
                                color: Color(0xfff3f6fb),
                              )
                            ],
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                          );
                        }
                    );
                  },
                  icon: Icon(Icons.add_shopping_cart, color: Colors.black87)
              )
            ],
            backgroundColor: Color(0xfff3f6fb),
            elevation: 0,
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Accessories Section
              SizedBox(height: 30.0),
              Accessories(),

              //Premium Bags
              SizedBox(height: 15.0),
              PremiumBags(),

              //Classic Bags Section
              SizedBox(height: 30.0),
              ClassicBags(),

              //Regular Style Bags Section
              SizedBox(height: 30.0),
              RegularBags(),

              //Gym Bags Section
              SizedBox(height: 30.0),
              GymBags(),

              //Photographers' Section
              SizedBox(height: 30.0),
              PhotographerBags(),

              SizedBox(height: 30.0)
            ]),
          )
        ],
      ),
    );
  }
}
