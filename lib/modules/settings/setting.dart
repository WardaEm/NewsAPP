import 'package:flutter/material.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting',style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}