import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Card(
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            color: Colors.grey.shade200,
            elevation: 4,
            child: ListTile(
              title: const Text(
                'Simple Animations',
                style: TextStyle(fontSize: 22),
              ),
              subtitle: const Text(
                'Simple animations with custom controller...',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                context.pushNamed('animationOneScreen');
              },
            ),
          ),
        ],
      ),
    );
  }
}
