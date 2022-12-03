import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app06/ui/widges/item_types_widget.dart';

class itempokemonwidget extends StatelessWidget {
  String name;
  String image;
  itempokemonwidget({
    required this.name,
    required this.image,
    List<String> types,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff4CCFB2),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            right: -20,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 120.0,
              color: Colors.white.withOpacity(0.27),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Column(children: types.map((e) =>ItemTypeWidget()).toList(),),
                ...types.map((e) => ItemTypeWidget(text: e)).toList(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.network(image),
          ),
        ],
      ),
    );
  }
}
