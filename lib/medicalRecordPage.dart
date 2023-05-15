import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MedicalRecordPage extends StatefulWidget {
  @override
  _MedicalRecordPageState createState() => _MedicalRecordPageState();
}

class _MedicalRecordPageState extends State<MedicalRecordPage> {
  List<File> _selectedFiles = [];

  Future<void> _selectFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _selectedFiles = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Medical Records'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectFiles,
              child: Text('Select Files'),
            ),
            SizedBox(height: 16.0),
            _selectedFiles.isNotEmpty
                ? Column(
              children: _selectedFiles.map((file) {
                return Text(file.path);
              }).toList(),
            )
                : Text('No files selected.'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement your logic to upload the files here
                if (_selectedFiles.isNotEmpty) {
                  // Perform the upload process for each file
                  // You can use a package like Dio or http for file upload
                  // Example:
                  // uploadFiles(_selectedFiles);
                }
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}