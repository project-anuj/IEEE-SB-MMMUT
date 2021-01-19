import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class AddWorkshop extends StatefulWidget {
  @override
  _AddWorkshopState createState() => _AddWorkshopState();
}

class _AddWorkshopState extends State<AddWorkshop> {
  CollectionReference imgRef;
  firebase_storage.Reference ref;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _descController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File pickedimage;
  bool uploading = false;
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text('Add New Workshop'),
          actions: [
            OutlineButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    uploading = true;
                  });
                  uploadFile().whenComplete(() => Navigator.of(context).pop());
                }
              },
              child: Text(
                'Upload',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      !uploading ? pickImage() : null;
                    },
                    child: Container(
                      width: 250,
                      height: 250,
                      color: Colors.white,
                      child: Center(
                          child: pickedimage == null
                              ? Icon(Icons.add_a_photo)
                              : Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: FileImage(pickedimage),
                                  )),
                                )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (String val) {
                                if (val.isEmpty) {
                                  return "Please enter title";
                                }
                                return null;
                              },
                              controller: _titleController,
                              decoration: InputDecoration(
                                labelText: 'Enter title for Workshop',
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (String val) {
                                if (val.isEmpty) {
                                  return "Please enter title";
                                }
                                return null;
                              },
                              controller: _descController,
                              decoration: InputDecoration(
                                labelText: 'Enter description for Workshop',
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            uploading == true
                ? Center(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Text(
                              'uploading...',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          CircularProgressIndicator(
                            value: val,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ));
  }

  pickImage() async {
    final tempimage = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      pickedimage = File(tempimage?.path);
    });
    if (tempimage == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) return;
    if (response.file != null) {
      setState(() {
        pickedimage = File(response.file.path);
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    setState(() {
      val = 1.0;
    });
    if (_formKey.currentState.validate()) {
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('workshopImages/${Path.basename(pickedimage.path)}');
      await ref.putFile(pickedimage).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({
            'url': value,
            'title': _titleController.text,
            'description': _descController.text,
          });
        });
      });
      setState(() {
        _titleController.clear();
        _descController.clear();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('workshopImageURLs');
  }
}
