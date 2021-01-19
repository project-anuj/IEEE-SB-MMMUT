import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testing/add_contact.dart';
import 'package:testing/add_events.dart';
import 'package:testing/add_workshop.dart';
import 'package:testing/services/Admin%20Auth.dart';
import 'package:url_launcher/url_launcher.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  String imageUrl;
  TextEditingController _keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            elevation: 0.0,
            title: Text(
              'Live Events',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.indigoAccent),
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  scrollable: true,
                                  title: Text("Enter Key(Only for admin)"),
                                  content: TextField(
                                    controller: _keyController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter key',
                                      enabledBorder: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(),
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          _keyController.text = '';
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Cancel")),
                                    FlatButton(
                                        onPressed: () {
                                          if (_keyController.text ==
                                              'techSRIJAN') {
                                            _keyController.text = '';
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return AdminAuth();
                                            }));
                                          } else {
                                            _keyController.text = '';
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text("Enter"))
                                  ],
                                ));
                      },
                      child: Icon(Icons.account_tree_sharp)),
                  SizedBox(
                    width: 15,
                  )
                ],
              )
            ]),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('post').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: const Text('loading'));
              } else if (snapshot.hasData &&
                  (snapshot.data.size == 0 || snapshot.data.size == null)) {
                return Center(
                  child: Text("No event live now."),
                );
              } else {
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(document['subtitle'])) {
                              await launch(document['subtitle']);
                            } else {
                              throw 'Could not launch ${document['subtitle']}';
                            }
                          },
                          child: Card(
                            shadowColor: Color(0x802196F3),
                            elevation: 14.0,
                            child: Column(
                              children: [
                                (document['image'] == null ||
                                        document['image'] == '')
                                    ? Container()
                                    : Image.network(
                                        document['image'],
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 250,
                                        fit: BoxFit.fill,
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Text(
                                    document['title'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  trailing: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: document['islive'] == 'LIVE'
                                        ? Text(
                                            "LIVE",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          )
                                        : Text(
                                            "UPCOMING",
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        document['registerLink'] == null ||
                                document['registerLink'] == ""
                            ? Container()
                            : MaterialButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: .02),
                                onPressed: () async {
                                  if (await canLaunch(
                                      document['registerLink'])) {
                                    await launch(document['registerLink']);
                                  } else {
                                    throw 'Could not launch ${document['register']}';
                                  }
                                },
                                highlightColor: Colors.indigoAccent,
                                child: Card(
                                  shadowColor: Color(0x802196F3),
                                  elevation: 14.0,
                                  child: Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width - 16,
                                    child: Center(
                                        child: Text(
                                      'Register for ${document['title']}',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                      ],
                    );
                  }).toList(),
                );
              }
            }));
  }
}
