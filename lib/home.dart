import 'package:flutter/material.dart';
import 'challenges/instagram_redesign/pages/home.dart';
import 'challenges/sliding_login.dart/sliding_login.dart';

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
              child: const Text('Instagram redesign'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SlidingLoginPage(),
                  ),
                );
              },
              child: const Text('Slidign login'),
            ),
          ],
        ),
      ),
    );
  }
}
