// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title; // this class holds the title 
  // Fields in a Widget subclass are always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // we call this to reset the state of the widget and we must call it to reset the build function.
  //     _counter++;
  //   });
  // }

  double scaleSize(BuildContext context)
  {
    return MediaQuery.of(context).size.width * 0.005;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 201, 247),
      // the scaffold widget is the core of the entire app allowing ui elements like navigation menus
      body: mainMenuPage(context),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center mainMenuPage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Character Creator',
            style: TextStyle(
              fontSize: 15 * scaleSize(context),
              decoration: TextDecoration.underline,
              foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 20),
                const Offset(500, 20),
                <Color>[
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20 * scaleSize(context), 5 * scaleSize(context), 20 * scaleSize(context), 1 * scaleSize(context)),
            child: SizedBox(
              child: TextField(
                style: TextStyle(
                  fontSize: 4 * scaleSize(context),
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name here!',
                  labelStyle: TextStyle(
                    fontSize: 4 * scaleSize(context),
                    //background: 
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5 * scaleSize(context),),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 223, 154, 214),
            ),
            onPressed:() => Placeholder(),
            child: Padding(
              padding: EdgeInsets.all(3 * scaleSize(context)),
              child: Text(
                "my text",
                style: TextStyle(
                  fontSize: 4 * scaleSize(context),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  // This is a custom widget built for use in other parts of code.
  const MyCustomWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        // Adjust the padding to control how close the card is from the text.
        child: SizedBox(
          child: Text(text),
        ),
      ),
    );
  }
}
