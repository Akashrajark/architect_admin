import 'package:dream_home_admin/common_widget/custom_search.dart';
import 'package:dream_home_admin/features/architect_screen/architect_view_detail_screen.dart';
import 'package:flutter/material.dart';

class ArchitectScreen extends StatelessWidget {
  const ArchitectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Architect',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomSearch(
                    onSearch: (p0) {},
                  ),
                  // const SizedBox(width: 16),
                  // ElevatedButton.icon(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.person_add),
                  //   label: const Text('Invite Architect'),
                  //   style:
                  //       ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(10), // Curved border
                  border: Border.all(
                      color: Colors.grey.shade300, width: 1), // Border color
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: DataTable(
                  // headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                  //   (Set<WidgetState> states) {
                  //     return secondaryColor; // Default row color (light grey)
                  //   },
                  // ),
                  // dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                  //   (Set<WidgetState> states) {
                  //     return secondaryColor; // Default row color (light grey)
                  //   },
                  // ),
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(label: Text('License no')),
                    DataColumn(
                      label: Text(
                        'Actions',
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text(
                          'John',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        const DataCell(
                          Text('john@123.com'),
                        ),
                        const DataCell(Text('1234567890')),
                        const DataCell(Text('61373-KL')),
                        DataCell(TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ArchitectViewDetailScreen(),
                                  ));
                            },
                            child: const Text('View Details'))),
                      ],
                    ),
                    DataRow(
                      cells: [
                        const DataCell(Text(
                          'Jane',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        const DataCell(
                          Text('jane@123.com'),
                        ),
                        const DataCell(Text('9876543210')),
                        const DataCell(Text('61373-KO')),
                        DataCell(TextButton(
                            onPressed: () {},
                            child: const Text('View Details'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
