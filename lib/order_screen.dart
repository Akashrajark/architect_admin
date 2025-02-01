import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('ORDER ID')),
                DataColumn(label: Text('DATE')),
                DataColumn(label: Text('STATUS')),
                DataColumn(label: Text('ACTIONS')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('#1\nPlan ID: 1')),
                  const DataCell(Text('3/10/2024\n3:30:00 PM')),
                  DataCell(Row(
                    children: const [
                      Icon(Icons.access_time, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('pending', style: TextStyle(color: Colors.orange)),
                    ],
                  )),
                  DataCell(Row(
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.check_circle, color: Colors.green),
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
                  DataCell(Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 4),
                      Text('approved', style: TextStyle(color: Colors.green)),
                    ],
                  )),
                  DataCell(Row(
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.check_circle, color: Colors.green),
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
          ],
        ),
      ),
    );
  }
}
