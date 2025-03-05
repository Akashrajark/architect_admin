// import 'package:data_table_2/data_table_2.dart';
// import 'package:dream_home_admin/common_widget/custom_alert_dialog.dart';
// import 'package:dream_home_admin/common_widget/custom_search.dart';
// import 'package:dream_home_admin/features/order_screen/order_bloc/order_bloc.dart';
// import 'package:dream_home_admin/features/order_screen/order_view_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:logger/web.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   final OrderBloc _orderBloc = OrderBloc();

//   Map<String, dynamic> params = {
//     'query': null,
//   };

//   List<Map> _orders = [];

//   @override
//   void initState() {
//     super.initState();
//     getOrders();
//   }

//   void getOrders() {
//     _orderBloc.add(GetAllOrdersEvent(params: params));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: _orderBloc,
//       child: BlocConsumer<OrderBloc, OrderState>(
//         listener: (context, state) {
//           if (state is OrderFailureState) {
//             showDialog(
//               context: context,
//               builder: (context) => CustomAlertDialog(
//                 title: 'Failure',
//                 description: state.message,
//                 primaryButton: 'Try Again',
//                 onPrimaryPressed: () {
//                   getOrders();
//                   Navigator.pop(context);
//                 },
//               ),
//             );
//           } else if (state is OrderGetSuccessState) {
//             _orders = state.orders;
//             Logger().w(_orders);
//             setState(() {});
//           }
//         },
//         builder: (context, state) {
//           return Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Material(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         const Expanded(
//                           child: Text(
//                             'Order Screen',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 300,
//                           child: CustomSearch(
//                             onSearch: (query) {
//                               params['query'] = query;
//                               getOrders();
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 if (state is OrderLoadingState) LinearProgressIndicator(),
//                 if (state is OrderGetSuccessState && _orders.isEmpty)
//                   Center(
//                     child: Text("No Orders found!"),
//                   ),
//                 if (state is OrderGetSuccessState && _orders.isNotEmpty)
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white, // Background color
//                           borderRadius:
//                               BorderRadius.circular(10), // Curved border
//                           border: Border.all(
//                               color: Colors.grey.shade300,
//                               width: 1), // Border color
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 8,
//                               spreadRadius: 2,
//                             ),
//                           ],
//                         ),
//                         child: DataTable2(
//                           dataRowHeight: 60,
//                           columns: const [
//                             DataColumn2(
//                               label: Text('ORDER-ID'),
//                               size: ColumnSize.S,
//                             ),
//                             DataColumn2(
//                               label: Text('DATE'),
//                               size: ColumnSize.S,
//                             ),
//                             DataColumn2(
//                               label: Text('USER NAME'),
//                               size: ColumnSize.M,
//                             ),
//                             DataColumn2(
//                               label: Text('ARCHITECT'),
//                               size: ColumnSize.M,
//                             ),
//                             DataColumn2(
//                               label: Text('CATEGORY'),
//                               size: ColumnSize.M,
//                             ),
//                             DataColumn2(
//                               label: Text('PLAN NAME'),
//                               size: ColumnSize.M,
//                             ),
//                             DataColumn2(
//                               label: Text('TOTAL'),
//                               size: ColumnSize.S,
//                             ),
//                             DataColumn2(
//                               label: Text('PROFIT'),
//                               size: ColumnSize.S,
//                             ),
//                             DataColumn2(
//                               headingRowAlignment: MainAxisAlignment.end,
//                               label: Text('DETAILS'),
//                               size: ColumnSize.M,
//                             ),
//                           ],
//                           rows: List.generate(
//                             _orders.length,
//                             (index) => DataRow(
//                               cells: [
//                                 DataCell(Text(_orders[index]['orderId'])),
//                                 DataCell(Text(_orders[index]['date'])),
//                                 DataCell(Text(_orders[index]['userName'])),
//                                 DataCell(Text(_orders[index]['architectName'])),
//                                 DataCell(Text(_orders[index]['category'])),
//                                 DataCell(Text(_orders[index]['planName'])),
//                                 DataCell(Text(
//                                     _orders[index]['totalPrice'].toString())),
//                                 DataCell(
//                                     Text(_orders[index]['profit'].toString())),
//                                 DataCell(TextButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => OrderViewScreen(
//                                             order: _orders[index]),
//                                       ),
//                                     );
//                                   },
//                                   child: Text('View'),
//                                 )),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
