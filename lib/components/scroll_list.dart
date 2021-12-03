import 'package:flok/constants.dart';
import 'package:flutter/material.dart';

class List extends StatelessWidget {
  const List({ Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                image,
                width: cwidth,
                height: cheight,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}