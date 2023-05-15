import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Reviews',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 24.0),
                Icon(Icons.star, color: Colors.yellow, size: 24.0),
                Icon(Icons.star, color: Colors.yellow, size: 24.0),
                Icon(Icons.star, color: Colors.yellow, size: 24.0),
                Icon(Icons.star, color: Colors.yellow, size: 24.0),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Excellent service! I highly recommend it.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}