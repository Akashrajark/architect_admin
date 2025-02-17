import 'package:flutter/material.dart';
import 'package:dream_home_admin/features/home_plan_screen/feature_card.dart';

class HomePlanDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double price;
  final String architectName;
  final String architectImage;

  const HomePlanDetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    required this.architectName,
    required this.architectImage,
  });

  @override
  _HomePlanDetailScreenState createState() => _HomePlanDetailScreenState();
}

class _HomePlanDetailScreenState extends State<HomePlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                Expanded(
                  flex: 2,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                // Details Section
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Category: ${widget.category}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Price: \\${widget.price}",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.architectImage),
                            radius: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.architectName,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Features",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureCard(
                            text: "4 Beds",
                            icon: Icons.bed,
                          ),
                          FeatureCard(
                            icon: Icons.bathtub,
                            text: "2 Bath",
                          ),
                          FeatureCard(
                            icon: Icons.directions_car,
                            text: "1 Parking",
                          ),
                        ],
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Ground Floor and Rooms Information
            Text(
              "Ground Floor & Rooms",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• Living Room",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "• Dining Room",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "• Kitchen",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "• 2 Bedrooms",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "• 1 Bathroom",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text(
              "Detailed Image",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Image.network(
                'https://gillaniarchitects.weebly.com/uploads/1/2/7/4/12747279/8845232_orig.jpg',
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
