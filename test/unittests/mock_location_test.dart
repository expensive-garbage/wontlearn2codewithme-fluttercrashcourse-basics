import 'package:flutter_test/flutter_test.dart';
import 'package:lesson01/mocks/mock_location.dart';

void main() {
  test('test fetchAny', () {
    final mockLocation = MockLocation.fetchAny();
    expect(mockLocation, isNotNull);
    expect(mockLocation.name, isNotEmpty);
    expect(mockLocation.facts, isNotEmpty);
    expect(mockLocation.url, isNotEmpty);
  });

  test('test fetchAll', () {
    final mockLocations = MockLocation.fetchAll();
    expect(mockLocations, isNotNull);
    expect(mockLocations, isNotEmpty);
  });
}
