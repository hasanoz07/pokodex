
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  Constants._();
  static const String title="PokeDexplorer";
 static const String pokeballImageUrl = "assets/images/pokeball.png";
  static  TextStyle getTitleStyle(){
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(36),
    );
    
  }
  static  TextStyle getPokemonStyle(){
    return  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(30),
    );
  }
  static  TextStyle getPokemonChipTextStyle(){
    return  TextStyle(
      color: Colors.white,
      
      fontSize: _calculateFontSize(18),
    );
  }
  static double _calculateFontSize(double size){
    if(ScreenUtil().orientation==Orientation.portrait){
      return size;
    }{
      return (size*1.5).sp;
    }
  }

  static TextStyle getPokeInfoTextStyle() {
   return TextStyle(fontSize: _calculateFontSize(16),color:Colors.black);
  }
    static TextStyle getPokeInfoLabelTextStyle() {
     return TextStyle(fontSize: _calculateFontSize(20),fontWeight:FontWeight.bold,color:Colors.black);
  }
}