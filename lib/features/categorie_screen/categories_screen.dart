import 'package:data_table_2/data_table_2.dart';
import 'package:dream_home_admin/common_widget/custom_alert_dialog.dart';
import 'package:dream_home_admin/common_widget/custom_button.dart';
import 'package:dream_home_admin/common_widget/custom_image_picker_button.dart';
import 'package:dream_home_admin/common_widget/custom_search.dart';
import 'package:dream_home_admin/common_widget/custom_text_formfield.dart';
import 'package:dream_home_admin/util/format_function.dart';
import 'package:dream_home_admin/util/value_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

import '../../util/check_login.dart';
import 'categories_bloc/categories_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesBloc _categoriesBloc = CategoriesBloc();

  Map<String, dynamic> params = {
    'query': null,
  };

  List<Map> _categories = [];

  @override
  void initState() {
    checkLogin(context);
    getCategories();
    super.initState();
  }

  void getCategories() {
    _categoriesBloc.add(GetAllCategoriesEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _categoriesBloc,
      child: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getCategories();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is CategoriesGetSuccessState) {
            _categories = state.categories;
            Logger().w(_categories);
            setState(() {});
          } else if (state is CategoriesSuccessState) {
            getCategories();
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
                          child: Text(
                            'Categery Screen',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: CustomSearch(
                            onSearch: (query) {
                              params['query'] = query;
                              getCategories();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomButton(
                          iconData: Icons.add_circle_outline,
                          label: 'Add Categery',
                          inverse: true,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: _categoriesBloc,
                                child: AddEditCategory(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (state is CategoriesLoadingState) LinearProgressIndicator(),
                if (state is CategoriesGetSuccessState && _categories.isEmpty)
                  Center(
                    child: Text("No Category found!"),
                  ),
                if (state is CategoriesGetSuccessState &&
                    _categories.isNotEmpty)
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
                          dataRowHeight: 60,
                          columns: const [
                            DataColumn2(
                              label: Text('Image'),
                              size: ColumnSize.S,
                              fixedWidth: 100,
                            ),
                            DataColumn2(
                              label: Text('Name'),
                              size: ColumnSize.M,
                            ),
                            DataColumn2(
                              label: Text('Description'),
                              size: ColumnSize.L,
                            ),
                            DataColumn2(
                              label: Text('Created At'),
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              headingRowAlignment: MainAxisAlignment.end,
                              label: Text('Actions'),
                              size: ColumnSize.M,
                            ),
                          ],
                          rows: List.generate(
                            _categories.length,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        _categories[index]['image_url'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    _categories[index]['name'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    _categories[index]['description'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    formatDate(
                                        _categories[index]['created_at']),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                BlocProvider.value(
                                              value: _categoriesBloc,
                                              child: AddEditCategory(
                                                categorieDetails:
                                                    _categories[index],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                CustomAlertDialog(
                                              title: 'Delete Categorie?',
                                              description:
                                                  'Deletion will fail if there are records under this categorie',
                                              primaryButton: 'Delete',
                                              onPrimaryPressed: () {
                                                _categoriesBloc.add(
                                                  DeleteCategorieEvent(
                                                    categorieId:
                                                        _categories[index]
                                                            ['id'],
                                                  ),
                                                );
                                                Navigator.pop(context);
                                              },
                                              secondaryButton: 'Cancel',
                                            ),
                                          );
                                        },
                                      )
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

class AddEditCategory extends StatefulWidget {
  final Map? categorieDetails;

  const AddEditCategory({
    super.key,
    this.categorieDetails,
  });

  @override
  State<AddEditCategory> createState() => _AddEditCategoryState();
}

class _AddEditCategoryState extends State<AddEditCategory> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PlatformFile? coverImage;

  Map<String, dynamic> universitieParams = {
    'query': null,
  };

  @override
  void initState() {
    if (widget.categorieDetails != null) {
      _nameController.text = widget.categorieDetails!['name'];
      _descriptionController.text = widget.categorieDetails!['description'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomAlertDialog(
          title: 'Add New Catogery',
          isLoading: state is CategoriesLoadingState,
          content: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    'Cover Image',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFF2D2D2D),
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomImagePickerButton(
                    selectedImage: widget.categorieDetails?["image_url"],
                    borderRadius: 8,
                    height: 100,
                    width: 360,
                    onPick: (value) {
                      coverImage = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFF2D2D2D),
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    isLoading: state is CategoriesLoadingState,
                    labelText: 'Enter Name',
                    controller: _nameController,
                    validator: alphabeticWithSpaceValidator,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFF2D2D2D),
                        ),
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    maxLines: 3,
                    minLines: 3,
                    isLoading: state is CategoriesLoadingState,
                    labelText: 'Enter Description',
                    controller: _descriptionController,
                    validator: alphabeticWithSpaceValidator,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          primaryButton: 'Save',
          onPrimaryPressed: () {
            if (_formKey.currentState!.validate() &&
                ((coverImage != null) || widget.categorieDetails != null)) {
              Map<String, dynamic> details = {
                'name': _nameController.text.trim(),
                'description': _descriptionController.text.trim(),
              };

              if (coverImage != null) {
                details['image'] = coverImage!.bytes;
                details['image_name'] = coverImage!.name;
              }

              if (widget.categorieDetails != null) {
                BlocProvider.of<CategoriesBloc>(context).add(
                  EditCategorieEvent(
                    categorieId: widget.categorieDetails!['id'],
                    categorieDetails: details,
                  ),
                );
              } else {
                BlocProvider.of<CategoriesBloc>(context).add(
                  AddCategorieEvent(
                    categorieDetails: details,
                  ),
                );
              }
            }
          },
        );
      },
    );
  }
}
