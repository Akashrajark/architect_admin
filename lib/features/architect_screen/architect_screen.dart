import 'package:data_table_2/data_table_2.dart';
import 'package:dream_home_admin/common_widget/custom_search.dart';
import 'package:dream_home_admin/theme/app_theme.dart';
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
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Architect',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
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
              borderRadius: BorderRadius.circular(20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(20), // Curved border
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
                child: DataTable2(
                  headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      return secondaryColor; // Default row color (light grey)
                    },
                  ),
                  dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      return secondaryColor; // Default row color (light grey)
                    },
                  ),
                  columns: const [
                    DataColumn2(label: Text('Name')),
                    DataColumn2(label: Text('Phone')),
                    DataColumn2(label: Text('Plans')),
                    DataColumn2(
                      label: Text('Status'),
                    ),
                    DataColumn2(
                        label: Text(
                          'Actions',
                        ),
                        numeric: true),
                  ],
                  rows: const [
                    DataRow2(
                      cells: [
                        DataCell(Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'John',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                    DataRow2(
                      cells: [
                        DataCell(Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jane',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
            ),
          ),
        ],
      ),
    );
  }
}
