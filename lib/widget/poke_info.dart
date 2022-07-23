import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokodex/constant/constants.dart';
import 'package:pokodex/constant/ui_helper.dart';
import 'package:pokodex/model/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.w)), color: Colors.white),
      child: Padding(
        padding: UIHelper.getBackArrowPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInformationRow("Adı", pokemon.name),
            _buildInformationRow("Boyu", pokemon.height),
            _buildInformationRow("Kilosu", pokemon.weight),
            _buildInformationRow("Doğma Süresi", pokemon.spawnTime),
            _buildInformationRow("Zayıflıkları", pokemon.weaknesses),
            _buildInformationRow("Neyden Evrildi", pokemon.prevEvolution),
            _buildInformationRow("Neye Evrilecek", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(label,style: Constants.getPokeInfoLabelTextStyle(),),

      if(value is List && value.isNotEmpty)
      Text(value.join(" "),style: Constants.getPokeInfoTextStyle())
      else if(value==null)
       Text("Veri mevcut degil" ,style: Constants.getPokeInfoTextStyle(),)
      else Text(value,style: Constants.getPokeInfoTextStyle())
      
      ],
    );
  }
}
