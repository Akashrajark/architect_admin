import 'package:dream_home_admin/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() ontap;
  final bool isSelected;

  const CustomDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? primaryColor : secondaryColor,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(32),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? secondaryColor : iconColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? secondaryColor : iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
