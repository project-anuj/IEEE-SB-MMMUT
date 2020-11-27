import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  final String text;
  final String name;
  final int index;
  final String imageLink;
  final String facebook;
  Profile(
      {Key key,
      this.text,
      this.facebook,
      this.imageLink,
      this.name,
      this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('Profile'),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.teal[200],
                    backgroundImage: AssetImage(imageLink),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        letterSpacing: 4,
                        fontFamily: 'Pacifico',
//                    fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade100,
                        fontSize: 15,
                        letterSpacing: 4),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20, 8),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        launch(facebook);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.teal,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Colors.teal,
//                                fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
