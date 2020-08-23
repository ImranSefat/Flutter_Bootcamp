import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String name = "Bootcamp!";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Appbar"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 30, letterSpacing: 2, color: Colors.blue),
                  ),
                ),
                Text("Line 2 "),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text("Line 3 "),
                ),
                FlatButton(
                  onPressed: () {
                    print('Tapped');
                    setState(() {
                      name = "Something";
                    });
                  },
                  child: Text("Tap Here!"),
                  color: Colors.red,
                )
              ],
            ),
          )),
    );
  }
}
