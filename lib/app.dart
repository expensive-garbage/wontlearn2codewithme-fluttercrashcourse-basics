import 'package:flutter/material.dart';
import 'package:lesson01/location_list.dart';
import 'package:lesson01/mocks/mock_location.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final mockLocations = MockLocation.fetchAll();
    return MaterialApp(home: LocationList(locations: mockLocations));
  }
}
