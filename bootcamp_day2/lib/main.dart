import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              top: 10,
            ),
            child: Text(
              "Input",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10.0,
              top: 10,
              bottom: 20,
            ),
            child: Text(
              "Result",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 80,
                child: FlatButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: Text("1"),
                ),
              ),
              Container(
                height: 80,
                child: FlatButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: Text("2"),
                ),
              ),
              Container(
                height: 80,
                child: FlatButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: Text("3"),
                ),
              ),
              Container(
                height: 80,
                child: FlatButton(
                  color: Colors.amber,
                  onPressed: () {},
                  child: Text("*"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
