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
                                      'lib/images/robokriti.jpg',
                                      'Robokriti',
                                      'The evolution is not just confined to all that is living but to technology as well. Since the advent of machines, man has constantly striven to build machines that can substitute human labour. A faithful servent,a rentless and effective worker'),
                                  makeItem(
                                      'lib/images/festnight.jpg',
                                      'Fest Night',
                                      'Apart from all the technical fun, there awaits some really cool and amazing performances and acts including laser shows, rock bands,fashion drills to add the aura of fest night,cultural events boost the zest of the fest.'),
                                  makeItem(
                                      'lib/images/informals.jpg',
                                      'Informals',
                                      'With the offbeat incentric events ,here is the place where you can lose yourself and enjoy to the fullest. Plenty of addictive and enchanting games,fun,adventures and this event something for one and all'),
                                  makeItem(
                                      'lib/images/campus.jpg',
                                      'Campus Ambassador',
                                      'Every college student in India gets the right opportunities to live their dream career. The Campus Ambassador Program is one of the biggest of its kind. Every year Hundreds of students apply for this program and techSRIJAN exclusively handpicks its Campus Ambassadors from this pool of applications.'),
                                  makeItem('lib/images/pixels.jpg', 'Pixels',
                                      'The pictures spark epitome of imagination in you, so unleash your creativity and show your world of imagination through your camera in PIXELS. Get ready to showcase your photography skills!!!'),
                                  makeItem('lib/images/enigma.jpg', 'Enigma',
                                      'ENIGMA is an inline treasure hunt with an interesting story plot and a fascinating outcome. If you think that you can "google" well-enough, Enigma is the game for you!!!'),
                                  makeItem(
                                      'lib/images/techprastuti.jpg',
                                      'TechPrastuti & Manthan',
                                      'These events are designed to cater to the intellectual requirements of students at national level. Giving words to their ideas, student have an excellent opportunity here to present before the world.'),
                                  makeItem(
                                      'lib/images/codezilla.jpg',
                                      'CodeZilla',
                                      'These events are aimed to test the basic technical and entrepreneurial skills of the students. They provide an opportunity for all the designers to test their mettle! CODEZILLA is a coding event for student to check their coding skills.Coding has well and truely made its way into the mainstream and words per minute while looking at a endlessly scrolling text of screen.'),
                                  makeItem(
                                      'lib/images/incognito.jpg',
                                      'Incognito',
                                      'These events consists of competition of various multiplayer games such as Counter Strike,FIFA,Tekken, Mini-Militia and Need for Spped ost Wanted'),
                                  makeItem('lib/images/bizgyan.jpg', 'Bizgyan',
                                      'Every bussiness activity involves risk and uncertainty. The important thing is not being afraid to take a chance. To win without risk is to triumph with glory. Successful bussiness understand the need to continuously improve their bussiness process, to become more efficient and productive. One should remember that only perseverance can lead the path to success. TechSrijan provides you with a platform to evaluate your bussiness knowledge,talent and limitations.'),
                                  makeItem(
                                      'lib/images/techneeti.jpg',
                                      'Techneeti',
                                      'Science and Technology is the basis for cvilisation. Technological advancement in the modern life has provided us lots of remarkable insights all over the world. Development whether it is human development or country development, is linked to proper growth and development in the technology im many ways. techSRIJAN provides you a platform to evaluate and enhance your technical knowledge.'),
                                  makeItem(
                                      'lib/images/world.jpg',
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
    );
  }
}
