import 'package:flutter/material.dart';
import 'package:flutter_challenges/challenges/instagram_redesign/pages/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeInstagramPage(),
                  ),
                );
              },
              child: const Text('instagram redesign'),
            ),
          ],
        ),
      ),
    );
  }
}
