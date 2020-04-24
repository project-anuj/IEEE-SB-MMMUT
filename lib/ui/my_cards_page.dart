import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';

class MyCardsPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  MyCardsPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  int _current = 0;

  final List<String> imgList = [
    'https://scontent.fdel1-3.fna.fbcdn.net/v/t1.0-9/s960x960/93872789_2637670589818252_3879473697383251968_o.jpg?_nc_cat=108&_nc_sid=110474&_nc_ohc=p8sh98osdOYAX8Lt5rF&_nc_ht=scontent.fdel1-3.fna&_nc_tp=7&oh=14d8e2c0ce8bd76b8586b7cf8ca105f4&oe=5EC66E88',
    'https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/93781108_2636147936637184_5754878756388864000_o.jpg?_nc_cat=100&_nc_sid=110474&_nc_ohc=DmvhCmqmyUMAX_aBXK8&_nc_ht=scontent.fdel1-4.fna&oh=2e914f9dba31c817922c7b3f39a176dc&oe=5EC45512',
    'https://scontent.fdel1-2.fna.fbcdn.net/v/t1.0-9/91063800_2615810875337557_6169977316798627840_n.jpg?_nc_cat=101&_nc_sid=110474&_nc_ohc=fjDaApOf-msAX8yZf3F&_nc_ht=scontent.fdel1-2.fna&oh=a80818faecc574c8511a2aba2a97e3f5&oe=5EC5CF93',
    'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/85003607_2580620885523223_2891365322172923904_o.jpg?_nc_cat=105&_nc_sid=110474&_nc_ohc=Z-_bRcp9An8AX8ZvB5r&_nc_ht=scontent.flko3-1.fna&oh=0f6371f49549517115f5697a43c3e1a4&oe=5EC74F3A',
    'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/85038599_2565342210384424_2605618562399731712_o.jpg?_nc_cat=107&_nc_sid=110474&_nc_ohc=Y4fvovAyaWsAX82nuHE&_nc_ht=scontent.flko3-1.fna&oh=2b1e552cc9ecbd8a117ee090d8fe3582&oe=5EC7999D',
    'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/82066174_2553567831561862_8060626232644993024_o.jpg?_nc_cat=105&_nc_sid=110474&_nc_ohc=P2xWIODlyFUAX_Mtqfo&_nc_ht=scontent.flko3-1.fna&oh=21aaa56d4d4279a7416fa5919cc1123a&oe=5EC655B9',
    'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/74327605_2494041797514466_8195283048036564992_o.jpg?_nc_cat=106&_nc_sid=110474&_nc_ohc=JW7_7URZaiwAX_fgSTI&_nc_ht=scontent.flko3-1.fna&oh=7c072ebfe289bcabfac4c6af7c784f35&oe=5EC49CF8',
    'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/64820426_2368968986688415_5282732164020961280_o.jpg?_nc_cat=111&_nc_sid=110474&_nc_ohc=OM9hHdrXGf8AX_7NMYj&_nc_ht=scontent.flko3-1.fna&oh=20413e6ae8af5a30ec5907daba242371&oe=5EC75E8B',
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget makeItem(image, title) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
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
                  SizedBox(
                    height: height / 20,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CarouselSlider(
                          height: 200,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                          initialPage: 0,
                          onPageChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          items: imgList.map((imgUrl) {
                            return Builder(builder: (BuildContext context) {
                              return Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: Image.network(
                                    imgUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            });
                          }).toList(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(imgList, (index, url) {
                            return Container(
                              width: 6.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.redAccent
                                      : Colors.green),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Events",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                        fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                  )
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
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/76697318_2478082859110360_5716711928944918528_o.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=6ffNGkzsVkEAX-2gdWl&_nc_ht=scontent.flko3-1.fna&oh=bee8a6b50948c6084c0bdd17f545b176&oe=5EC73E1C',
                                        'Robokriti'),
                                    makeItem(
                                        'https://images.unsplash.com/photo-1572575156811-2ae050d748d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                                        'Fest Night'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-0/p640x640/43663430_2198660957052553_7790924306753519616_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=J-jtJlhXmzAAX-FprsW&_nc_ht=scontent.flko3-1.fna&_nc_tp=6&oh=73501618c5b0724c89f8710d98d0376a&oe=5EC3C903',
                                        'Informals'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-9/64316936_2363917903860190_4154314899536740352_o.jpg?_nc_cat=107&_nc_sid=110474&_nc_ohc=a3OKZlErgQkAX9taj_E&_nc_ht=scontent.fdel27-1.fna&oh=5d5e1c9d220446d48d9af7f506b73ee2&oe=5EC55B91',
                                        'Campus Ambassador'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/69973364_2421079424810704_6285653490593169408_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=bknaZdFGdFwAX8lWaQp&_nc_ht=scontent.flko3-1.fna&oh=69e334f6d2770f567063909efcc04edc&oe=5EC78793',
                                        'Pixels'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/72777026_2464412473810732_6099015343148105728_o.jpg?_nc_cat=111&_nc_sid=110474&_nc_ohc=gJOoWgYQz7UAX9DKZHU&_nc_ht=scontent.flko3-1.fna&oh=98883418417afe7ecab62cf73e8d9b76&oe=5EC77ADF',
                                        'Enigma'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-0/p640x640/71899638_2461238024128177_5034012643724099584_o.jpg?_nc_cat=111&_nc_sid=8024bb&_nc_ohc=6lnzSeQ0Ln4AX8Pm8tL&_nc_ht=scontent.flko3-1.fna&_nc_tp=6&oh=1cbf4150fabc1bf33bc55301a6421f9d&oe=5EC70072',
                                        'TechPrastuti & Manthan'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-0/p640x640/43180697_2194433844141931_5091429656322637824_o.jpg?_nc_cat=101&_nc_sid=8024bb&_nc_ohc=NvOTsFO_booAX_f-Azo&_nc_ht=scontent.fdel27-1.fna&_nc_tp=6&oh=5d0e081cc2792f15c868f2ebf8fc64a9&oe=5EC5F35B',
                                        'CodeZilla'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-0/p640x640/43379754_2197009537217695_582205795047833600_o.jpg?_nc_cat=106&_nc_sid=8024bb&_nc_ohc=JSfuo9GZaZYAX_VbIfH&_nc_ht=scontent.fdel27-1.fna&_nc_tp=6&oh=d55652d7f25106bde73fe20751f6ae6f&oe=5EC719CD',
                                        'Incognito'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-0/p640x640/43335398_2196091297309519_2303113428648067072_o.jpg?_nc_cat=101&_nc_sid=8024bb&_nc_ohc=ByGsyOVCLP4AX9wRvC5&_nc_ht=scontent.fdel27-1.fna&_nc_tp=6&oh=69342ec5920196059a72978fbb6e4c91&oe=5EC57E63',
                                        'Bizgyan'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-9/s960x960/43331285_2196098200642162_1725421279156109312_o.jpg?_nc_cat=107&_nc_sid=8024bb&_nc_ohc=4aVZo48fAgUAX-T_1GF&_nc_ht=scontent.fdel27-1.fna&_nc_tp=7&oh=834cd0cbef9d4c588c7a146beef8acb5&oe=5EC64603',
                                        'Techneeti'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-0/p640x640/43433855_2197000210551961_4772866851032006656_o.jpg?_nc_cat=100&_nc_sid=8024bb&_nc_ohc=EZylABB1uEoAX9625oE&_nc_ht=scontent.fdel27-1.fna&_nc_tp=6&oh=186902815f4b0cc3f83a7d1e93cc447b&oe=5EC618F7',
                                        'World Parliament'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Workshops",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                        fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                  )
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
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-9/s960x960/40971441_2174120919506557_6791075720043954176_o.jpg?_nc_cat=111&_nc_sid=8024bb&_nc_ohc=rf9wjyHwovgAX-eHVhm&_nc_ht=scontent.fdel27-1.fna&_nc_tp=7&oh=6f0c50cda64a95ac19f968c4cbaa6bdb&oe=5EC59DBC',
                                        'Ethical Hacking'),
                                    makeItem(
                                        'https://images.unsplash.com/photo-1535303311164-664fc9ec6532?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                                        'Android App Development'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t31.0-8/22289757_1964919883759996_8386893356246270047_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=1szaPF3TuAIAX8cxJX6&_nc_ht=scontent.fdel27-1.fna&oh=2e4b3b7aa6e82f530f8cbe3d23e7b931&oe=5EC5CBE4',
                                        'Bridge Design Workshop'),
                                    makeItem(
                                        'https://images.unsplash.com/photo-1527474305487-b87b222841cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80',
                                        'Artificial Intelligence Workshop'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                Text(
//                                  "Teaser",
//                                  style: TextStyle(
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.grey[800],
//                                      fontSize: 20),
//                                ),
//                                Icon(
//                                  Icons.arrow_forward,
//                                  size: 25,
//                                )
//                              ],
//                            ),
//                            SizedBox(
//                              height: 20,
//                            ),
//                            Container(
//                              height: 200,
//                              child: ListView(
//                                scrollDirection: Axis.horizontal,
//                                children: <Widget>[
//                                  ChewieListItem(
//                                    videoPlayerController:
//                                        VideoPlayerController.asset(
//                                            'videos/techSRIJAN.mp4'),
//                                  ),
//                                ],
//                              ),
//                            ),
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
      ),
    );
  }
}
