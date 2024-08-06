import 'package:flutter/material.dart';
import 'package:form/api/sheets/form_sheets_api.dart';
import 'package:form/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FormSheetsApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Google Sheets API';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
