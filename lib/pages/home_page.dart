import 'dart:convert';
import 'dart:math';
import 'package:app06/models/pokemon_model.dart';
import 'package:app06/ui/widges/item_pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {
  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  List pokemons = [];
  List<PokemonModel> pokemonsModel = [];
  @override
  void initState() {
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      //pokemons = myMap["pokemon"];
      pokemonsModel =
          myMap["pokemon"].map((e) => pokemonsModel.fromJson(e)).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "PokeDex",
                  style: TextStyle(
                    fontSize: 34.00,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GridView.count(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  crossAxisCount: 2,
                  childAspectRatio: 1.35,
                  children: pokemonsModel
                      .map(
                        (e) => itempokemonwidget(
                          // name: e.name,
                          // image: e.img,
                          // types: e.type,
                          pokemon: e,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//http://www.serebeii.net/pokemongo/pokemon/001.png