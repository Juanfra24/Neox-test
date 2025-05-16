import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notices_app/presentation/pages/favorites.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notices App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Work in progress', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/favorites');
              },
              child: Text('Navigate'),
            ),
          ],
        ),
      ),
    );
  }
}
