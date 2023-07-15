import 'dart:async';
import 'dart:io';
import 'package:bootcamp_starter/features/auth/ShPreferences.dart';
import 'package:bootcamp_starter/network/api_base_helper.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';


class LocationService{

  void updatePosition({required int userId}) async {
    try {
      determinePosition().then((position) {
        updateUserLocation(userId, position.longitude, position.latitude);
      });
    } catch (e) {
      print('$e test');
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


  void updateUserLocation(int userId, double long, double lat) async {
    String? token = ShPreferences.getToken();
    String updateUserLocationUrl ="http://172.16.6.87:8000/api/update";

    var url = Uri.parse('$updateUserLocationUrl/$userId');
    print('Log url  $url ');
    print('Log token $token ');
    var response = await http.put(
      url,
      body: {'long': '$long', 'lat': '$lat'},
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        HttpHeaders.authorizationHeader:
        'Bearer $token',
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}