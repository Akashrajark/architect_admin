import 'package:dream_home_admin/common_widget/custom_alert_dialog.dart';
import 'package:dream_home_admin/common_widget/custom_button.dart';
import 'package:dream_home_admin/common_widget/custom_image_picker_button.dart';
import 'package:dream_home_admin/common_widget/custom_text_formfield.dart';
import 'package:dream_home_admin/util/value_validator.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryDesController = TextEditingController();

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
                    child: Text(
                      'Categery Screen',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  CustomButton(
                    iconData: Icons.add_circle_outline,
                    label: 'Add Categery',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialog(
                          title: 'Add New Catogery',
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Categery name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormField(
                                  labelText: 'name',
                                  controller: categoryNameController,
                                  validator: notEmptyValidator),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormField(
                                  labelText: 'description',
                                  controller: categoryDesController,
                                  validator: notEmptyValidator),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Add image',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomImagePickerButton(
                                height: 150,
                                width: 150,
                                onPick: (file) {},
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomButton(
                                onPressed: () {},
                                label: 'Add',
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
                child: DataTable(
                  dataRowHeight: 150,
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Image')),
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
                      DataCell(
                          onTap: () {},
                          Image.network(
                            'https://www.rightmove.co.uk/news/wp-content/uploads/2018/01/Doncaster-exterior.jpg',
                            fit: BoxFit.cover,
                          )),
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
                        DataCell(
                            onTap: () {},
                            Image.network(
                              'http://cdn.home-designing.com/wp-content/uploads/2017/05/modern-islamic-villa-home-exterior.jpg',
                              fit: BoxFit.cover,
                            )),
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
          ),
        ],
      ),
    );
  }
}
