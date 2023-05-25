import 'package:flutter/material.dart';

import 'page/detailScreen.dart';
import 'page/homeScreen.dart';
// import 'widget/textSection.dart';
// import 'widget/titleSection.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).primaryColor;

    // Widget buttonSection = Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     _buildButtonColumn(color, Icons.call, 'CALL'),
    //     _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    //     _buildButtonColumn(color, Icons.share, 'SHARE'),
    //   ],
    // );

    return MaterialApp(
      // title: 'Flutter layout demo',
      // initialRoute: '/',
      // routes: {
      //   '/':(context) => const HomeScreen(),
      //   '/details':(context) => const DetailScreen().
      // },
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/detail': (context) => const DetailScreen(),
      },
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Flutter layout demo'),
      //   ),
      //   // body: const Center(
      //   //   child: Text('Hello World'),
      //   // ),
      //   body: ListView(
      //     children: [
      //       Image.asset(
      //         'assets/lake.jpg',
      //         width: 600,
      //         height: 240,
      //         fit: BoxFit.cover,
      //       ),
      //       titleSection,
      //       buttonSection,
      //       textSection
      //     ],
      //   ),
      // ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}



// TapboxA manages its own state.

// //------------------------- TapboxA ----------------------------------

// class TapboxA extends StatefulWidget {
//   const TapboxA({super.key});

//   @override
//   State<TapboxA> createState() => _TapboxAState();
// }

// class _TapboxAState extends State<TapboxA> {
//   bool _active = false;

//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color:
//               _active ? Color.fromARGB(255, 150, 120, 125) : Colors.grey[600],
//         ),
//         child: Center(
//           child: Text(
//             _active ? 'Active' : 'Inactive',
//             style: const TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //------------------------- MyApp ----------------------------------

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         body: Center(
//           child: ParentWidget(),
//         ),
//       ),
//     );
//   }
// }

// //------------------------ ParentWidget --------------------------------

// class ParentWidget extends StatefulWidget {
//   const ParentWidget({super.key});

//   @override
//   State<ParentWidget> createState() => _ParentWidgetState();
// }

// class _ParentWidgetState extends State<ParentWidget> {
//   bool _active = false;

//   void _handleTapboxChanged(bool newValue) {
//     setState(() {
//       _active = newValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: TapboxC(
//         active: _active,
//         onChanged: _handleTapboxChanged,
//       ),
//     );
//   }
// }

// //------------------------- TapboxB ----------------------------------

// class TapboxB extends StatelessWidget {
//   const TapboxB({
//     super.key,
//     this.active = false,
//     required this.onChanged,
//   });

//   final bool active;
//   final ValueChanged<bool> onChanged;

//   void _handleTap() {
//     onChanged(!active);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//         child: Center(
//           child: Text(
//             active ? '!Active' : '!Inactive',
//             style: const TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //----------------------------- TapboxC ------------------------------

// class TapboxC extends StatefulWidget {
//   const TapboxC({
//     super.key,
//     this.active = false,
//     required this.onChanged,
//   });

//   final bool active;
//   final ValueChanged<bool> onChanged;

//   @override
//   State<TapboxC> createState() => _TapboxCState();
// }

// class _TapboxCState extends State<TapboxC> {
//   bool _highlight = false;

//   void _handleTapDown(TapDownDetails details) {
//     setState(() {
//       _highlight = true;
//     });
//   }

//   void _handleTapUp(TapUpDetails details) {
//     setState(() {
//       _highlight = false;
//     });
//   }

//   void _handleTapCancel() {
//     setState(() {
//       _highlight = false;
//     });
//   }

//   void _handleTap() {
//     widget.onChanged(!widget.active);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This example adds a green border on tap down.
//     // On tap up, the square changes to the opposite state.
//     return GestureDetector(
//       onTapDown: _handleTapDown, // Handle the tap events in the order that
//       onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
//       onTap: _handleTap,
//       onTapCancel: _handleTapCancel,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
//           border: _highlight
//               ? Border.all(
//                   color: Colors.teal[700]!,
//                   width: 10.0,
//                 )
//               : null,
//         ),
//         child: Center(
//           child: Text(widget.active ? 'Active11' : 'Inactive22',
//               style: const TextStyle(fontSize: 32.0, color: Colors.white)),
//         ),
//       ),
//     );
//   }
// }
