import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContentLoad extends StatefulWidget {
  @override
  _ContentLoadState createState() => _ContentLoadState();
}

class _ContentLoadState extends State<ContentLoad> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _isLiveController = TextEditingController();
  TextEditingController _registerLinkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _titleController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Title',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _linkController,
                  decoration: InputDecoration(
                    labelText: 'Enter link for content',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    labelText: 'Enter image url (If any)',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _registerLinkController,
                  decoration: InputDecoration(
                    labelText: 'Enter link for registration of Event (If any)',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _isLiveController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Please enter LIVE | UPCOMING";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Type any one : LIVE | UPCOMING',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      showLoaderDialog(context);
                      await FirebaseFirestore.instance.collection('post').add({
                        'title': _titleController.text,
                        'subtitle': _linkController.text,
                        'image': _imageController.text,
                        'registerLink': _registerLinkController.text,
                        'islive': _isLiveController.text,
                      });
                      setState(() {
                        _titleController.clear();
                        _linkController.clear();
                        _imageController.clear();
                        _isLiveController.clear();
                        _registerLinkController.clear();
                      });
                    }
                  },
                  child: Text("Upload"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Text("Upload Successfully"),
      actions: [
        RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Ok"))
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
