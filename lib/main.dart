import 'package:flutter/material.dart';

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
  static const data = [
    {'text': '111'},
    {'text': '222'},
    {'text': '333'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Flutter layout demo'), toolbarHeight: 40),
      body: Center(
        child: ListView(
          children: <Widget>[
            // ignore: unused_local_variable
            for (var i in list)
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextItem(data: data)),
          ],
        ),
      ),
    );
  }
}

const textStyle = TextStyle(
  color: Colors.cyan,
  fontSize: 22.0,
  fontWeight: FontWeight.w600,
);

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.data});
  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.add),
        ElevatedButton.icon(
          onPressed: () {
            print('object');
          },
          icon: Icon(Icons.abc),
          label: Text('Like'),
        ),
        for (var item in data)
          Text(
            item['text'].toString(),
            style: textStyle,
          ),
      ],
    );
  }
}
