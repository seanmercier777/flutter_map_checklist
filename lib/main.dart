import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Map Checklist',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: MyHomePage(title: 'Travel Map Checklist'),
    );
  }
}

//This works now
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );

    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Maps Sample App'),
    //       backgroundColor: Colors.green[700],
    //     ),
    //     body: GoogleMap(
    //       onMapCreated: _onMapCreated,
    //       initialCameraPosition: CameraPosition(
    //         target: _center,
    //         zoom: 11.0,
    //       ),
    //     ),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _addPlace() {
    setState(() {
      _counter++;
    });

    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Add Place'),
          ),
          body: Container(
              child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(15),
                  child: Column(children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: 'Place')),
                    FlatButton(
                        onPressed: null,
                        color: Colors.green,
                        child: Text("Search")),
                  ])),
              Container(height: 400, child: MapPage()),
              Container(
                  padding: EdgeInsets.all(30),
                  child: FlatButton(onPressed: _addValue, child: Text("Save")))
            ],
          )));
    }));
  }


  void _addValue() {

    if (_suggestions.contains('12')) {
      _suggestions.remove('12');
    } else {
      _suggestions.add('12');
    }


    setState(() {});
  }

  //
  // void _addValue() {
  //
  //   _suggestions.add('12');
  // }

  void _navSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Places'),
        ),
        body: ListView(children: []),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _navSaved)],
      ),
      body: _buildSuggestions(),
      // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: _addPlace,
        tooltip: 'Add Place',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final _suggestions = ["Paris", "London"];

  Widget _buildSuggestions() {
    return ListView.builder(
      itemCount: _suggestions.length + 1,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider();
        }

        final index = i ~/ 2;

        return ListTile(
          title: Text(_suggestions[index]),
        );
      },
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       // Here we take the value from the MyHomePage object that was created by
//       // the App.build method, and use it to set our appbar title.
//       title: Text(widget.title),
//       actions: [IconButton(icon: Icon(Icons.list), onPressed: _navSaved)],
//     ),
//     body: Center(
//       // Center is a layout widget. It takes a single child and positions it
//       // in the middle of the parent.
//       child: Column(
//         // horizontal).
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//         ],
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods.
//   );
// }

}
