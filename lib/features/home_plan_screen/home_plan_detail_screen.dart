import 'package:flutter/material.dart';
import 'package:dream_home_admin/features/home_plan_screen/feature_card.dart';

class HomePlanDetailScreen extends StatefulWidget {
  final List<String> imageUrls;
  final String title;
  final String category;
  final double price;
  final String architectName;
  final String architectImage;

  const HomePlanDetailScreen({
    super.key,
    required this.imageUrls,
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
  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1) >= 0
          ? _currentIndex - 1
          : widget.imageUrls.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: false,
        // title: Text(
        //   widget.title,
        //   style: TextStyle(fontSize: 20, color: Colors.black),
        // ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Image.network(
                    widget.imageUrls[_currentIndex],
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      left: 10,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                          onTap: () {
                            _previousImage();
                          },
                          child: Material(
                            color: Colors.transparent,
                            child:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                          ))),
                  Positioned(
                      right: 10,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                          onTap: () {
                            _nextImage();
                          },
                          child: Material(
                            color: Colors.transparent,
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          ))),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Category: ${widget.category}",
                      style: TextStyle(fontSize: 18)),
                  Text("Price: \\${widget.price}",
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.architectImage),
                        radius: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(widget.architectName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Features",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Details for Image ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "This is the detail text for the current image. You can customize this text based on the image index.",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
