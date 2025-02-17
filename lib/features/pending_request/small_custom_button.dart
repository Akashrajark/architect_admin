import 'package:flutter/material.dart';

class SmallCustomButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  const SmallCustomButton({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
