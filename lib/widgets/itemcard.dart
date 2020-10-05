import 'package:backpackers/model/itemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ItemCard extends StatelessWidget {

  final Accessories item;

  ItemCard({this.item});

  @override
  Widget build(BuildContext context) {

    int cost = item.price;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100.0,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
              child: Image.asset(item.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name, style: TextStyle(fontSize: 18.0)),
                    Container(
                      width: 100.0,
                        child: Text(item.description, style: TextStyle(fontSize: 14), maxLines: 2, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis)
                    ),
                  ],
                ),
                Text("R$cost", style: TextStyle(fontSize: 16.0, fontFamily: 'Raleway', fontWeight: FontWeight.w700))
              ],
            ),
          )
        ],
      ),
    );
  }
}
