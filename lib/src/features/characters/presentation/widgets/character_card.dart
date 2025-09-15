import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';
import 'character_modal.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(13, 124, 133, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(235, 255, 110, 1))
      ),
      child: ListTile(
        leading: Image.network(character.image),
        title: Text(character.name, style: TextStyle(color: Colors.white),),
        subtitle: Text(traduzStatus(character.status), style: TextStyle(color: Colors.white),),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => CharacterModal(character: character),
          );
        },
      ),
    );
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
}
