import 'package:flutter/material.dart';

class HomeplansScreen extends StatelessWidget {
  const HomeplansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HomePlans',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
