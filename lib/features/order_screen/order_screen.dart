import 'package:dream_home_admin/features/order_screen/order_view_screen.dart';
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
        child: DataTable(
          columns: const [
            DataColumn(
                label: Text(
              'ORDER-ID',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'DATE',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'USER NAME',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'ARCHITECT',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'CATEGORY',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'PLAN NAME',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'TOTAL',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'PROFIT',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'DETAILS',
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
          ],
          rows: [
            DataRow(cells: [
              const DataCell(Text('#145322')),
              const DataCell(Text('3/10/2024')),
              const DataCell(Text('ABU')),
              const DataCell(Text('YASH')),
              const DataCell(Text('MODERN')),
              const DataCell(Text('ARC INTEL')),
              const DataCell(Text('90000')),
              const DataCell(Text('2000')),
              DataCell(TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderViewScreen(),
                        ));
                  },
                  child: Text('View'))),
            ]),
            DataRow(cells: [
              const DataCell(Text('#227334')),
              const DataCell(Text('3/9/2024')),
              const DataCell(Text('ABDHUL KALAM')),
              const DataCell(Text('MEESHA MADHAVAN')),
              const DataCell(Text('SIMPLE STYLE')),
              const DataCell(Text('KINGDOM MANIYA')),
              const DataCell(Text('10000')),
              const DataCell(Text('2000')),
              DataCell(TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderViewScreen(),
                        ));
                  },
                  child: Text('View'))),
            ]),
          ],
        ),
      ),
    );
  }
}
