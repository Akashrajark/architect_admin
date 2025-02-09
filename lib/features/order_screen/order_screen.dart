import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Expanded(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('ORDER ID')),
              DataColumn(label: Text('DATE')),
              DataColumn(label: Text('STATUS')),
              DataColumn(label: Text('ACTIONS')),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('#1\nPlan ID: 1')),
                const DataCell(Text('3/10/2024\n3:30:00 PM')),
                const DataCell(Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('pending', style: TextStyle(color: Colors.orange)),
                  ],
                )),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check_circle, color: Colors.green),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text('#2\nPlan ID: 2')),
                const DataCell(Text('3/9/2024\n9:00:00 PM')),
                const DataCell(Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 4),
                    Text('approved', style: TextStyle(color: Colors.green)),
                  ],
                )),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check_circle, color: Colors.green),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
