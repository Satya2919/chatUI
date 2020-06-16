import 'package:covid/config/palette.dart';
import 'package:covid/widgets/custom_app_bar.dart';
import 'package:covid/widgets/navbar.dart';
import 'package:flutter/material.dart';
import '../data/calls.dart';

class callscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
         backgroundColor: Palette.primaryColor.withOpacity(0.7),
        title: Text('Recent Calls',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),),
      ),
      body: Calls(),
    );
  }
}

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callData.length,
      itemBuilder: (context, i) =>
          Column(
            children: <Widget>[
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  maxRadius: 25,
                  backgroundImage: NetworkImage(callData[i].imageUrl),
                ),
                title: Text(
                    callData[i].name,
                    style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.purple[300])
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                      callData[i].time,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0
                      )
                  ),
                ),
                trailing: choose(i),
                selected: true,
              )
            ],
          ),
    );
  }
}
Icon choose(int i){
  if(i%2==0){
    return Icon(Icons.call_made,color: Colors.green);
  }else{
    return Icon(Icons.call_received, color: Colors.red,);
  }
}