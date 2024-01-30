import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokemonApi {

  static Future<List<PokemonModel>?> getPokemon() async{
    Response response = await Dio().get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    
    if (response.statusCode == 200) {
      var resultJson = jsonDecode(response.data);
      List<PokemonModel> pokemonList = (resultJson["pokemon"] as List).map((e) => PokemonModel.fromJson(e)).toList();
      return pokemonList;
    }
    else {
      return null;
    }
  }
}
