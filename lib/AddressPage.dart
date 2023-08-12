import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<String> _addresses = [];
  firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  var collection = FirebaseFirestore.instance.collection('users');
  TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _addAddress() {
    setState(() {
      _addresses.add(_addressController.text);
      _addressController.clear();
    });
  }

  void _editAddress(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _editController = TextEditingController(text: _addresses[index]);
        return AlertDialog(
          title: Text('Edit Address'),
          content: TextField(
            controller: _editController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _addresses[index] = _editController.text;
                  firebase_auth.User? user = auth.currentUser;
                  //user!.update(_editController.text);
                  Navigator.pop(context);
                });
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAddress(int index) {
    setState(() {
      _addresses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addresses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _addAddress,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_addresses[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editAddress(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteAddress(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


