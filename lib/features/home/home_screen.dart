import 'package:dream_home_admin/common_widget/custom_alert_dialog.dart';
import 'package:dream_home_admin/features/architect_screen/architect_screen.dart';
import 'package:dream_home_admin/features/categorie_screen/categories_screen.dart';
import 'package:dream_home_admin/features/dashboard/dashboard_screen.dart';
import 'package:dream_home_admin/features/home/custom_drawer_item.dart';
import 'package:dream_home_admin/features/home_plan_screen/homeplans_screen.dart';
import 'package:dream_home_admin/features/login_screen/login_screen.dart';
import 'package:dream_home_admin/features/order_screen/order_screen.dart';
import 'package:dream_home_admin/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: secondaryColor,
                  border: Border.all(width: 3, color: outlineColor)),
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dream Home',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomDrawerItem(
                      title: 'Dashboard',
                      icon: Icons.dashboard_rounded,
                      ontap: () {
                        tabController.animateTo(0);
                      },
                      isSelected: tabController.index == 0,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDrawerItem(
                      isSelected: tabController.index == 1,
                      title: 'Architect',
                      icon: Icons.architecture,
                      ontap: () {
                        tabController.animateTo(1);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDrawerItem(
                      isSelected: tabController.index == 2,
                      title: 'Pending Request',
                      icon: Icons.lock_clock_outlined,
                      ontap: () {
                        tabController.animateTo(2);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDrawerItem(
                      isSelected: tabController.index == 3,
                      title: 'Category Screen',
                      icon: Icons.category,
                      ontap: () {
                        tabController.animateTo(3);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDrawerItem(
                      isSelected: tabController.index == 4,
                      title: 'Homeplans',
                      icon: Icons.foundation,
                      ontap: () {
                        tabController.animateTo(4);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDrawerItem(
                      isSelected: tabController.index == 5,
                      title: 'Order Screen',
                      icon: Icons.border_all,
                      ontap: () {
                        tabController.animateTo(5);
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomDrawerItem(
                      isSelected: tabController.index == 6,
                      title: 'LogOut',
                      icon: Icons.logout,
                      ontap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: "LOG OUT",
                            content: const Text(
                              "Are you sure you want to log out? Clicking 'Logout' will end your current session and require you to sign in again to access your account.",
                            ),
                            width: 400,
                            primaryButton: "LOG OUT",
                            onPrimaryPressed: () {
                              Supabase.instance.client.auth.signOut();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                Dashboard(),
                ArchitectScreen(),
                ArchitectScreen(
                  isPending: true,
                ),
                CategoriesScreen(),
                HomeplansScreen(),
                OrderScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
