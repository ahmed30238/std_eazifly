import 'package:flutter/material.dart';

class ProgramsView extends StatelessWidget {
  const ProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs'),
      ),
      body: Center(
        child: const Text('Welcome to Programs!'),
      ),
    );
  }
}
