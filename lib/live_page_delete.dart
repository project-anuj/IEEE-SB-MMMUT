import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class LivePageDelete extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePageDelete> {
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.indigo,
            elevation: 0.0,
            title: Text(
              'Delete Events',
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
            stream: FirebaseFirestore.instance.collection('post').snapshots(),
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
                            .collection('post')
                            .doc(document.id)
                            .delete();
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
                                document['subtitle'],
                                style: TextStyle(fontSize: 18),
                              ),
                              isThreeLine: true,
                              trailing: Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                child: Text(
                                  "LIVE",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
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
