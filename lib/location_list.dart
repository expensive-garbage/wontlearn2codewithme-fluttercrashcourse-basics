import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson01/location_detail.dart';
import 'package:lesson01/styles.dart';

import 'models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;
  const LocationList({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Locations',
          style: Styles.navBarTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: _listTileBuilder,
        itemCount: locations.length,
      ),
    );
  }

  Widget _listTileBuilder(BuildContext context, int index) {
    return ListTile(
      leading: _itemThumbnail(locations[index]),
      title: _itemTitle(locations[index]),
      contentPadding: const EdgeInsets.all(10),
      onTap: () => _navigationToLocationDetail(context, index),
    );
  }

  void _navigationToLocationDetail(BuildContext context, int locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetail(
          locationId: locationId,
        ),
      ),
    );
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 100),
      child: Image.network(location.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
      style: Styles.textDefault,
    );
  }
}
