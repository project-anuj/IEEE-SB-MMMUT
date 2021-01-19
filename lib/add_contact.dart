import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  CollectionReference imgRef;
  firebase_storage.Reference ref;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _desigController = TextEditingController();
  TextEditingController _fbLinkController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File pickedimage;
  bool uploading = false;
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text('Add New Contact'),
          actions: [
            OutlinedButton(
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
                style: TextStyle(
                  color: Colors.white,
                ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Please enter name";
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Enter Name',
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
                                return "Please enter designation";
                              }
                              return null;
                            },
                            controller: _desigController,
                            decoration: InputDecoration(
                              labelText: 'Enter designation',
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
                                return "Please enter Facebook link";
                              }
                              return null;
                            },
                            controller: _fbLinkController,
                            decoration: InputDecoration(
                              labelText: 'Facebook link',
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
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
    final tempImage = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      pickedimage = File(tempImage?.path);
    });
    if (tempImage == null) retrieveLostData();
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
          .child('contactImages/${Path.basename(pickedimage.path)}');
      await ref.putFile(pickedimage).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.add({
            'url': value,
            'title': _nameController.text,
            'description': _desigController.text,
            'fblink': _fbLinkController.text,
          });
        });
      });
      setState(() {
        _nameController.clear();
        _desigController.clear();
        _fbLinkController.clear();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('contactImageURLs');
  }
}
