import 'package:dream_home_admin/features/home_plan_screen/home_plan_card.dart';
import 'package:dream_home_admin/features/home_plan_screen/home_plan_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeplansScreen extends StatelessWidget {
  const HomeplansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HomePlans',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Adjust based on your design
                    crossAxisSpacing: 10,

                    childAspectRatio: 0.9, // Adjust based on height/width ratio
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => SizedBox(
                    width: 50, // Fixed width
                    child: HomePlanCard(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePlanDetailScreen(
                                imageUrls: [
                                  'https://g.foolcdn.com/editorial/images/574911/new-home.jpg',
                                  'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
                                  'https://g.foolcdn.com/editorial/images/574911/new-home.jpg',
                                  'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg'
                                ],
                                title: 'Sunset Detail View',
                                category: 'Modern Villa',
                                price: 9000,
                                architectName: 'Prakash',
                                architectImage:
                                    'https://cdn.pixabay.com/photo/2023/05/27/08/04/ai-generated-8021008_1280.jpg',
                              ),
                            ));
                      },
                      showListTile: true,
                      numOwners: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
