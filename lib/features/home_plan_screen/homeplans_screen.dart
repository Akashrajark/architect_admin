import 'package:dream_home_admin/common_widget/custom_button.dart';
import 'package:flutter/material.dart';

class HomeplansScreen extends StatelessWidget {
  const HomeplansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'HomePlans',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  CustomButton(
                    iconData: Icons.add_circle,
                    label: 'Add Homeplan',
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
