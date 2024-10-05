import 'package:flutter/material.dart';
import 'package:pathfinder/widgets/buttons/main_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          MainButton(
            onPressed: () {},
            child: const Text('Start counting process'),
          ),
        ],
      ),
    );
  }
}
