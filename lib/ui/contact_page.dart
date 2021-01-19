import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'contact_profile.dart';

class ContactPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const ContactPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
//      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Container(
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: onMenuTap,
                  child: Icon(
                    Icons.menu,
                    color: Colors.blueAccent,
                  )),
              title: Text(
                'Contact Us',
                style: TextStyle(color: Colors.blueAccent),
              ),
              elevation: 0.0,
              backgroundColor: Colors.blueAccent.withOpacity(0.0),
            ),
            body: ContactList(),
          ),
        ),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('contactImageURLs')
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return Hero(
                        // tag: names[index],
                        tag: snapshot.data.documents[index].get('title'),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Card(
                                borderOnForeground: true,
                                color: Colors.pinkAccent.shade100,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    // backgroundImage: AssetImage(link[index]),
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                      snapshot.data.documents[index].get('url'),
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data.documents[index].get('title'),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    snapshot.data.documents[index]
                                        .get('description'),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile(
                                                text: snapshot
                                                    .data.documents[index]
                                                    .get('description'),
                                                facebook: snapshot
                                                    .data.documents[index]
                                                    .get('fblink'),
                                                imageLink: snapshot
                                                    .data.documents[index]
                                                    .get('url'),
                                                name: snapshot
                                                    .data.documents[index]
                                                    .get('title'),
                                                index: index)));
                                  },
                                ),
                                elevation: 50.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
          },
        ));
  }
}
