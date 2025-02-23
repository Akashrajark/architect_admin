import 'package:dream_home_admin/features/home_plan_screen/home_plan_card.dart';
import 'package:dream_home_admin/features/home_plan_screen/home_plan_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/web.dart';

import '../../common_widget/custom_alert_dialog.dart';
import '../../common_widget/custom_search.dart';
import '../../util/check_login.dart';
import 'homeplans_bloc/homeplans_bloc.dart';

class HomeplansScreen extends StatefulWidget {
  const HomeplansScreen({super.key});

  @override
  State<HomeplansScreen> createState() => _HomeplansScreenState();
}

class _HomeplansScreenState extends State<HomeplansScreen> {
  final HomeplansBloc _homeplansBloc = HomeplansBloc();

  Map<String, dynamic> params = {
    'query': null,
  };

  List<Map> _homeplans = [];

  @override
  void initState() {
    checkLogin(context);

    getHomeplans();
    super.initState();
  }

  void getHomeplans() {
    _homeplansBloc.add(GetAllHomeplansEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeplansBloc,
      child: BlocConsumer<HomeplansBloc, HomeplansState>(
        listener: (context, state) {
          if (state is HomeplansFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getHomeplans();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is HomeplansGetSuccessState) {
            _homeplans = state.homeplans;
            Logger().w(_homeplans);
            setState(() {});
          } else if (state is HomeplansSuccessState) {
            getHomeplans();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
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
                          child: Text('Homeplan',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 300,
                          child: CustomSearch(
                            onSearch: (search) {
                              params['query'] = search;
                              getHomeplans();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (state is HomeplansLoadingState) LinearProgressIndicator(),
                if (state is HomeplansGetSuccessState && _homeplans.isEmpty)
                  Center(
                    child: Text("No Homeplan found!"),
                  ),
                if (state is HomeplansGetSuccessState && _homeplans.isNotEmpty)
                  Expanded(
                      child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: List.generate(
                        _homeplans.length,
                        (index) => HomePlanCard(
                          cardData: _homeplans[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePlanDetailScreen(
                                    imageUrl:
                                        'https://g.foolcdn.com/editorial/images/574911/new-home.jpg',
                                    title: 'Sunset Detail View',
                                    category: 'Modern Villa',
                                    price: 9000,
                                    architectName: 'Prakash',
                                    architectImage:
                                        'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                  )),
              ],
            ),
          );
        },
      ),
    );
  }
}
