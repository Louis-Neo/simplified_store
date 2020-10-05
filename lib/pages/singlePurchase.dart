import 'package:backpackers/model/model.dart';
import 'package:backpackers/widgets/deliveries.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {

  BackPack product;

  SingleItem(this.product);

  @override
  Widget build(BuildContext context) {

    int price = product.cost;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff3f6fb),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87, size: 22.0),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xfff3f6fb),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 180.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover
                      ),
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
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 180.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.name, style: TextStyle(color: Colors.black87, fontSize: 22.5)),
                        SizedBox(height: 5.0),
                        Container(
                          height: 50.0,
                          width: 150.0,
                          child: Text(product.description,
                            style: TextStyle(color: Colors.black87, fontSize: 18.0),
                            maxLines: 2, overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: 80.0,
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
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(product.rating.toString(), style: TextStyle(color: Colors.black87, fontSize: 16.0)),
                                Icon(Icons.star, color: Colors.yellow, size: 14.0),
                                SizedBox(width: 5.0),
                                Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 14.0)
                              ],
                            )
                          ),
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("R$price", style: TextStyle(color: Colors.black87, fontSize: 25.0)),
                            Text(" (excluding delivery)", style: TextStyle(color: Colors.black87, fontSize: 14.0))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 50.0),
              SingleDelivery(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        width: double.infinity,
        color: Color(0xfff3f6fb),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: OutlineButton(
                color: Color(0xfff3f6fb),
                borderSide: BorderSide(
                  color: Colors.black87
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 80.0,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Next", style: TextStyle(color: Colors.black87, fontSize: 18.0)),
                        SizedBox(width: 10.0),
                        Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 18.0)
                      ],
                    )
                  ),
                ),
                onPressed: (){

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
