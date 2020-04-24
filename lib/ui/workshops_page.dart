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
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
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
                                      'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-9/s960x960/40971441_2174120919506557_6791075720043954176_o.jpg?_nc_cat=111&_nc_sid=8024bb&_nc_ohc=rf9wjyHwovgAX-eHVhm&_nc_ht=scontent.fdel27-1.fna&_nc_tp=7&oh=6f0c50cda64a95ac19f968c4cbaa6bdb&oe=5EC59DBC',
                                      'Ethical Hacking ',
                                      'Are your Facebook Passwords Safe? Is Someone Monitoring Your Gmail Accounts? Well No Need to Worry!!!'),
                                  makeItem(
                                      'https://images.unsplash.com/photo-1535303311164-664fc9ec6532?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                                      'Android App Development',
                                      'Still Downloading the apps from Google Play Store??? It\'s time to build your own!!!'),
                                  makeItem(
                                      'https://scontent.fdel27-1.fna.fbcdn.net/v/t31.0-8/22289757_1964919883759996_8386893356246270047_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=1szaPF3TuAIAX8cxJX6&_nc_ht=scontent.fdel27-1.fna&oh=2e4b3b7aa6e82f530f8cbe3d23e7b931&oe=5EC5CBE4',
                                      'Bridge Design Workshop',
                                      'Learn the best practical and economical methods for evaluating ,insecting,strengthening and rehabilitating bridge'),
                                  makeItem(
                                      'https://images.unsplash.com/photo-1527474305487-b87b222841cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80',
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
