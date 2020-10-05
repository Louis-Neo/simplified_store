import 'package:flutter/material.dart';

class Accessories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("Accessories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 15),
                          blurRadius: 15
                      )
                    ]
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("What's In Your Bag?", style: TextStyle(fontSize: 18)),
                          Text("Get all items needed to keep you productive", style: TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis, maxLines: 2)
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: (){},
                          ),
                          Spacer()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
