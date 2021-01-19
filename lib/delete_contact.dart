import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class DeleteContact extends StatefulWidget {
  @override
  _DeleteContactState createState() => _DeleteContactState();
}

class _DeleteContactState extends State<DeleteContact> {
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.indigo,
            elevation: 0.0,
            title: Text(
              'Delete Contact',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.indigoAccent),
            ),
            actions: [
              Row(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    highlightedBorderColor: Colors.white,
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              )
            ]),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('contactImageURLs')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: const Text('loading'));
              } else {
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return GestureDetector(
                      onLongPress: () async {
                        await FirebaseFirestore.instance
                            .collection('contactImageURLs')
                            .doc(document.id)
                            .delete();
                      },
                      child: Card(
                        shadowColor: Color(0x802196F3),
                        elevation: 14.0,
                        child: Column(
                          children: [
                            (document['url'] == null || document['url'] == '')
                                ? Container()
                                : Image.network(
                                    document['url'],
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Text(
                                document['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              subtitle: Text(
                                document['description'],
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            }));
  }
}
