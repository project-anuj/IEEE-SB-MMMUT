import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/bloc/navigation_bloc.dart';
import 'contact_profile.dart';

class ContactPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const ContactPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
//      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Container(
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: onMenuTap,
                  child: Icon(
                    Icons.menu,
                    color: Colors.blueAccent,
                  )),
              title: Text(
                'Contact Us',
                style: TextStyle(color: Colors.blueAccent),
              ),
              elevation: 0.0,
              backgroundColor: Colors.blueAccent.withOpacity(0.0),
            ),
            body: ContactList(),
          ),
        ),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<String> names = [
    'Shresth Sahai',
    'Kshitij Srivastva',
    'Krishna Singh',
    'Pratyush Srivastava',
    'Deebansho',
    'Arpit Verma',
    'Prince',
    'Prajjwal Singh',
    'Danish',
    'Swapnil Gupta',
    'Prajjwal Jaiswal',
    'Ruchi Rai',
    'Akansha Gupta',
    'Chitrakshi',
    'Yashi',
    'Ayushi',
    'Arima Pranjal'
  ];
  final List<String> text = [
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member',
    'Executive Member'
  ];
  final List<String> link = [
    'lib/images/shresth.jpg',
    'lib/images/kshitiz.jpg',
    'lib/images/krishna.jpg',
    'lib/images/pratyush.jpg',
    'lib/images/debansho.jpg',
    'lib/images/arpit.jpg',
    'lib/images/prince.jpg',
    'lib/images/prajjawal_singh.jpg',
    'lib/images/danish.jpg',
    'lib/images/swapnil_gupta.jpg',
    'lib/images/prajjawal_jaiswal.jpg',
    'lib/images/ruchi.jpg',
    'lib/images/akansha.jpg',
    'lib/images/chitrakshi.jpg',
    'lib/images/yashi.jpg',
    'lib/images/ayushi_verma.jpg',
    'lib/images/arima.jpg',
  ];
  final List<String> facebookLink = [
    'https://www.facebook.com/shresth.sahai.7',
    'https://www.facebook.com/i.want.peace.1234',
    'https://www.facebook.com/profile.php?id=100005404470863',
    'https://www.facebook.com/pratyush.srivastava.9',
    'https://www.facebook.com/deabanshoo.singh',
    'https://www.facebook.com/arpit.verma.5688',
    'https://www.facebook.com/prince.kumar1234567890',
    'https://www.facebook.com/deadpool.lunatic.prajjwal',
    'https://www.facebook.com/profile.php?id=100004837961699',
    'https://www.facebook.com/swapnil.gupta.7587370',
    'https://www.facebook.com/profile.php?id=100008175376655',
    'https://www.facebook.com/ruchi.rai.395669',
    'https://www.facebook.com/profile.php?id=100021599081385',
    'https://www.facebook.com/chitrakshi1998',
    'https://www.facebook.com/yashi.sinha',
    'https://www.facebook.com/ayushi.verma.79656921',
    'https://www.facebook.com/arima.pranjal'
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Hero(
              tag: names[index],
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Card(
                      borderOnForeground: true,
                      color: Colors.pinkAccent.shade100,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(link[index]),
                        ),
                        title: Text(
                          names[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          text[index],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile(
                                      facebook: facebookLink[index],
                                      imageLink: link[index],
                                      name: names[index],
                                      index: index)));
                        },
                      ),
                      elevation: 50.0,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
