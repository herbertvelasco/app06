import 'package:flutter/material.dart';

class ItemDatawidget extends StatelessWidget {
  String title;
  String data;
  ItemDatawidget({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            "$title",
            style: TextStyle(color: Colors.black45),
          ),
          Text(
            data,
          ),
        ],
      ),
    );
  }
}
