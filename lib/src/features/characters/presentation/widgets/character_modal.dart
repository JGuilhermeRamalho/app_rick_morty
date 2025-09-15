import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterModal extends StatelessWidget {
  final Character character;

  const CharacterModal({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Container(
      height: altura * 0.4,
      width: largura * 0.8,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(13, 124, 133, 1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: altura * 0.13),
                Text(
                  character.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromRGBO(235, 255, 110, 1), ),
                ),
                SizedBox(height: 8),
                Text("Espécie: ${traduzSpecies(character.species)}", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),),
                Text("Status: ${traduzStatus(character.status)}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
                character.type.isNotEmpty ?
                Text("Tipo: ${character.type}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),) : Container(),
                character.gender.isNotEmpty ?
                Text("Género: ${traduzGender(character.gender)}", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),) : Container(),

              ],
            ),
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Center(
              child: ClipOval(
                child: Image.network(
                  character.image,
                  height: altura * 0.15,
                  width: largura * 0.30,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.close, size: 28, color: Color.fromRGBO(235, 255, 110, 1),),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  String traduzSpecies(String species) {
    switch (species.toLowerCase()) {
      case 'human':
        return 'Humano';
      case 'Alien':
        return 'Alienígena';
      case 'humanoid':
        return 'humanoide';
      case 'mythological creature':
        return 'Criatura mitológica';
      default:
        return species;
    }
  }

  String traduzStatus(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return 'Vivo';
      case 'dead':
        return 'Morto';
      case 'unknown':
        return 'Desconhecido';
      default:
        return status;
    }
  }

  String traduzGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'Masculino';
      case 'female':
        return 'Feminino';
      default:
        return gender;
    }
  }

}
