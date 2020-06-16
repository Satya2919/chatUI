import 'package:covid/widgets/custom_app_bar.dart';
import 'package:covid/widgets/navbar.dart';
import 'package:flutter/material.dart';

class callscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(),
    );
  }
}
