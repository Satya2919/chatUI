import 'package:covid/screens/timer.dart';
import 'package:covid/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:covid/config/palette.dart';
import 'package:covid/config/styles.dart';
import 'package:covid/data/data.dart';
import 'package:covid/widgets/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildYourOwnTest(screenHeight),
          _buildPreventionTips(screenHeight),
        ],
      ),

    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Good Afternoon, \nSatyam',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'How would you like us to \nhelp today?',
                  style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'We are always available to help you. Please \ninteract with us via chatbot or call',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'ChatBot',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Precautions',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: prevention
                  .map((e) => Column(
                  children: <Widget>[
                    Image.asset(
                      e.keys.first,
                      height: screenHeight * 0.12,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      e.values.first,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              padding: const EdgeInsets.all(10.0),
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFAD9FE4), Palette.primaryColor],
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('assets/images/own_test.png'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Your next session is\n scheduled in :',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        '01:00:23 hr',
                        style: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TimerApp()));
            },
          )
        ],
      )
    );
  }
}
