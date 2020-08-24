import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  String input = "Input";
  String result = "Result";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculate();
          // print("Floating button pressed");
        },
        child: Text(
          "=",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
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
              input,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          result == "Result"
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
          // buttons starts from here

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("7");
                    },
                    child: Text(
                      "7",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("8");
                    },
                    child: Text(
                      "8",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("9");
                    },
                    child: Text(
                      "9",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("+");
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("4");
                    },
                    child: Text(
                      "4",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("5");
                    },
                    child: Text(
                      "5",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("6");
                    },
                    child: Text(
                      "6",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("-");
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("1");
                    },
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("2");
                    },
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("3");
                    },
                    child: Text(
                      "3",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("*");
                    },
                    child: Text(
                      "*",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput(".");
                    },
                    child: Text(
                      ".",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("0");
                    },
                    child: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      setState(() {
                        input = "Input";
                        // result = "Result";
                      });
                      // addToInput("C");
                    },
                    child: Text(
                      "C",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      addToInput("/");
                    },
                    child: Text(
                      "/",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addToInput(String s) {
    setState(() {
      if (input == "Input") {
        input = s;
      } else {
        input += s;
      }
    });
    // print(s);
  }

  calculate() {
    try {
      Parser p = Parser();
      Expression expression = p.parse(input);
      ContextModel cm = ContextModel();
      setState(() {
        double d = expression.evaluate(EvaluationType.REAL, cm);
        result = d.toString();
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
