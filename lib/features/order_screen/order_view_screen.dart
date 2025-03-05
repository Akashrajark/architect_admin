import 'package:flutter/material.dart';

class OrderViewScreen extends StatefulWidget {
  final Map order;

  OrderViewScreen({super.key, required this.order});

  @override
  State<OrderViewScreen> createState() => _OrderViewScreenState();
}

class _OrderViewScreenState extends State<OrderViewScreen> {
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final order = widget.order;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: false,
        title: Text("Order details", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Large Image Section
            Container(
              height: 400, // Much bigger image height
              width: double.infinity,
              child: Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentImageIndex = index;
                      });
                    },
                    itemCount: order["homePlanImages"].length,
                    itemBuilder: (context, pageIndex) {
                      return Image.network(
                        order["homePlanImages"][pageIndex],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  // Image indicators
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        order["homePlanImages"].length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentImageIndex == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Details Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order["userName"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(order["architectImage"]),
                                radius: 18,
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order["architectName"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    'Architect',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Order ID: ${order["orderId"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black54),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Date: ${order["date"]}",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Category: ${order["category"]}",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Plan Name: ${order["planName"]}",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            "Total Price: ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            "\$${order["totalPrice"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          SizedBox(width: 16),
                          Text(
                            "Profit: ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            "\$${order["profit"]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Details: ${order["details"]}",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.bed, size: 16, color: Colors.black54),
                          Text(
                            " ${order["features"]["bedrooms"]}  ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(Icons.bathtub, size: 16, color: Colors.black54),
                          Text(
                            " ${order["features"]["bathrooms"]}  ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(
                            order["features"]["parking"]
                                ? Icons.directions_car
                                : Icons.block,
                            size: 16,
                            color: Colors.black54,
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
      ),
    );
  }
}
