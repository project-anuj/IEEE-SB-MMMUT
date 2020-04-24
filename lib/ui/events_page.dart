import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'events_description.dart';

class EventsPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  EventsPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
//  int _current = 0;
//
//  final List<String> imgList = [
//    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//  ];
//  List<T> map<T>(List list, Function handler) {
//    List<T> result = [];
//    for (var i = 0; i < list.length; i++) {
//      result.add(handler(i, list[i]));
//    }
//    return result;
//  }

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
    return SafeArea(
      child: ClipRRect(
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
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/76697318_2478082859110360_5716711928944918528_o.jpg?_nc_cat=110&_nc_sid=e007fa&_nc_ohc=6ffNGkzsVkEAX-2gdWl&_nc_ht=scontent.flko3-1.fna&oh=bee8a6b50948c6084c0bdd17f545b176&oe=5EC73E1C',
                                        'Robokriti',
                                        'The evolution is not just confined to all that is living but to technology as well. Since the advent of machines, man has constantly striven to build machines that can substitute human labour. A faithful servent,a rentless and effective worker'),
                                    makeItem(
                                        'https://images.unsplash.com/photo-1572575156811-2ae050d748d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                                        'Fest Night',
                                        'Apart from all the technical fun, there awaits some really cool and amazing performances and acts including laser shows, rock bands,fashion drills to add the aura of fest night,cultural events boost the zest of the fest.'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-0/p640x640/43663430_2198660957052553_7790924306753519616_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=J-jtJlhXmzAAX-FprsW&_nc_ht=scontent.flko3-1.fna&_nc_tp=6&oh=73501618c5b0724c89f8710d98d0376a&oe=5EC3C903',
                                        'Informals',
                                        'With the offbeat incentric events ,here is the place where you can lose yourself and enjoy to the fullest. Plenty of addictive and enchanting games,fun,adventures and this event something for one and all'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-9/64316936_2363917903860190_4154314899536740352_o.jpg?_nc_cat=107&_nc_sid=110474&_nc_ohc=a3OKZlErgQkAX9taj_E&_nc_ht=scontent.fdel27-1.fna&oh=5d5e1c9d220446d48d9af7f506b73ee2&oe=5EC55B91',
                                        'Campus Ambassador',
                                        'Every college student in India gets the right opportunities to live their dream career. The Campus Ambassador Program is one of the biggest of its kind. Every year Hundreds of students apply for this program and techSRIJAN exclusively handpicks its Campus Ambassadors from this pool of applications.'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/69973364_2421079424810704_6285653490593169408_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=bknaZdFGdFwAX8lWaQp&_nc_ht=scontent.flko3-1.fna&oh=69e334f6d2770f567063909efcc04edc&oe=5EC78793',
                                        'Pixels',
                                        'The pictures spark epitome of imagination in you, so unleash your creativity and show your world of imagination through your camera in PIXELS. Get ready to showcase your photography skills!!!'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-9/72777026_2464412473810732_6099015343148105728_o.jpg?_nc_cat=111&_nc_sid=110474&_nc_ohc=gJOoWgYQz7UAX9DKZHU&_nc_ht=scontent.flko3-1.fna&oh=98883418417afe7ecab62cf73e8d9b76&oe=5EC77ADF',
                                        'Enigma',
                                        'ENIGMA is an inline treasure hunt with an interesting story plot and a fascinating outcome. If you think that you can "google" well-enough, Enigma is the game for you!!!'),
                                    makeItem(
                                        'https://scontent.flko3-1.fna.fbcdn.net/v/t1.0-0/p640x640/71899638_2461238024128177_5034012643724099584_o.jpg?_nc_cat=111&_nc_sid=8024bb&_nc_ohc=6lnzSeQ0Ln4AX8Pm8tL&_nc_ht=scontent.flko3-1.fna&_nc_tp=6&oh=1cbf4150fabc1bf33bc55301a6421f9d&oe=5EC70072',
                                        'TechPrastuti & Manthan',
                                        'These events are designed to cater to the intellectual requirements of students at national level. Giving words to their ideas, student have an excellent opportunity here to present before the world.'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-0/p640x640/43180697_2194433844141931_5091429656322637824_o.jpg?_nc_cat=101&_nc_sid=8024bb&_nc_ohc=NvOTsFO_booAX_f-Azo&_nc_ht=scontent.fdel27-1.fna&_nc_tp=6&oh=5d0e081cc2792f15c868f2ebf8fc64a9&oe=5EC5F35B',
                                        'CodeZilla',
                                        'These events are aimed to test the basic technical and entrepreneurial skills of the students. They provide an opportunity for all the designers to test their mettle! CODEZILLA is a coding event for student to check their coding skills.Coding has well and truely made its way into the mainstream and words per minute while looking at a endlessly scrolling text of screen.'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-0/p640x640/43379754_2197009537217695_582205795047833600_o.jpg?_nc_cat=106&_nc_sid=8024bb&_nc_ohc=JSfuo9GZaZYAX_VbIfH&_nc_ht=scontent.fdel27-1.fna&_nc_tp=6&oh=d55652d7f25106bde73fe20751f6ae6f&oe=5EC719CD',
                                        'Incognito',
                                        'These events consists of competition of various multiplayer games such as Counter Strike,FIFA,Tekken, Mini-Militia and Need for Spped ost Wanted'),
                                    makeItem(
                                        'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-0/p640x640/70717989_2443885982530048_6100598403668901888_o.jpg?_nc_cat=106&_nc_sid=110474&_nc_ohc=yGDbtOAkK5AAX8RYsrf&_nc_ht=scontent-bom1-1.xx&_nc_tp=6&oh=9d06f937c7b3a9c854a441348f330561&oe=5EC7121E',
                                        'Bizgyan',
                                        'Every bussiness activity involves risk and uncertainty. The important thing is not being afraid to take a chance. To win without risk is to triumph with glory. Successful bussiness understand the need to continuously improve their bussiness process, to become more efficient and productive. One should remember that only perseverance can lead the path to success. TechSrijan provides you with a platform to evaluate your bussiness knowledge,talent and limitations.'),
                                    makeItem(
                                        'https://scontent.fdel27-1.fna.fbcdn.net/v/t1.0-9/s960x960/43331285_2196098200642162_1725421279156109312_o.jpg?_nc_cat=107&_nc_sid=8024bb&_nc_ohc=4aVZo48fAgUAX-T_1GF&_nc_ht=scontent.fdel27-1.fna&_nc_tp=7&oh=834cd0cbef9d4c588c7a146beef8acb5&oe=5EC64603',
                                        'Techneeti',
                                        'Science and Technology is the basis for cvilisation. Technological advancement in the modern life has provided us lots of remarkable insights all over the world. Development whether it is human development or country development, is linked to proper growth and development in the technology im many ways. techSRIJAN provides you a platform to evaluate and enhance your technical knowledge.'),
                                    makeItem(
                                        'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-0/p640x640/70433836_2442071319378181_8909403592440414208_o.jpg?_nc_cat=106&_nc_sid=110474&_nc_ohc=3tkWRD5qeUEAX8sAxWv&_nc_ht=scontent-bom1-1.xx&_nc_tp=6&oh=edc8da1df453d52f9b13e1081628c612&oe=5EC46792',
                                        'World Parliament',
                                        'Achieving a peaceful,just and sustainable world civilization requires an evolutionary leap forward towards a federal global government. The creation of a democratic world parliament is central to this idea. In this event the delegates of different countries debate global concerns and reflect the relevance of this monumental idea.'),
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
      ),
    );
  }
}
