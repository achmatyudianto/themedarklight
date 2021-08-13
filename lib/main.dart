import 'package:darkmode/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ("Theme dark mode"),
      theme: themeProvider.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Theme"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Themes Dark & Ligth"),
              SizedBox(height: 15),
              CupertinoSwitch(
                value: themeProvider.myTheme != MyTheme.ligth ? true : false,
                onChanged: (value) {
                  value
                      ? themeProvider.setTheme(MyTheme.dark)
                      : themeProvider.setTheme(MyTheme.ligth);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
