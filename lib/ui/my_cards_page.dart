import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testing/live_page.dart';

class MyCardsPage extends StatefulWidget with NavigationStates {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuAnimation;
  final int selectedIndex;
  final Function onMenuTap;
  MyCardsPage(
      {Key key,
      this.slideAnimation,
      this.menuAnimation,
      this.selectedIndex,
      this.onMenuTap})
      : super(key: key);

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  // int _current = 0;
  //
  // final List<String> imgList = [
  //   'lib/images/Screenshot (109).jpg',
  //   'lib/images/Screenshot (108).jpg',
  //   'lib/images/Screenshot (107).jpg',
  //   'lib/images/Screenshot (106).jpg',
  //   'lib/images/Screenshot (105).jpg',
  //   'lib/images/Screenshot (104).jpg',
  //   'lib/images/Screenshot (112).jpg',
  // ];
  // List<T> map<T>(List list, Function handler) {
  //   List<T> result = [];
  //   for (var i = 0; i < list.length; i++) {
  //     result.add(handler(i, list[i]));
  //   }
  //   return result;
  // }
  //
  Widget makeItem(image, title) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
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
    );
  }

  // items(double width) {
  //   return imgList.map((imgUrl) {
  //     return Builder(builder: (BuildContext context) {
  //       return Card(
  //         margin: EdgeInsets.symmetric(horizontal: 10.0),
  //         child: Container(
  //           width: width,
  //           decoration: BoxDecoration(
  //             color: Colors.green,
  //           ),
  //           child: (imgUrl == null || imgUrl == '')
  //               ? CircularProgressIndicator()
  //               : Image.asset(
  //                   imgUrl,
  //                   fit: BoxFit.fill,
  //                 ),
  //         ),
  //       );
  //     });
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
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
            'Dashboard',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LivePage()));
              },
              child: Center(
                  child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  "LIVE",
                  style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              )),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height / 4,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        // padding: const EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        height: 225,
                        // padding: const EdgeInsets.all(8.0),
                        // width: MediaQuery.of(context).size.width - 20,
                        child: Carousel(
                          boxFit: BoxFit.fill,
                          animationCurve: Curves.fastOutSlowIn,
                          // borderRadius: true,
                          dotIncreasedColor: Color(0xFFFF335C),
                          dotBgColor: Colors.transparent,
                          indicatorBgPadding: 1.0,
                          showIndicator: true,
                          overlayShadow: true,
                          dotColor: Colors.greenAccent,
                          dotSize: 5.0,
                          animationDuration: Duration(milliseconds: 2000),
                          images: [
                            AssetImage('lib/images/Screenshot (109).jpg'),
                            AssetImage('lib/images/Screenshot (108).jpg'),
                            AssetImage('lib/images/Screenshot (107).jpg'),
                            AssetImage('lib/images/Screenshot (106).jpg'),
                            AssetImage('lib/images/Screenshot (105).jpg'),
                            AssetImage('lib/images/Screenshot (104).jpg'),
                            AssetImage('lib/images/Screenshot (112).jpg'),
                          ],
                        ),
                      ),
                      // CarouselSlider(
                      //   height: 200,
                      //   autoPlay: true,
                      //   autoPlayInterval: Duration(seconds: 2),
                      //   autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      //   autoPlayCurve: Curves.fastOutSlowIn,
                      //   pauseAutoPlayOnTouch: Duration(seconds: 10),
                      //   aspectRatio: 2.0,
                      //   enableInfiniteScroll: true,
                      //   viewportFraction: 0.8,
                      //   onPageChanged: (index) {
                      //     setState(() {
                      //       _current = index;
                      //     });
                      //   },
                      //   items: items(width),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: map<Widget>(imgList, (index, url) {
                      //     return Container(
                      //       width: 6.0,
                      //       height: 8.0,
                      //       margin: EdgeInsets.symmetric(
                      //           vertical: 0.0, horizontal: 2.0),
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: _current == index
                      //               ? Colors.redAccent
                      //               : Colors.green),
                      //     );
                      //   }),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Events",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  makeItem(
                                      'lib/images/robokriti.jpg', 'Robokriti'),
                                  makeItem(
                                      'lib/images/festnight.jpg', 'Fest Night'),
                                  makeItem(
                                      'lib/images/informals.jpg', 'Informals'),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: InkWell(
                                      onTap: widget.onMenuTap,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Workshops",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  makeItem('lib/images/cyber.jpg',
                                      'Ethical Hacking'),
                                  makeItem('lib/images/app.jpg',
                                      'Android App Development'),
                                  makeItem('lib/images/python.jpg',
                                      'Python Workshop'),
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    child: InkWell(
                                      onTap: widget.onMenuTap,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
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
