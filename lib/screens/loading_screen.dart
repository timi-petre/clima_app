import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? text;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      text = position.toString();
    });
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  //Get the current location
                  getLocation();
                },
                child: Text('Get Location'),
              ),
              Text(text ?? 'No location yet'),
            ],
          ),
        ),
      ),
    );
  }
}
