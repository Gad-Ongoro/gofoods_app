import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('GOFoods'),
      ),
      body: const Center(
        child: Text(
        'Home',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
          )
        )
      ),
    );
  }
}