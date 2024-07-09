import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // we call this to reset the state of the widget and we must call it to reset the build function.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      // the scaffold widget is the core of the entire app allowing ui elements like navigation menus
      appBar: AppBar(
        // the bar displayed at the top of the page
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the theme value from MyHomePage and use it to set a color based on our theme.
        title: Text(widget.title),
      ),
      body: Center(
        // Center takes a single child and positions it in the middle of the parent.
        child: Padding(
          // Padding give space around widgets.
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // Column takes child widgets and arranges them vertically.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const MyCustomWidget(text: 'Here is a box within a column'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Alignment for the boxes in the row.
                children: [
                  Expanded(child: MyCustomWidget(text: "here's a row")),
                  Expanded(child: MyCustomWidget(text: "And the right side!")),
                  // Expanded allows the widget to take up the entire space given even if the size changes.
                ],
              ),
              const SizedBox(height: 50), // An invisible box to add spacing.
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
