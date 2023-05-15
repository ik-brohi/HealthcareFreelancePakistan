import 'package:flutter/material.dart';

class HealthcareTipsDoctorPage extends StatefulWidget {
  @override
  _HealthcareTipsDoctorPageState createState() =>
      _HealthcareTipsDoctorPageState();
}

class _HealthcareTipsDoctorPageState extends State<HealthcareTipsDoctorPage> {
  final List<Tip> tips = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Tips'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tips.length,
              itemBuilder: (BuildContext context, int index) {
                return TipCard(tip: tips[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text;
                    String description = descriptionController.text;
                    if (title.isNotEmpty && description.isNotEmpty) {
                      Tip newTip = Tip(title, description);
                      setState(() {
                        tips.add(newTip);
                      });
                      titleController.clear();
                      descriptionController.clear();
                    }
                  },
                  child: Text('Post Tip'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
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

