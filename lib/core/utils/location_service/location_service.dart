import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_flower_app/core/utils/l10n/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@singleton
class LocationService {
  final Location _locationService = Location();

  static const int locationUpdateIntervalMs = 5000;
  static const double locationDistanceFilterMeters = 10.0;

  ValueNotifier<String> locationMessage = ValueNotifier(
    LocaleKeys.FetchingYourLocation.tr(),
  );
  StreamSubscription<LocationData>? locationSubscription;

  Future<bool> _checkForLocationPermission() async {
    var permissionGranted = await _locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      locationMessage.value = LocaleKeys.RequestingPermission.tr();
      permissionGranted = await _locationService.requestPermission();
    }
    return permissionGranted == PermissionStatus.granted;
  }

  Future<bool> _checkForLocationService() async {
    bool serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      locationMessage.value = LocaleKeys.RequestingPermission.tr();
      serviceEnabled = await _locationService.requestService();
    }
    return serviceEnabled;
  }

  Future<void> _updateLocation(LocationData locationData) async {
    try {
      locationMessage.value = LocaleKeys.FetchingYourLocation.tr();

      List<geocoding.Placemark> placemarks = await geocoding
          .placemarkFromCoordinates(
            locationData.latitude!,
            locationData.longitude!,
          );

      if (placemarks.isNotEmpty) {
        geocoding.Placemark place = placemarks.first;
        locationMessage.value =
            "${place.street}, ${place.locality}, ${place.country}";
      } else {
        locationMessage.value =
            "${LocaleKeys.Lat.tr()}: ${locationData.latitude}, ${LocaleKeys.Long.tr()}: ${locationData.longitude}";
      }
    } catch (e) {
      locationMessage.value = "${LocaleKeys.Error.tr()}: ${e.toString()}";
    }
  }

  void dispose() {
    locationSubscription?.cancel();
  }

  Future<void> getLocation() async {
    // Check initial service status
    bool serviceEnabled = await _checkForLocationService();
    if (!serviceEnabled) {
      locationMessage.value = LocaleKeys.PleaseEnableLocation.tr();
      return;
    }

    bool permissionGranted = await _checkForLocationPermission();
    if (!permissionGranted) {
      locationMessage.value = LocaleKeys.PleaseEnableLocation.tr();
      return;
    }

    // Configure location settings
    await _locationService.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: locationUpdateIntervalMs,
      distanceFilter: locationDistanceFilterMeters,
    );

    // Cancel any existing subscription
    await locationSubscription?.cancel();

    locationSubscription = _locationService.onLocationChanged.listen(
      (LocationData currentLocation) async {
        await _updateLocation(currentLocation);
      },
      onError: (e) {
        locationMessage.value = "${LocaleKeys.Error.tr()}: ${e.toString()}";
      },
    );
  }
}
