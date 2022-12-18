import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/location_entity.dart';
import 'package:flutterdemo/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDemo extends StatefulWidget {
  final Location selectedLocation;
  const MapDemo({Key? key, required this.selectedLocation}) : super(key: key);

  @override
  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> with AutomaticKeepAliveClientMixin {

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {

    setState(() {
      _markers.clear();
      for (final office in widget.selectedLocation.areas) {
        print(widget.selectedLocation.areaName);
        final marker = Marker(
          markerId: MarkerId(office.id),
          position: LatLng(office.coords.lat, office.coords.lng),
          infoWindow: InfoWindow(
            title: office.name,
          ),
        );
        _markers[office.id] = marker;
        print(widget.selectedLocation.areaName);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: const Color(0xFFFFFDF4),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderBar(title: "Products nearby ${widget.selectedLocation.areaName}",
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.selectedLocation.areaLocation.lat, widget.selectedLocation.areaLocation.lng),
                  //target: LatLng( 24.81035940772831,67.05361192479758),
                  zoom: 13,
                ),
                markers: _markers.values.toSet(),
              ),
            ),
          ],
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
