import 'package:flutter/material.dart';

class HomeplansScreen extends StatelessWidget {
  const HomeplansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePlans',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add New Plan',
              style: TextStyle(color: Colors.black),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          const SizedBox(width: 16)
        ],
      ),
    );
  }
}
