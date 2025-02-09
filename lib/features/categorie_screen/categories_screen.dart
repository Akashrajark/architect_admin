import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Expanded(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Created At')),
              DataColumn(label: Text('Actions')),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(
                  Text(
                    'Modern',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const DataCell(
                  Text(
                    'Contemporary architectural design',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const DataCell(
                  Text(
                    '2024-03-10',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    )
                  ],
                ))
              ]),
              DataRow(
                cells: [
                  const DataCell(
                    Text(
                      'Traditional',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const DataCell(
                    Text(
                      'Classic architectural styles',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const DataCell(
                    Text(
                      '2024-03-16',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
