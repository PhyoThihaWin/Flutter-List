import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(primarySwatch: Colors.green),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // new line
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont =
      const TextStyle(fontSize: 20, color: Colors.green);

  String msg = "No Title";

  Widget _buildSuggestions() {
    return ListView.builder(

        //padding: const EdgeInsets.all(16),
        // The itemBuilder callback is called once per suggested
        // word pairing, and places each suggestion into a ListTile
        // row. For even rows, the function adds a ListTile row for
        // the word pairing. For odd rows, the function adds a
        // Divider widget to visually separate the entries. Note that
        // the divider may be difficult to see on smaller devices.
        itemBuilder: (BuildContext _context, int i) {
      // Add a one-pixel-high divider widget before each row
      // in the ListView.
//          if (i.isOdd) {
//            return Divider();
//          }

      // The syntax "i ~/ 2" divides i by 2 and returns an
      // integer result.
      // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
      // This calculates the actual number of word pairings
      // in the ListView,minus the divider widgets.
      // final int index = i ~/ 2;
      // If you've reached the end of the available word
      // pairings...
//      if (index >= _suggestions.length) {
//        // ...then generate 10 more and add them to the
//        // suggestions list.
//        _suggestions.addAll(generateWordPairs().take(10));
//      }

      _suggestions.addAll(generateWordPairs().take(10));
      return _buildRow(_suggestions[i]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return Card(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.android,
              color: Colors.black,
            ),
          ],
        ),
        subtitle: Text("Test flutter"),
        title: Text(
          pair.first.toUpperCase()+" - "+pair.second,
          style: _biggerFont,
        ),
//        onTap: () => _flutterToast(pair.asPascalCase),
        onTap: () {
          setState(() {
            msg = pair.asPascalCase;
          });
         // _showDialog(msg, msg);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute()));
        },
      ),
      elevation: 2,
    );
  }

  void _flutterToast(String msg) {
    /* Fluttertoast.showToast(
        msg: "This is Toast messaget",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1);*/

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 300),
        content: Text(msg),
        action: SnackBarAction(
            label: 'UNDO',
            onPressed: _scaffoldKey.currentState.hideCurrentSnackBar),
      ),
    );
  }

  // user defined function
  void _showDialog(String msg1, String msg2) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(msg1),
          content: new Text(msg2),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _flutterToast("Hello Flutter"),
        tooltip: 'Increment',
        child: Icon(Icons.person_add),
        backgroundColor: Colors.deepOrange,
      ),
    ); // ... to here.
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(

//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {

//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(

//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
