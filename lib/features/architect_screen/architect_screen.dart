import 'package:data_table_2/data_table_2.dart';
import 'package:dream_home_admin/common_widget/custom_search.dart';
import 'package:dream_home_admin/features/architect_screen/architect_view_detail_screen.dart';
import 'package:dream_home_admin/theme/app_theme.dart';
import 'package:dream_home_admin/util/format_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

import '../../common_widget/custom_alert_dialog.dart';
import '../../util/check_login.dart';
import 'architects_bloc/architects_bloc.dart';

class ArchitectScreen extends StatefulWidget {
  final bool isPending;
  const ArchitectScreen({super.key, this.isPending = false});

  @override
  State<ArchitectScreen> createState() => _ArchitectScreenState();
}

class _ArchitectScreenState extends State<ArchitectScreen> {
  final ArchitectsBloc _architectsBloc = ArchitectsBloc();

  Map<String, dynamic> params = {
    'query': null,
  };

  List<Map> _architects = [];

  @override
  void initState() {
    checkLogin(context);
    if (widget.isPending) {
      params['status'] = 'Pending';
    } else {
      params['status'] = 'Approved';
    }
    getArchitects();
    super.initState();
  }

  void getArchitects() {
    _architectsBloc.add(GetAllArchitectsEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _architectsBloc,
      child: BlocConsumer<ArchitectsBloc, ArchitectsState>(
        listener: (context, state) {
          if (state is ArchitectsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getArchitects();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is ArchitectsGetSuccessState) {
            _architects = state.architects;
            Logger().w(_architects);
            setState(() {});
          } else if (state is ArchitectsSuccessState) {
            getArchitects();
          }
        },
        builder: (context, state) {
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

                        SizedBox(
                          width: 300,
                          child: CustomSearch(
                            onSearch: (query) {
                              params['query'] = query;
                              getArchitects();
                            },
                          ),
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
                if (state is ArchitectsLoadingState) LinearProgressIndicator(),
                if (state is ArchitectsGetSuccessState && _architects.isEmpty)
                  Center(
                    child: Text("No Architect found!"),
                  ),
                if (state is ArchitectsGetSuccessState &&
                    _architects.isNotEmpty)
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius:
                              BorderRadius.circular(10), // Curved border
                          border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1), // Border color
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: DataTable2(
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
                          columns: [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Phone')),
                            DataColumn(label: Text('License no')),
                            DataColumn2(
                              label: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Actions')),
                              fixedWidth: 370,
                            ),
                            // if (widget.isPending)
                            //   DataColumn(label: Text('Decision')),
                          ],
                          rows: List.generate(
                            _architects.length,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    formatValue(_architects[index]['name']),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    formatValue(_architects[index]['email']),
                                  ),
                                ),
                                DataCell(Text(
                                    '+91 ${formatValue(_architects[index]['phone'])}')),
                                DataCell(Text(
                                  formatValue(_architects[index]['license_no']),
                                )),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (widget.isPending)
                                        SizedBox(
                                          width: 8,
                                        ),
                                      if (widget.isPending)
                                        SmallCustomButton(
                                          backgroundColor: Colors.green,
                                          icon: Icons.done_all,
                                          label: 'Approve',
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  BlocProvider.value(
                                                value: _architectsBloc,
                                                child: CustomAlertDialog(
                                                  title: 'Approve Architect?',
                                                  description:
                                                      'Are you sure you want to  this architect?',
                                                  primaryButton: 'Approve',
                                                  onPrimaryPressed: () {
                                                    _architectsBloc.add(
                                                      EditArchitectsEvent(
                                                          architectId:
                                                              _architects[index]
                                                                  ['id'],
                                                          architectDetails: {
                                                            'status': "Approved"
                                                          }),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  secondaryButton: 'Cancel',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      if (widget.isPending)
                                        SizedBox(
                                          width: 8,
                                        ),
                                      if (widget.isPending)
                                        SmallCustomButton(
                                          backgroundColor: Colors.red,
                                          icon: Icons.close,
                                          label: 'Reject',
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  BlocProvider.value(
                                                value: _architectsBloc,
                                                child: CustomAlertDialog(
                                                  title: 'Reject Architect?',
                                                  description:
                                                      'Are you sure you want to reject this architect?',
                                                  primaryButton: 'Reject',
                                                  onPrimaryPressed: () {
                                                    _architectsBloc.add(
                                                      EditArchitectsEvent(
                                                          architectId:
                                                              _architects[index]
                                                                  ['id'],
                                                          architectDetails: {
                                                            'status': "Rejected"
                                                          }),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  secondaryButton: 'Cancel',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SmallCustomButton(
                                        icon: Icons.view_headline_rounded,
                                        backgroundColor: Colors.blue,
                                        label: 'View Details',
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CustomAlertDialog(
                                              title: 'Architect Details',
                                              content: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Name: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(formatValue(
                                                          _architects[index]
                                                              ['name'])),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Text('Email: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(formatValue(
                                                          _architects[index]
                                                              ['email'])),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Text('Status: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(formatValue(
                                                          _architects[index]
                                                              ['status'])),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Text('Phone: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(
                                                          '+91 ${formatValue(_architects[index]['phone'])}'),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    children: [
                                                      Text('License No: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(formatValue(
                                                          _architects[index]
                                                              ['license_no'])),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Column(
                                                    children: [
                                                      Text('License URL: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Image.network(
                                                        formatValue(_architects[
                                                                index]
                                                            ['license_url']),
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Column(
                                                    children: [
                                                      Text('Photo: ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Image.network(
                                                        formatValue(
                                                            _architects[index]
                                                                ['photo']),
                                                        height: 100,
                                                        width: 60,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              primaryButton: 'Close',
                                              onPrimaryPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SmallCustomButton extends StatelessWidget {
  final Color color, backgroundColor;
  final IconData icon;
  final String label;
  final Function() onTap;
  const SmallCustomButton({
    super.key,
    this.color = Colors.white,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 2,
            color: secondaryColor.withAlpha(140),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                icon,
                color: color,
                size: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
