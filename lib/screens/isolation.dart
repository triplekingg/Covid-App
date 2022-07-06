import 'package:covidapp/widgets/DaysLeft.dart';
import 'package:covidapp/widgets/duration.dart';
import 'package:covidapp/widgets/durationText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IsolationPage extends StatelessWidget {
  const IsolationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 249, 255),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 242, 249, 255),
        title: Text(
          "                14 days\n Self-isolation countdown",
          style: GoogleFonts.archivoBlack(
              color: Color.fromARGB(255, 154, 155, 159)),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () => print("Debug"),
          icon: const Icon(Icons.keyboard_arrow_left),
          color: Color.fromARGB(255, 12, 134, 246),
          iconSize: 40,
        ),
        actions: [
          IconButton(
            onPressed: () => print("Debug"),
            icon: const Icon(Icons.menu),
            color: Color.fromARGB(255, 12, 134, 246),
            iconSize: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 10),
                  child: Daysleft(12),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          DurationText('Until'),
                          DurationTime('12/02/2022'),
                        ],
                      ),
                      Row(
                        children: [
                          DurationText('At'),
                          DurationTime('12:00pm'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}