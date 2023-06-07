import 'package:flutter/material.dart';

import 'package:pokodex/constant/ui_helper.dart';

import 'package:pokodex/model/pokemon_model.dart';
import 'package:pokodex/service/pokodex_api.dart';
import 'package:pokodex/widget/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;
  @override
  // ignore: must_call_super
  void initState() {
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<PokemonModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> _myList = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: UIHelper.getViewBuilderOriantionCrossAxixCount(),
              ),
              itemCount: _myList.length,
              itemBuilder: (BuildContext context, int index) {
                return PokeListItem(pokemon: _myList[index]);
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Hata Çıktı",style: TextStyle(color: Colors.white),),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: _pokemonList,
      ),
    );
  }
}
