import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'package:testing/ui/contact_profile.dart';
import 'events_description.dart';

class EventsPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  EventsPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  Widget makeItem(image, title, desc) {
    return AspectRatio(
      aspectRatio: 4 / 4.5,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDescription(
                        image: image,
                        text: title,
                        description: desc,
                      )));
        },
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.fill)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2)
                ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0.0,
          leading: InkWell(
            onTap: widget.onMenuTap,
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Events',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height / 1.5,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('eventsImageURLs')
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return makeItem(
                              snapshot.data.documents[index].get('url'),
                              snapshot.data.documents[index].get('title'),
                              snapshot.data.documents[index]
                                  .get('description'));
                        });
              },
            ),
          ],
        ),
      ),
    );
  }
}
