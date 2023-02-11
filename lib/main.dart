import 'package:flutter/material.dart';
import 'package:lesson01/location_list.dart';
import 'package:lesson01/mocks/mock_location.dart';
import 'models/location.dart';

void main() {
  final List<Location> mock = MockLocation.fetchAll();
  return runApp(
    MaterialApp(
      home: LocationList(
        locations: mock,
      ),
    ),
  );
}
