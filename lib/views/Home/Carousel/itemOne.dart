import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Image.asset('assets/images/ads/1.png', fit: BoxFit.fitWidth)
    );
  }
}