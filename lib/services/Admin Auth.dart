import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testing/add_contact.dart';
import 'package:testing/add_events.dart';
import 'package:testing/add_workshop.dart';
import 'package:testing/content_load.dart';
import 'package:testing/delete_contact.dart';
import 'package:testing/live_page_delete.dart';

class AdminAuth extends StatefulWidget {
  @override
  _AdminAuthState createState() => _AdminAuthState();
}

class _AdminAuthState extends State<AdminAuth> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Auth"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      showLoaderDialog(context);
                      _signInAccount();
                      setState(() {
                        _emailController.clear();
                        _passController.clear();
                      });
                    }
                  },
                  child: Text("SignIn", style: TextStyle(color: Colors.white)),
                  color: Colors.indigo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _signInAccount() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Choose'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => ContentLoad()));
                      },
                      child: Text("Add Post"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => LivePageDelete()));
                      },
                      child: Text("Delete Post"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => AddEvents()));
                      },
                      child: Text("Add new Events"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => AddWorkshop()));
                      },
                      child: Text("Add new Workshop"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => AddContact()));
                      },
                      child: Text("Add new Contact"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => DeleteContact()));
                      },
                      child: Text("Delete Contact"),
                    )
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'))
                ],
              ));
    } catch (e) {
      print(e);
    }
  }
}
