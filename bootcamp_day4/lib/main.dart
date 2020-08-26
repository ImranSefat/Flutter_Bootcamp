import 'dart:convert';

import 'package:bootcamp_day4/Model/TechCrunchNewsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text("News App"),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text("DATA RECEIVED");
              }
            },
          ),
        ],
      ),
    );
  }

  getData() async {
    try {
      // the next line is performing a htttp get request to the API
      http.Response response = await http.get(
          "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f4380cd45ee74692b4039fe5e3b33f97");

      var data = List<Articles>();
      // state management
      data = [];
      // this is the main response from the json
      Map<String, dynamic> map = jsonDecode(response.body);
      // this is the articles data from the json response
      List<dynamic> articles = map["articles"];
      for (int i = 0; i < articles.length; i++) {
        Articles a = Articles.fromJson(articles[i]);
        print(a.title);
      }
    } catch (e) {}
  }
}
