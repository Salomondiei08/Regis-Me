import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'add_new_prospect_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static const _position = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  static const _originPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  // static final _destnPosition =
  //     CameraPosition(target: _origin.position, zoom: 14.5, tilt: 500);
  Completer<GoogleMapController> _googleMapController = Completer();

  Marker _origin = Marker(markerId: MarkerId('a'));
  Marker _destination = Marker(markerId: MarkerId('a'));

  void getLocation() async {
    // LocationPermission permission = await Geolocator.checkPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    print(position);
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: const Text('Map Screen'),
        actions: [
          if (_origin.markerId != MarkerId(''))
            TextButton(
              onPressed: _goToInitialCameraPosition,
              // () => _googleMapController.animateCamera(
              //   CameraUpdate.newCameraPosition(
              //     CameraPosition(
              //         target: _origin.position, zoom: 14.5, tilt: 500),
              //   ),
              // ),
              style: TextButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600)),
              child: const Text(
                'ORIGIN',
                style: TextStyle(color: Colors.white),
              ),
            ),
          if (_origin.markerId != MarkerId(''))
            TextButton(
              onPressed: _goToInitialCameraPosition,
              // () => _googleMapController.animateCamera(
              //   CameraUpdate.newCameraPosition(
              //     CameraPosition(
              //         target: _origin.position, zoom: 14.5, tilt: 500),
              //   ),),

              style: TextButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600)),
              child: const Text(
                'DEST',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) =>
            _googleMapController.complete(controller),
        markers: {
          if (_origin.position != const LatLng(0.0, 0.0)) _origin,
          if (_destination.position != const LatLng(0.0, 0.0)) _destination,
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: _goToInitialCameraPosition,
        // _googleMapController.animateCamera(
        //   CameraUpdate.newCameraPosition(_initialCameraPosition),

        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    if (_origin.position == const LatLng(0.0, 0.0) ||
        (_origin.position != const LatLng(0.0, 0.0) &&
            _destination.position != const LatLng(0.0, 0.0))) {
      // if (_origin.markerId == MarkerId('') ||
      //     (_origin.markerId != MarkerId('') &&
      //         _destination.markerId != MarkerId(''))) {
      setState(
        () {
          _origin = Marker(
            markerId: const MarkerId('Origin'),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos,
          );
          //  _destination.position = const LatLng(0.0, 0.0);
          //   _destination.markerId = MarkerId('');
        },
      );
    } else {
      setState(
        () {
          _origin = Marker(
            markerId: const MarkerId('Destination'),
            infoWindow: const InfoWindow(title: 'Destinaion'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: pos,
          );
        },
      );
    }
  }

  Future<void> _goToInitialCameraPosition() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position));
  }

  Future<void> _originCameraPostion() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position));
  }
}

// }
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   State<MapScreen> createState() => MapScreenState();
// }

// class MapScreenState extends State<MapScreen> {
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
