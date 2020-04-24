import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeveloperPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const DeveloperPage({Key key, this.onMenuTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.teal,
//          automaticallyImplyLeading: true,
            leading: InkWell(onTap: onMenuTap, child: Icon(Icons.menu)),
            title: Text('Profile'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.teal[200],
                      backgroundImage:
                          AssetImage('lib/images/profile_photo.jpg'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.teal,
                      elevation: 0.0,
                      child: Text(
                        'ANUJ VISHWAKARMA',
                        style: TextStyle(
//                          fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Computer Science and Engineering',
                      style: TextStyle(
                          color: Colors.teal.shade100,
                          fontSize: 15,
                          letterSpacing: 2.5),
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
                          launch(
                              'https://www.facebook.com/people/Anuj-Vishwakarma/100033438050802');
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
                                width: 40,
                              ),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                    color: Colors.teal,
//                                fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          launch(
                              'https://www.instagram.com/anujvishwakarma206/');
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
                                FontAwesomeIcons.instagram,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Instagram',
                                style: TextStyle(
                                    color: Colors.teal,
//                                fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          launch(
                              'https://www.linkedin.com/in/anuj-vishwakarma-baa18818a/');
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
                                Icons.mail_outline,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'LinkedIn',
                                style: TextStyle(
                                    color: Colors.teal,
//                                fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          launch('https://github.com/project-anuj');
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
                                FontAwesomeIcons.github,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Git-Hub',
                                style: TextStyle(
                                    color: Colors.teal,
//                                fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
