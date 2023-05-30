import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 23, 11, 5)),
      //   useMaterial3: true,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list = List<int>.filled(5, 0);
  // static const data = [
  //   {'text': '111'},
  //   {'text': '222'},
  //   {'text': '333'},
  // ];
  var result = [];

  @override
  void initState() {
    super.initState();
    _getApi();
  }

  void _getApi() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    print(responseData);
    setState(() {
      result = responseData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Flutter layout demo'), toolbarHeight: 40),
      body: ListView(
        // shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: [
              Container(
                  color: Colors.amber[50],
                  height: 200,
                  child: Text(
                      'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaaaaaaaaaaaaaaaaaaaaaaaaaa')),
              // Flexible(child: TextItem(data: result))
            ],
          ),
          Flexible(child: TextItem(data: result)),

          // Flexible(child: TextItem(data: result))
          // Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: TextItem(data: result)),
          // for (var i in list)
          //   Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: TextItem(data: data)),
        ],
      ),
    );
  }
}

const textStyle = TextStyle(
  color: Colors.cyan,
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.data});
  final List data;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Icon(Icons.add),
        // ElevatedButton.icon(
        //   onPressed: () {
        //     print('object');
        //   },
        //   icon: Icon(Icons.abc),
        //   label: Text('Like'),
        // ),
        for (var item in data)
          Row(
            children: [
              Expanded(
                child: Container(
                    color: Colors.black,
                    height: 100,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () => print('xxxx'),
                          child: Icon(Icons.add),
                        ),
                        Icon(Icons.add),
                        ElevatedButton.icon(
                          onPressed: () {
                            print('object');
                          },
                          icon: Icon(Icons.add),
                          label: Text('xxx'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          child: Text(
                            item['title'].toString(),
                            style: textStyle,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
      ],
    );
  }
}
