import 'package:dream_home_admin/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_bloc/dashboard_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc()..add(GetDashboardDataEvent()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is DashboardSuccessState) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      DasboardCard(
                        label: 'Total Architect',
                        iconbgcolor: Colors.blue,
                        value: state.data['total_architects'].toString(),
                        icon: Icons.architecture,
                      ),
                      DasboardCard(
                        label: 'Total Category',
                        iconbgcolor: Colors.green,
                        value: state.data['total_categories'].toString(),
                        icon: Icons.category_outlined,
                      ),
                      DasboardCard(
                        label: 'Total Homeplane',
                        iconbgcolor: Colors.purple,
                        value: state.data['total_homeplans'].toString(),
                        icon: Icons.foundation,
                      ),
                      DasboardCard(
                        label: 'Total Users',
                        iconbgcolor: Colors.orange,
                        value: state.data['total_users'].toString(),
                        icon: Icons.attach_money,
                      ),
                    ],
                  );
                } else if (state is DashboardFailureState) {
                  return Text('Failed to load data');
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DasboardCard extends StatelessWidget {
  final String label;
  final Color iconbgcolor;
  final String value;
  final IconData icon;
  const DasboardCard({
    super.key,
    required this.label,
    required this.iconbgcolor,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: outlineColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            CircleAvatar(
              backgroundColor: iconbgcolor,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
