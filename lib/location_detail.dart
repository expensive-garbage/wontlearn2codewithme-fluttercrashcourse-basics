import 'package:flutter/material.dart';
import 'package:lesson01/mocks/mock_location.dart';
import 'package:lesson01/styles.dart';

import 'models/location.dart';

class LocationDetail extends StatelessWidget {
  final int locationId;
  const LocationDetail({super.key, required this.locationId});

  @override
  Widget build(BuildContext context) {
    Location location = MockLocation.fetch(locationId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          location.name,
          style: Styles.navBarTitle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, location),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = List<Widget>.empty(growable: true);
    result.add(_bannerImage(location.url, 170));
    result.addAll(_renderFacts(location));
    return result;
  }

  List<Widget> _renderFacts(Location location) {
    final result = List<Widget>.empty(growable: true);
    for (var i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: Styles.headerLarge,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
      child: Text(text),
    );
  }

  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(
        url,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
