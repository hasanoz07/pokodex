import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokodex/constant/constants.dart';
import 'package:pokodex/constant/ui_helper.dart';
import 'package:pokodex/model/pokemon_model.dart';
import 'package:pokodex/widget/poke_info.dart';
import 'package:pokodex/widget/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getBackArrowPadding(),
            child: IconButton(
              iconSize: 24,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          PokeNameType(pokemon: pokemon),
          SizedBox(
            height: 60.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    Constants.pokeballImageUrl,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(bottom: 0, left: 0, right: 0, top: 0.12.sh, child: PokeInfo(pokemon: pokemon)),
                Align(alignment: Alignment.topCenter,child: Hero(tag:pokemon.id!,child: CachedNetworkImage(imageUrl: pokemon.img??"",height: 0.25.sh,fit: BoxFit.fitHeight,)),)
              ],
              
            ),
          ),
        ],
      )),
    );
  }
}
