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
    'Deabanshoo',
    'Shreyash Singh',
    'Arima Pranjal',
    'Pratyush Srivastava',
    'Kshitiz Srivastava',
    'Krishna Singh',
    'Ruchi Rai',
    'Vivek Bhatt',
    'Kausal Singh',
    'Prajjwal Singh',
    'Prajjwal Jaiswal',
    'Shivasheesh Chaturvedi',
    'Ashish Rathore',
    'Vimalendu Pandey',
    'Chetan Mittal',
    'Arpit Kumar Verma',
    'Swapnil Gupta',
    'Madhusudan Prakash',
    'Mohammad Danish',
    'Mayank Kumar Singh',
    'Suryapratap Rathore',
    'Saurabh Tripathi',
    'Priyanshu Gothwal',
    'Yashi Sinha',
    'Chitrakshi Vaish',
    'Akanksha Gupta',
    'Anupriya Nishad',
    'Ayushi Verma',
  ];
  final List<String> link = [
    'lib/images/shresth.jpg',
    'lib/images/debansho.jpg',
    'lib/images/shreyah Singh.jpg',
    'lib/images/arima.jpg',
    'lib/images/pratyush.jpg',
    'lib/images/kshitiz.jpg',
    'lib/images/krishna.jpg',
    'lib/images/ruchi.jpg',
    'lib/images/Vivek Bhatt.jpg',
    'lib/images/kaushal.jpg',
    'lib/images/prajjawal_singh.jpg',
    'lib/images/prajjawal_jaiswal.jpg',
    'lib/images/shivaseesh.jpg',
    'lib/images/ashish.jpg',
    'lib/images/vimlendu.jpg',
    'lib/images/chetan.jpg',
    'lib/images/arpit.jpg',
    'lib/images/swapnil_gupta.jpg',
    'lib/images/madhusudan.jpg',
    'lib/images/danish.jpg',
    'lib/images/mayan.jpg',
    'lib/images/surya.jpg',
    'lib/images/saurabh.jpg',
    'lib/images/priyanshu_gothwal.jpg',
    'lib/images/yashi.jpg',
    'lib/images/chitrakshi.jpg',
    'lib/images/akansha.jpg',
    'lib/images/anupriya.jpg',
    'lib/images/ayushi_verma.jpg',
  ];
  final List<String> text = [
    'Student Chair',
    'Vice-Chair',
    'Vice-Chair',
    'Vice-Chair',
    'Treasurer',
    'Secretary',
    'Secretary',
    'Joint Secretary',
    'Joint Secretary',
    'Joint Secretary',
    'Technical Head',
    'Technical Head',
    'Technical Head',
    'Technical Head',
    'Media and Publicity Head',
    'Sponsorship Head',
    'Sponsorship Head',
    'Alumni Relations Head',
    'Alumni Relations Head',
    'Head of Management and Hospitality Team',
    'Executive Members of Management and Hospital Team',
    'Executive Members of Management and Hospital Team',
    'Executive Members of Management and Hospital Team',
    'Executive Members of Management and Hospital Team',
    'Chair of WIE Chapter',
    'Vice-Chair of WIE Chapter',
    'Joint Secretary',
    'Chair of SIGHT Chapter',
    'Vice-Chair of SIGHT Chapter',
  ];

  final List<String> facebookLink = [
    'https://www.facebook.com/shresth.sahai.7',
    'https://www.facebook.com/deabanshoo.singh',
    'https://www.facebook.com/shreyash.singh.5815',
    'https://www.facebook.com/arima.pranjal',
    'https://www.facebook.com/pratyush.srivastava.9',
    'https://www.facebook.com/i.want.peace.1234',
    'https://www.facebook.com/profile.php?id=100005404470863',
    'https://www.facebook.com/ruchi.rai.395669',
    'https://www.facebook.com/vivek.bhatt.568',
    'https://www.facebook.com/kaushalsingh1421',
    'https://www.facebook.com/deadpool.lunatic.prajjwal',
    'https://www.facebook.com/profile.php?id=100008175376655',
    'https://www.facebook.com/shivasheesh.chaturvedi',
    'https://www.facebook.com/ashish.rathore.581187',
    'https://www.facebook.com/vimalendu.pandey.16',
    'https://www.facebook.com/chetan.mittal.338',
    'https://www.facebook.com/verma.arpitkumar',
    'https://www.facebook.com/swapnil.gupta.7587370',
    'https://www.facebook.com/madhusudan.prakash.7',
    'https://www.facebook.com/profile.php?id=100004837961699',
    'https://www.facebook.com/profile.php?id=100002681111379',
    'https://www.facebook.com/suryarathore616',
    'https://www.facebook.com/profile.php?id=100004896375664',
    'https://www.facebook.com/gothwal.jr',
    'https://www.facebook.com/yashi.sinha',
    'https://www.facebook.com/chitrakshi1998',
    'https://www.facebook.com/profile.php?id=100021599081385',
    'https://www.facebook.com/profile.php?id=100008611634221',
    'https://www.facebook.com/ayushi.verma.79656921',
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
                                      text: text[index],
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
