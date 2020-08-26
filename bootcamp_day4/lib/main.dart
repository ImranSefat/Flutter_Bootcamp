import 'dart:convert';

import 'package:bootcamp_day4/Loading.dart';
import 'package:bootcamp_day4/Model/TechCrunchNewsModel.dart';
import 'package:bootcamp_day4/NewsDetails.dart';
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
  List<Articles> data = List<Articles>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News App"),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return spinkit;
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: MediaQuery.of(context).size.height - 100,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetails(
                                article: data[index],
                              ),
                            ),
                          );
                        },
                        child: getNews(data[index]),
                      );
                    },
                  ),
                );
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

      // state management
      data = [];
      // this is the main response from the json
      Map<String, dynamic> map = jsonDecode(response.body);
      // this is the articles data from the json response
      List<dynamic> articles = map["articles"];
      for (int i = 0; i < articles.length; i++) {
        Articles a = Articles.fromJson(articles[i]);
        data.add(a);
        // print(a.title);
      }
    } catch (e) {}
  }

  getNews(Articles article) {
    String tempTitle = article.title.substring(0, 25) + "......";
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: Opacity(
              opacity: 0.7,
              child: Hero(
                tag: article.title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 40,
            child: Text(
              tempTitle,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Text(
              article.author,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Text(
              article.publishedAt,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
