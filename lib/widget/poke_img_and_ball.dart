import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:pokodex/constant/constants.dart';
import 'package:pokodex/constant/ui_helper.dart';
import 'package:pokodex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.pokeballImageUrl,
            width: UIHelper.calculatePokeImgandBallSize(),
            height: UIHelper.calculatePokeImgandBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? "https://toppng.com/uploads/preview/warning-icon-11552769738dqsq0g82mv.png",
              width: UIHelper.calculatePokeImgandBallSize(),
              height: UIHelper.calculatePokeImgandBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
