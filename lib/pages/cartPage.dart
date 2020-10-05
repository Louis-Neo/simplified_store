import 'package:backpackers/model/cartbloc.dart';
import 'package:backpackers/pages/singlePurchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;

    int totalCost = bloc.totalCost;

    return Scaffold(
      backgroundColor: Color(0xfff3f6fb),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
        ),
        title: Text("Cart", style: TextStyle(fontSize: 25.0, color: Colors.black87)),
        backgroundColor: Color(0xfff3f6fb),
        elevation: 8.0,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          var giftIndex = cart.elementAt(index);
          return Dismissible(
            key: Key(cart.toString()),
            onDismissed: (direction){
              if(direction == DismissDirection.endToStart){
                setState(() {
                  bloc.clearFromCart(giftIndex);
                });
                Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Item removed from cart"),
                      backgroundColor: Colors.blueGrey,
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      action: SnackBarAction(
                        label: "Undo",
                        textColor: Colors.greenAccent,
                        onPressed: (){
                          bloc.addToCart(giftIndex);
                        },
                      ),
                    )
                );
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SingleItem(giftIndex)));
                bloc.clearFromCart(giftIndex);
              }
            },
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
              child: Container(
                height: 135.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xfff3f6fb),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 8.0),
                      blurRadius: 8.0
                    )
                  ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                      child: Container(
                        height: double.infinity,
                        width: 175.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(giftIndex.image),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(giftIndex.name, style: TextStyle(fontSize: 20.0))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Material(
        elevation: 50.0,
        color: Color(0xfff3f6fb),
        shadowColor: Colors.black,
        child: Container(
          height: 80.0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Order Total", style: TextStyle(fontSize: 16.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("R $totalCost", style: TextStyle(fontSize: 22.0)),
                        SizedBox(width: 5.0),
                        Icon(Icons.keyboard_arrow_up, size: 22.0)
                      ],
                    )
                  ],
                ),
                Spacer(),
                Container(
                  height: 55.0,
                  width: 180.0,
                  child: OutlineButton(
                    color: Color(0xfff3f6fb),
                    borderSide: BorderSide(
                      color: Colors.black87
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("CHECKOUT NOW", style: TextStyle(fontSize: 18.0)),
                        SizedBox(width: 5.0),
                        Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18.0)
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      )
    );
  }

  Widget slideRightBackground(){
    return Container(
      color: Colors.greenAccent,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 20.0),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
            SizedBox(width: 5.0),
            Text("Buy Seperate", style: TextStyle(color: Colors.white, fontSize: 16.0), textAlign: TextAlign.left)
          ],
        ),
      )
    );
  }

  Widget slideLeftBackground(){
    return Container(
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete, color: Colors.white),
              SizedBox(width: 20.0),
              Text("Delete", style: TextStyle(color: Colors.white, fontSize: 16.0), textAlign: TextAlign.right),
              SizedBox(width: 20.0)
            ],
          ),
        )
    );
  }
}
