import 'package:app06/models/pokemon_model.dart';
import 'package:app06/ui/general/colors.dart';
import 'package:app06/ui/widges/item_data_widget.dart';
import 'package:app06/ui/widges/item_types_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  PokemonModel pokemon;
  DetailPage({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.1,
            right: -25,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              color: Colors.white.withOpacity(0.26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: pokemon.type
                          .map((e) => ItemTypeWidget(text: e))
                          .toList(),
                    ),
                  ],
                ),
                Text(
                  "#${pokemon.numPokemon}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ItemDatawidget(
                              title: "Height",
                              data: pokemon.height,
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: -90.0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            pokemon.img,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
