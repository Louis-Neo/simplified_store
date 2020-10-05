import 'package:backpackers/model/itemModel.dart';
import 'package:backpackers/model/model.dart';
import 'package:backpackers/pages/cartPage.dart';
import 'package:backpackers/pages/singlePurchase.dart';
import 'package:backpackers/widgets/deliveries.dart';
import 'package:backpackers/widgets/recommendItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product extends StatefulWidget {

  final BackPack productItem;
  final Accessories item;

  Product({this.productItem, this.item});

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {

  // The product page top bar
  ScrollController _scrollController;
  Color _theme;

  @override
  void initState() {
    super.initState();
    _theme = Color(0xfff3f6fb);

    _scrollController = ScrollController()..addListener((){
      if(_isAppBarExpanded){
        if(_theme != Colors.black87){
          setState(() {
            _theme = Colors.black87;
          });
        }
      } else {
        if(_theme != Color(0xfff3f6fb)){
          setState(() {
            _theme = Color(0xfff3f6fb);
          });
        }
      }
    });
  }

  bool get _isAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (250 - kToolbarHeight);
  }



  @override
  Widget build(BuildContext context) {

    int costBackPack = widget.productItem.cost;

    bool _firstStateEnabled = true;

    return Scaffold(
      backgroundColor: Color(0xfff3f6fb),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
           SliverAppBar(
             backgroundColor: Color(0xfff3f6fb),
             elevation: 10.0,
             expandedHeight: 250.0,
             flexibleSpace: LayoutBuilder(
               builder: (BuildContext context, BoxConstraints constraints){
                 return FlexibleSpaceBar(
                   background: Image.asset(widget.productItem.image, fit: BoxFit.cover),
                   title: _isAppBarExpanded ? Text(widget.productItem.name, style: TextStyle(color: Colors.black87)) : Container()
                 );
               },
             ),
             leading: IconButton(
               onPressed: (){
                 Navigator.pop(context);
               },
               icon: Icon(Icons.arrow_back_ios, color: _theme),
             ),
             pinned: true,
             floating: false,
             actions: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Container(
                   width: 90.0,
                   height: 50.0,
                   child: OutlineButton(
                     borderSide: BorderSide(
                         color: _theme
                     ),
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleItem(widget.productItem)));
                     },
                     color: Color(0xfff3f6fb),
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0)
                     ),
                     child: Text("Purchase", style: TextStyle(color: _theme, fontSize: 16.0)),
                   ),
                 ),
               ),
               Padding(
                 padding: EdgeInsets.all(10.0),
                 child: IconButton(
                   icon: Icon(Icons.shopping_cart, color: _theme),
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                   },
                 ),
               )
             ],
           ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.productItem.name, style: TextStyle(color: Colors.black87, fontSize: 28.0)),
                    Spacer(),
                    Icon(Icons.favorite_border, size: 28.0, color: Colors.black87),
                    SizedBox(width: 20.0),
                    Icon(Icons.share, size: 28.0, color: Colors.black87)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Text(widget.productItem.description, style: TextStyle(fontSize: 18.0)),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0, right: MediaQuery.of(context).size.width - 95.0),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color(0xfff3f6fb),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 8),
                          blurRadius: 8
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.productItem.rating.toString(), style: TextStyle(color: Colors.black87, fontSize: 18.0)),
                          Icon(Icons.star, size: 16.0, color: Colors.yellow),
                          SizedBox(width: 5.0),
                          Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 16.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    height: 80.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xfff3f6fb),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 10),
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Available Colors", style: TextStyle(fontSize: 18.0)),
                        SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.blueGrey,
                                radius: 10.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                radius: 10.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreenAccent,
                                radius: 10.0,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              Delivery(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("You May Also Like", style: TextStyle(fontSize: 16.0)),
              ),
              Recommended(),
            ]),
          )
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 50.0,
        color: Color(0xfff3f6fb),
        shadowColor: Colors.black,
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          height: 60.0,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("R$costBackPack", style: TextStyle(fontSize: 22.0)),
                          SizedBox(width: 5.0),
                          Icon(Icons.keyboard_arrow_up, size: 22.0)
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 350),
                    crossFadeState: _firstStateEnabled ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: Container(
                      height: 55.0,
                      width: 160.0,
                      child: OutlineButton(
                        color: Color(0xfff3f6fb),
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){
                          setState(() {
                            _firstStateEnabled = !_firstStateEnabled;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("ADD TO CART", style: TextStyle(fontSize: 18.0)),
                            SizedBox(width: 5.0),
                            Icon(Icons.add_shopping_cart, color: Colors.black87, size: 18.0)
                          ],
                        ),
                      ),
                    ),
                    secondChild: Container(
                      height: 55,
                      width: 60.0,
                      child: OutlineButton(
                        color: Color(0xfff3f6fb),
                        borderSide: BorderSide(
                          color: Colors.black87
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: (){
                          setState(() {
                            _firstStateEnabled = !_firstStateEnabled;
                          });
                        },
                        child: Center(
                          child: Icon(Icons.shopping_cart, color: Colors.lightGreen, size: 18.0),
                        )
                      ),
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
