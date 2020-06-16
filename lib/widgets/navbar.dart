import 'package:covid/screens/callscreen.dart';
import 'package:covid/screens/cnine.dart';
import 'package:covid/screens/home_screen.dart';
import 'package:covid/screens/profile.dart';
import 'package:covid/screens/screens.dart';
import 'package:covid/screens/ultrareport.dart';
import 'package:flutter/material.dart';
import 'package:covid/config/palette.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(

                color: Palette.primaryColor.withOpacity(0.7),
                image: DecorationImage(
                    image: AssetImage('assets/images/muser.png'))),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
               Navigator.push(context, MaterialPageRoute(builder: (context) => profile()))
            },
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Recent call screen'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => callscreen()))},
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Ultrafiltration report'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => StatsScreen()))},
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Createnine report'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => StatsScreen()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
