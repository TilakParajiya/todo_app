import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.token, {super.key});
  String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(
          'Hello! Welcome to the Home Screen. \n Your token is $token',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
