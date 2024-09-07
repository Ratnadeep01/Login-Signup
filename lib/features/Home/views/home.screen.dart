import 'package:assignment_intern/common/widgets/appBar.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: 'HOME SCREEN',
      ),
      body: Center(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
