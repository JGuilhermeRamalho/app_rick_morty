import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/characters/presentation/pages/characters_page.dart';
import 'features/characters/characters_binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: CharactersBinding(),
      home: CharactersPage(),
    );
  }
}
