import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';

  LocationModel() {
    getPosition();
  }

  getPosition() async {
    try {
      Position position = await _currentPosition();
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;

    bool active = await Geolocator.isLocationServiceEnabled();
    if (!active) {
      return Future.error("Por favor, habilite a localização!");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Você precisa autorizar o acesso á localização!");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Você precisa autorizar o acesso á localização!");
    }
    return await Geolocator.getCurrentPosition();
  }
}
