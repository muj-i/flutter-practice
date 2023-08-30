import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isLoading = true;
 GoogleMapController? _mapController;
  LatLng currentLocation = const LatLng(37.334920012221, -122.00899116870059);
  StreamSubscription? _locationSubscription;
  List<LatLng> polylinePoints = [];

  @override
  void initState() {
    initialize();
    getCurrentLocation();

    super.initState();
  }

  void initialize() {
    Location.instance
        .changeSettings(interval: 20000, accuracy: LocationAccuracy.high);
  }

  void getCurrentLocation() async {
    await Location.instance.requestPermission();
    try {
      LocationData? locationData;
      //await Location.instance.requestPermission();
      locationData = await Location.instance.getLocation();
      realTimeLocation();
      //await Future.delayed(const Duration(seconds: 1));
      setState(() {
        currentLocation = LatLng(
          locationData!.latitude!,
          locationData.longitude!,
        );
        isLoading = false;
      });
      log("Current location: $locationData");

      _mapController?.animateCamera(
        CameraUpdate.newLatLng(currentLocation),
      );
    } catch (e) {
      if (mounted) {
        _showDialog(context);
      }
      log("Error getting location: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void realTimeLocation() {
    _locationSubscription =
        Location.instance.onLocationChanged.listen((realTimeLocation) {
      setState(() {
        currentLocation = LatLng(
          realTimeLocation.latitude!,
          realTimeLocation.longitude!,
        );
        polylinePoints.add(currentLocation);
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(currentLocation),
      );
      log('Real time: $realTimeLocation');
    });
  }

  void realTimeLocationSubscription() {
    _locationSubscription?.cancel();
  }

  Set<Polyline> createPolylines() {
    final polyline = Polyline(
      polylineId: const PolylineId('current_location_PL'),
      color: Colors.deepPurple.shade400,
      points: polylinePoints,
    );

    return {polyline};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        title: const Text(
          'Real-Time Location Tracker',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            //myLocationEnabled: true,
            //myLocationButtonEnabled: true,

            markers: <Marker>{
              Marker(
                markerId: const MarkerId('current_location'),
                position: currentLocation,
                infoWindow: InfoWindow(
                    title: 'My current location', snippet: '$currentLocation'),
                draggable: true,
              ),
            },
            polylines: createPolylines(),
            circles: <Circle>{
              Circle(
                  circleId: const CircleId('current_location_CI'),
                  radius: 3,
                  center: currentLocation,
                  strokeColor: Colors.deepPurple.shade400,
                  strokeWidth: 3,
                  fillColor: Colors.deepPurple.withAlpha(50)),
            },
            initialCameraPosition: CameraPosition(
              zoom: 17,
              //bearing: 50,
              target: currentLocation,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 260,
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      getCurrentLocation();
                    },
                    child: const Icon(Icons.my_location_rounded),
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      realTimeLocation();
                    },
                    child: const Icon(Icons.location_on_sharp),
                  ),
                  FloatingActionButton(
                    mini: true,
                    onPressed: () {
                      realTimeLocationSubscription();
                    },
                    child: const Icon(Icons.location_off_rounded),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
          'Locattion permission denied\nPlease turn on location permissions',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
