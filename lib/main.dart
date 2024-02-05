import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/provider/signature_provider.dart';
import 'package:gmail_setting_ui/screen/setting_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignatureProvider>(create: (context) => SignatureProvider()),
      ],
      child: MaterialApp(
        
        home: SettingPage(),
      ),
    );
  }
}
