import 'package:dream_home_admin/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            runSpacing: 20,
            spacing: 20,
            children: [
              DasboardCard(
                label: 'Total Architect',
                iconbgcolor: Colors.blue,
                value: '565',
                icon: Icons.architecture,
              ),
              DasboardCard(
                label: 'Total Category',
                iconbgcolor: Colors.green,
                value: '565',
                icon: Icons.category_outlined,
              ),
              DasboardCard(
                label: 'Total Homeplane',
                iconbgcolor: Colors.purple,
                value: '565',
                icon: Icons.foundation,
              ),
              DasboardCard(
                label: 'Total Purchase',
                iconbgcolor: Colors.orange,
                value: '565',
                icon: Icons.attach_money,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: (Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Growth Overview',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Chart placeholder-Growth metrics will be displayed here',
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        )
                      ]),
                )),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Activity',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DasboardCard extends StatelessWidget {
  final String label;
  final Color iconbgcolor;
  final String value;
  final IconData icon;
  const DasboardCard({
    super.key,
    required this.label,
    required this.iconbgcolor,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: outlineColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            CircleAvatar(
              backgroundColor: iconbgcolor,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
