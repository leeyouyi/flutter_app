import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test flutter app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 11, 5)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var list = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _getApi() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    // print(responseData);
    setState(() {
      list = responseData;
    });
    print(list);
    print('list');
  }

  @override
  Widget build(BuildContext context) {
    //  var appState = context.watch<MyHomePageState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: [
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          // ignore: unused_local_variable
          for (var li in list)
            ListTile(
              // leading: Icon(Icons.favorite),
              title: Text(li.toString()),
            ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _getApi,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-form
    );
  }
}
