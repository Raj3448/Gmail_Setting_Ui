import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/shared/appbar.dart';
import 'package:gmail_setting_ui/shared/body.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SizedBox(
          height: screenSize.height * 0.8,
          width: screenSize.width * 0.8,
          child: const Column(
            children: [
              MyAppbar(title: "Settings"),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}
