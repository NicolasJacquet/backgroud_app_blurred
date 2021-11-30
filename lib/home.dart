import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blur app demo'),
      ),
      body: const Center(
        child: Text(
          'Demo text',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
