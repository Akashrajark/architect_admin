import 'package:dream_home_admin/common_widget/custom_alert_dialog.dart';
import 'package:dream_home_admin/features/architect_screen/architect_screen.dart';
import 'package:dream_home_admin/features/categorie_screen/categories_screen.dart';
import 'package:dream_home_admin/features/dashboard/dashboard_screen.dart';
import 'package:dream_home_admin/features/home/custom_drawer_item.dart';
import 'package:dream_home_admin/features/home_plan_screen/homeplans_screen.dart';
import 'package:dream_home_admin/features/login_screen/login_screen.dart';
import 'package:dream_home_admin/features/order_screen/order_screen.dart';
import 'package:dream_home_admin/features/pending_request/pending_request.dart';
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
      backgroundColor: const Color(0xff5b5859),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: 230,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Dream Home',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomDrawerItem(
                        title: 'Dashboard',
                        icon: Icons.dashboard,
                        ontap: () {
                          tabController.animateTo(0);
                        },
                        isSelected: tabController.index == 0,
                        color: tabController.index == 0
                            ? Colors.black
                            : Colors.white,
                        iconColor: tabController.index == 0
                            ? Colors.white
                            : Colors.black,
                        textColor: tabController.index == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDrawerItem(
                        iconColor: tabController.index == 1
                            ? Colors.white
                            : Colors.black,
                        textColor: tabController.index == 1
                            ? Colors.white
                            : Colors.black,
                        color: tabController.index == 1
                            ? Colors.black
                            : Colors.white,
                        isSelected: tabController.index == 1,
                        title: 'Architect',
                        icon: Icons.architecture,
                        ontap: () {
                          tabController.animateTo(1);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDrawerItem(
                        iconColor: tabController.index == 2
                            ? Colors.white
                            : Colors.black,
                        textColor: tabController.index == 2
                            ? Colors.white
                            : Colors.black,
                        color: tabController.index == 2
                            ? Colors.black
                            : Colors.white,
                        isSelected: tabController.index == 2,
                        title: 'Pending Request',
                        icon: Icons.lock_clock_outlined,
                        ontap: () {
                          tabController.animateTo(2);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDrawerItem(
                        iconColor: tabController.index == 3
                            ? Colors.white
                            : Colors.black,
                        textColor: tabController.index == 3
                            ? Colors.white
                            : Colors.black,
                        color: tabController.index == 3
                            ? Colors.black
                            : Colors.white,
                        isSelected: tabController.index == 3,
                        title: 'Category Screen',
                        icon: Icons.category,
                        ontap: () {
                          tabController.animateTo(3);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDrawerItem(
                        iconColor: tabController.index == 4
                            ? Colors.white
                            : Colors.black,
                        textColor: tabController.index == 4
                            ? Colors.white
                            : Colors.black,
                        color: tabController.index == 4
                            ? Colors.black
                            : Colors.white,
                        isSelected: tabController.index == 4,
                        title: 'Homeplane',
                        icon: Icons.foundation,
                        ontap: () {
                          tabController.animateTo(4);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDrawerItem(
                        iconColor: tabController.index == 5
                            ? Colors.white
                            : Colors.black,
                        textColor: tabController.index == 5
                            ? Colors.white
                            : Colors.black,
                        color: tabController.index == 5
                            ? Colors.black
                            : Colors.white,
                        isSelected: tabController.index == 5,
                        title: 'Order Screen',
                        icon: Icons.border_all,
                        ontap: () {
                          tabController.animateTo(5);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomDrawerItem(
                        iconColor: Colors.redAccent,
                        textColor: Colors.red,
                        color: Colors.white,
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
                )),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                Dashboard(),
                ArchitectScreen(),
                PendingRequest(),
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
