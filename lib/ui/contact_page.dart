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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
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
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  List<String> names = [
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
  List<String> text = [
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
  List<String> link = [
    'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-9/p960x960/30709022_180838329305227_5650367066612432896_o.jpg?_nc_cat=110&_nc_sid=110474&_nc_ohc=Wdu5NX6ffHoAX8ugOkx&_nc_ht=scontent-bom1-1.xx&_nc_tp=6&oh=d6087ca478381024c87f9a2c0e36e81b&oe=5EC11BE6',
    'https://scontent-bom1-1.xx.fbcdn.net/v/t31.0-0/p552x414/20819111_1182146818596466_6289861116148439044_o.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=bcMzff5Gx9QAX_tp2oR&_nc_ht=scontent-bom1-1.xx&_nc_tp=6&oh=d01967e7eaa3f0b02f7c94ad34256576&oe=5EBE1ED3',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-0/c0.0.552.552a/p552x414/36784785_804538843069591_4751407704067538944_n.jpg?_nc_cat=107&_nc_sid=85a577&_nc_ohc=G8n6WjGOJ00AX_N9QSJ&_nc_ht=scontent-bom1-2.xx&oh=2aa548ef7e46639afb639f1aa888a276&oe=5EC0D5F5',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/p960x960/90813604_2467572006676850_3499865065920659456_o.jpg?_nc_cat=100&_nc_sid=85a577&_nc_ohc=oQV22P8VYvcAX8wyuit&_nc_ht=scontent-bom1-2.xx&_nc_tp=6&oh=08ae614a08b8078158bcba741c1baa24&oe=5EBF8949',
    'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-9/24174578_815822681942688_5734995839136571880_n.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=ipmuHylFLJwAX9hODlA&_nc_ht=scontent-bom1-1.xx&oh=b6b9e03bb845278180d56b2c8c851a59&oe=5EBF9F3E',
    'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-0/p552x414/44763679_1802842996511469_4374729528791007232_n.jpg?_nc_cat=102&_nc_sid=85a577&_nc_ohc=ZYFc-fZIhYcAX8NdJXw&_nc_ht=scontent-bom1-1.xx&_nc_tp=6&oh=fa46d2cbd2802b55e39d5e75c414a1cc&oe=5EBE2F7F',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/85108444_187683889305255_5294875715898966016_o.jpg?_nc_cat=107&_nc_sid=8024bb&_nc_ohc=7VSEM58qNHcAX85J6tF&_nc_ht=scontent-bom1-2.xx&oh=d20aef67ef085c383ba678f0ebfdb125&oe=5EBDC61A',
    'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-9/65318090_352667742060589_2508913628518809600_n.jpg?_nc_cat=105&_nc_sid=13bebb&_nc_ohc=yZM7JPRRpn8AX_TkXb6&_nc_ht=scontent-bom1-1.xx&oh=39a824fb1adbaf6793fb9d2cd47f918d&oe=5EC03A20',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/s960x960/66304632_1215498738621380_3134404301544226816_o.jpg?_nc_cat=111&_nc_sid=85a577&_nc_ohc=sFpvp3Lp08QAX-LQShi&_nc_ht=scontent-bom1-2.xx&_nc_tp=7&oh=5a3dc9da9b1734fbd46f539a42ebefbb&oe=5EC004D6',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/91855949_540872466833120_7449863414794420224_n.jpg?_nc_cat=109&_nc_sid=85a577&_nc_ohc=uX3JszCXYL0AX97LIr8&_nc_ht=scontent-bom1-2.xx&oh=476f24717a3a5346471560c475a8f57c&oe=5EBE3B66',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/s960x960/48412798_2278763082406182_5048685141065465856_o.jpg?_nc_cat=109&_nc_sid=85a577&_nc_ohc=QrH8JfnrgSsAX9ITdIT&_nc_ht=scontent-bom1-2.xx&_nc_tp=7&oh=a6217c8a0ae54627d4ca9460314c2ac9&oe=5EBFA04D',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/s960x960/35463277_224775874919047_3177236635997700096_o.jpg?_nc_cat=109&_nc_sid=8024bb&_nc_ohc=w5mAU85gv1EAX9tRkZI&_nc_ht=scontent-bom1-2.xx&_nc_tp=7&oh=8bb91187bec87be5caaacce1e3ea070a&oe=5EBED284',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/26907378_170371050359530_9165120333912626323_n.jpg?_nc_cat=107&_nc_sid=7aed08&_nc_ohc=7d9fAKMDF2IAX-xMBGN&_nc_ht=scontent-bom1-2.xx&oh=033c2b01ad921e0e85c1d96fea71e0d2&oe=5EC00C6E',
    'https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-9/s960x960/60351066_2263820487045341_5370042840489394176_o.jpg?_nc_cat=102&_nc_sid=85a577&_nc_ohc=r6h7tXlF0kMAX_FB8Ai&_nc_ht=scontent-bom1-1.xx&_nc_tp=7&oh=e9bcd3cc4109502bf7e3d0936538f6ad&oe=5EBFAC94',
    'https://scontent-bom1-1.xx.fbcdn.net/v/t31.0-8/p720x720/17855413_1396943080367235_8668949187094460072_o.jpg?_nc_cat=104&_nc_sid=7aed08&_nc_ohc=aANg1NuTZm4AX84q6BP&_nc_ht=scontent-bom1-1.xx&_nc_tp=6&oh=1606e4621f1569419fb4c30942d9681e&oe=5EC132DA',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t1.0-9/24294120_2035274983373223_4213165333868524844_n.jpg?_nc_cat=107&_nc_sid=7aed08&_nc_ohc=HqtJfa6sw1UAX8D5s-_&_nc_ht=scontent-bom1-2.xx&oh=a9e46c67eabb0b3f93c4cf55aae3ea59&oe=5EBE9A26',
    'https://scontent-bom1-2.xx.fbcdn.net/v/t31.0-8/411892_249853408461869_1718289895_o.jpg?_nc_cat=107&_nc_sid=05277f&_nc_ohc=0c3hSebFaNUAX-mbNyV&_nc_ht=scontent-bom1-2.xx&oh=a970ea7779c1f7de4f2f7f6ae7cb9f71&oe=5EBF482B'
  ];
  List<String> facebookLink = [
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
                          backgroundImage: NetworkImage(link[index]),
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
