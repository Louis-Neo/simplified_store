import 'package:flutter/material.dart';

class Delivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: double.infinity,
          height: 100.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xfff3f6fb),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 8),
                blurRadius: 8
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 220.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("When will you get your stuff?", style: TextStyle(fontSize: 16.0)),
                    Icon(Icons.arrow_forward_ios, size: 15.0, color: Colors.black87)
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.motorcycle, size: 16.0, color: Colors.black87),
                  SizedBox(width: 10.0),
                  Text("Standard delivery options available", style: TextStyle(fontSize: 15.0))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.business, size: 16.0, color: Colors.black87),
                  SizedBox(width: 10.0),
                  Text("Free collection spots. Opened 7 days a week", style: TextStyle(fontSize: 15.0))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingleDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: double.infinity,
          height: 130.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xfff3f6fb),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 8),
                    blurRadius: 8
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 280.0,
                        height: 50.0,
                      child: Text("Buying a single item might not qualify you for free delivery", style: TextStyle(fontSize: 16.0), overflow: TextOverflow.ellipsis, maxLines: 3),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Enter your delivery address", style: TextStyle(fontSize: 15.0)),
                  SizedBox(width: 10.0),
                  Icon(Icons.add_circle_outline, color: Colors.black87, size: 16.0)
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.business, size: 16.0, color: Colors.black87),
                  SizedBox(width: 10.0),
                  Text("Select collection spot", style: TextStyle(fontSize: 15.0))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
