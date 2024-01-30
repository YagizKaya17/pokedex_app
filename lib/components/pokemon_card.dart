import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyPokeCard extends StatelessWidget {
  final String name;
  final List<String> types;
  final String imageUrl;
  const MyPokeCard({
    super.key, 
    required this.name, 
    required this.types, 
    required this.imageUrl
  });

  static late bool isPortrait;

  @override
  Widget build(BuildContext context) {isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: selectColor(types[0]).color,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  
                  Expanded(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: types.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 5,),
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Text(
                                types[index],
                                style: Theme.of(context).textTheme.bodySmall, 
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  color: Colors.transparent,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return CachedNetworkImage(
                        imageUrl: imageUrl, 
                        width: isPortrait ? constraints.maxWidth / 2 : constraints.maxWidth / 2, 
                        height: isPortrait ? constraints.maxHeight - 20 : constraints.maxHeight - 10
                      );
                    },
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum CardColor {
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy
}

extension CardColorExtension on CardColor {
  Color get color {
    switch (this) {
      case CardColor.fire:
        return const Color(0xFFff4422);
      case CardColor.water:
        return const Color(0xFF3399ff);
      case CardColor.electric:
        return const Color(0xFFffcc33);
      case CardColor.grass:
        return const Color(0xFF77cc55);
      case CardColor.ice:
        return const Color(0xFF66ccff);
      case CardColor.fighting:
        return const Color(0xFFbb5544);
      case CardColor.poison:
        return const Color(0xFFaa5599);
      case CardColor.ground:
        return const Color(0xFFddbb55);
      case CardColor.flying:
        return const Color(0xFF8899ff);
      case CardColor.psychic:
        return const Color(0xFFff5599);
      case CardColor.bug:
        return const Color(0xFFbbaa66);
      case CardColor.rock:
        return const Color(0xFFbbaa66);
      case CardColor.ghost:
        return const Color(0xFF6666bb);
      case CardColor.dragon:
        return const Color(0xFF7766ee);
      case CardColor.dark:
        return const Color(0xFF775544);
      case CardColor.steel:
        return const Color(0xFFaaaabb);
      case CardColor.fairy:
        return const Color(0xFFee99ee);
      default:
        return const Color(0xFFff4422);
    }
  }
}

CardColor selectColor(String type) {
  switch (type.toLowerCase()) {
    case 'bug':
      return CardColor.bug;
    case 'dark':
      return CardColor.dark;
    case 'dragon':
      return CardColor.dragon;
    case 'electric':
      return CardColor.electric;
    case 'fairy':
      return CardColor.fairy;
    case 'fighting':
      return CardColor.fighting;
    case 'fire':
      return CardColor.fire;
    case 'flying':
      return CardColor.flying;
    case 'ghost':
      return CardColor.ghost;  
    case 'grass':
      return CardColor.grass;
    case 'ground':
      return CardColor.ground;
    case 'ice':
      return CardColor.ice;    
    case 'poison':
      return CardColor.poison;    
    case 'psychic':
      return CardColor.psychic;    
    case 'rock':
      return CardColor.rock;
    case 'steel':
      return CardColor.steel;            
    case 'water':
      return CardColor.water;    
    default:
      return CardColor.dark;
  }
}
