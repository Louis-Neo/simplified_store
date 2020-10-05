import 'package:backpackers/model/itemModel.dart';
import 'package:backpackers/widgets/itemcard.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          var item = headphones[index];
          while(index <= 3){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 20.0),
              child: Container(
                height: double.infinity,
                width: 200.0,
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
                child: ItemCard(item: item),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 20.0),
            child: Container(
              height: double.infinity,
              width: 200.0,
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
            ),
          );
        },
      ),
    );
  }
}
