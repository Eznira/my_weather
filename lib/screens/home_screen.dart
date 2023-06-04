import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double lat = 0;
  double long = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updatePosition();
  }

  void _updatePosition() async {
    var location = await Location.create();
    setState(() {
      lat = location.lat;
      long = location.long;
      print(lat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your current longitude is:',
            ),
            Text(
              '$long',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Your current latitude is:',
            ),
            Text(
              '$lat',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updatePosition,
        tooltip: 'Get Location',
        child: const Icon(Icons.add),
      ),
    );
  }
}
