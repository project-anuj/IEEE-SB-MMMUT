import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuNav extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;

  const MenuNav(
      {Key key, this.slideAnimation, this.menuAnimation, this.selectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.DashboardClickedEvent);
                    },
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: selectedIndex == 0 ? 30 : 22,
                        fontWeight: selectedIndex == 0
                            ? FontWeight.w900
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.EventsClickedEvent);
                    },
                    child: Text(
                      "Events",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: selectedIndex == 1 ? 30 : 22,
                        fontWeight: selectedIndex == 1
                            ? FontWeight.w900
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.WorkshopsClickedEvent);
                    },
                    child: Text(
                      "Workshops",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: selectedIndex == 2 ? 30 : 22,
                        fontWeight: selectedIndex == 2
                            ? FontWeight.w900
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigationEvents.ContactClickedEvents);
                    },
                    child: Text(
                      "Contacts",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: selectedIndex == 3 ? 30 : 22,
                        fontWeight: selectedIndex == 3
                            ? FontWeight.w900
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 8, 170, 8),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  Text(
                    "Follow on:",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          launch('https://facebook.com/techSRIJAN');
                        },
                        colorBrightness: Brightness.light,
                        child: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blueAccent,
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          launch('http://techsrijan.org/');
                        },
                        colorBrightness: Brightness.light,
                        child: Icon(
                          Icons.web,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            launch('https://instagram.com/techsrijan.mmmut');
                          },
                          colorBrightness: Brightness.light,
                          child: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.red,
                          )),
                      FlatButton(
                        onPressed: () {
                          launch(
                              'https://www.linkedin.com/in/ieee-mmmut-57a27b1a6/');
                        },
                        colorBrightness: Brightness.light,
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 8, 170, 8),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  Text(
                    "Developer :",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            launch(
                                'https://www.instagram.com/anujvishwakarma206/');
                          },
                          colorBrightness: Brightness.light,
                          child: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.red,
                          )),
                      FlatButton(
                        onPressed: () {
                          launch(
                              'https://www.linkedin.com/in/anuj-vishwakarma-baa18818a/');
                        },
                        colorBrightness: Brightness.light,
                        child: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
