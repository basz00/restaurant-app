import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.star,
              size: 15,
            )),
        Text('$rating')
      ],
    );
  }
}
