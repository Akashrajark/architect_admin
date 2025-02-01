import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ArchitectScreen extends StatelessWidget {
  const ArchitectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 215, 215),
      appBar: AppBar(
          title: Text('Architect',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search architects...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add),
                  label: const Text('Invite Architect'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Phone')),
                  DataColumn(label: Text('Plans')),
                  DataColumn(label: Text('Status')),
                  DataColumn(
                      label: Text(
                    'Actions',
                  )),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'John',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('john@123.com'),
                        ],
                      )),
                      DataCell(Text('1234567890')),
                      DataCell(Text('Mordern residential')),
                      DataCell(Text('approved')),
                      DataCell(Text('View Details')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Jane',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('jane@123.com'),
                        ],
                      )),
                      DataCell(Text('9876543210')),
                      DataCell(Text('Sustainable residential')),
                      DataCell(Text('pending')),
                      DataCell(Text('View Details')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
