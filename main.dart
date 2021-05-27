import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random _random = Random();
  Color color = Color(0xFFFFFFFF);

  Color changeColor() {
    setState(() {
      color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextDouble(),
      );
    });
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(200, 255, 200, 1.0),
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: GestureDetector(
            onTap: () {
              changeColor();
            },
            child: Scaffold(
              body: Center(
                child: InkWell(child: Text("Hey There"), onTap: changeColor),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: changeColor,
              ),
              backgroundColor: changeColor(),
            )));
  }
}
