import 'package:flutter/material.dart';

class HealthcareTipsPage extends StatelessWidget {
  final List<Tip> tips = [
    Tip(
      'Eat a balanced diet',
      'Include fruits, vegetables, whole grains, lean proteins, and healthy fats in your diet.',
    ),
    Tip(
      'Exercise regularly',
      'Engage in at least 30 minutes of moderate-intensity exercise most days of the week.',
    ),
    Tip(
      'Stay hydrated',
      'Drink an adequate amount of water throughout the day to maintain hydration.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Tips'),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (BuildContext context, int index) {
          return TipCard(tip: tips[index]);
        },
      ),
    );
  }
}

class Tip {
  final String title;
  final String description;

  Tip(this.title, this.description);
}

class TipCard extends StatelessWidget {
  final Tip tip;

  TipCard({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tip.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(tip.description),
          ],
        ),
      ),
    );
  }
}