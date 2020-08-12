import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'workshop_details.dart';
import 'package:testing/bloc/navigation_bloc.dart';

class WorkshopsPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  WorkshopsPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _WorkshopsPageState createState() => _WorkshopsPageState();
}

class _WorkshopsPageState extends State<WorkshopsPage> {
  Widget makeItem(image, title, desc) {
    return AspectRatio(
      aspectRatio: 4 / 4.5,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkshopsDescription(
                        image: image,
                        text: title,
                        description: desc,
                      )));
        },
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
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
            'Workshops',
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
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: height,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  makeItem(
                                      'lib/images/cyber.jpg',
                                      'Ethical Hacking ',
                                      'Are your Facebook Passwords Safe? Is Someone Monitoring Your Gmail Accounts? Well No Need to Worry!!!'),
                                  makeItem(
                                      'lib/images/app.jpg',
                                      'Android App Development',
                                      'Still Downloading the apps from Google Play Store??? It\'s time to build your own!!!'),
                                  makeItem(
                                      'lib/images/bridge_design.jpg',
                                      'Bridge Design Workshop',
                                      'Learn the best practical and economical methods for evaluating ,insecting,strengthening and rehabilitating bridge'),
                                  makeItem(
                                      'lib/images/ai.jpg',
                                      'Artificial Intelligence Workshop',
                                      'It is difficult to think of a major industry that AI will not transform'),
                                  SizedBox(
                                    height: 110,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
