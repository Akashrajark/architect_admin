import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() ontap;
  final bool isSelected;
  final Color color;
  final Color iconColor;
  final Color textColor;
  const CustomDrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap,
      this.isSelected = false,
      required this.color,
      required this.iconColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
