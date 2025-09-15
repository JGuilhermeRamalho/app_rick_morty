import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/characters_controller.dart';
import '../widgets/character_card.dart';

class CharactersPage extends GetView<CharactersController> {
  CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 56, 64, 1),
      body: bodyPage(altura, largura),
    );
  }

  Widget bodyPage(double altura, double largura) {
    return SafeArea(
      child: Column(
        children: [
          imageLogo(altura, largura),
          SizedBox(height: altura * 0.03,),
          textCharacters(altura, largura),
          SizedBox(height: altura * 0.02,),
          Expanded(
            child: listCharacters(),
          ),
        ],
      ),
    );
  }

  Widget imageLogo(double altura, double largura) {
    return Container(
      height: altura * 0.15,
      width: largura * 0.8,
      child: SvgPicture.asset('assets/logo.svg', fit: BoxFit.fitWidth)
    );
  }

  Widget textCharacters(double altura, double largura) {
    return Row(
      spacing: largura * 0.02,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Personagens', style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),),
        Container(
            width: largura * 0.45,
            child: Divider(color: Color.fromRGBO(235, 255, 110, 1)))
      ],
    );
  }

  Widget listCharacters() {
    return Obx(() {
      if (controller.isLoading.value && controller.characters.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 5,
        ),
        itemCount: controller.characters.length + 1,
        itemBuilder: (context, index) {
          if (index < controller.characters.length) {
            return CharacterCard(character: controller.characters[index]);
          } else {
            if (controller.isLoadingMore.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: controller.loadMoreCharacters,
                child: const Text("+ Carregar mais"),
              ),
            );
          }
        },
      );
    });
  }

}

