import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Text('NotFound'),
        ],
      ),
    );
  }
}
