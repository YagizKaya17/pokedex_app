import 'package:flutter/material.dart';
import 'package:pokedex_app/components/pokemon_card.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/services/pokemon_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isPortrait;
  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokedex',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FutureBuilder<List<PokemonModel>?>(
            future: PokemonApi.getPokemon(), 
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              else if (snapshot.data == null) {
                return const Center(
                  child: Text(
                    'İnternet bağlantınızı kontrol ediniz'
                  ),
                );
              }
              else {
                List<PokemonModel> pokemonList = snapshot.data!; 
                return GridView.builder(
                  itemCount: pokemonList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isPortrait ? 2 : 3,
                    mainAxisExtent: 120
                  ), 
                  itemBuilder: (context, index) {
                    PokemonModel pokemonModel = pokemonList[index];
                    return MyPokeCard(name: pokemonModel.name!, types: pokemonModel.type!, imageUrl: pokemonModel.img!);
                  },
                );
              }
            },
          )
        ),
      )
    );
  }
}