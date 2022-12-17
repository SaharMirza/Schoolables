import 'package:flutter/material.dart';
import 'package:flutterdemo/utils.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart' as loc;

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  geo.Position? _position;
  loc.Location location = new loc.Location();
  loc.LocationData? _locationData;

  void _getCurrentLocation() async {
    geo.Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }

  Future<geo.Position> _determinePosition() async {
    geo.LocationPermission permission;

    permission = await geo.Geolocator.checkPermission();

    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }
    _locationData = await location.getLocation();
    print(_locationData);
    return await geo.Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.best);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeaderBar(title: "Choose Location"),
          const SizedBox(
            height: 20,
          ),
          const Text("Geolocator method"),
          const SizedBox(
            height: 20,
          ),
          _position != null
              ? Padding(
                  padding: const EdgeInsets.all(32.0),
                  child:  Text('Current Location: ' + _position.toString()),
                )
              : const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('No Location Data'),
                ),
          const Text("Location method"),
          _locationData != null
              ? Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text('Current Location: ' + _locationData.toString()),
                )
              : const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('No Location Data'),
                ),
        ],
      ),
    );
  }
}
