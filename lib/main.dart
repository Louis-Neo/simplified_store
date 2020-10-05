import 'package:backpackers/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'model/cartbloc.dart';


void main() => runApp(
  ChangeNotifierProvider<CartBloc>(
    create:(_) => CartBloc(),
    child: MaterialApp(
      home: BackPack(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Baloo'
      ),
    ),
  )
);

