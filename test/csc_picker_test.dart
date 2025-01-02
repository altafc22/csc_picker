import 'package:flutter_test/flutter_test.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/dropdown_with_search.dart';

void main() {
  group('CSCPicker Widget Tests', () {
    testWidgets('CSCPicker initializes correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CSCPicker(
            onCountryChanged: (value) {},
            onStateChanged: (value) {},
            onCityChanged: (value) {},
          ),
        ),
      ));

      expect(find.byType(CSCPicker), findsOneWidget);
    });

    testWidgets('Shows country dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CSCPicker(
            onCountryChanged: (value) {},
            onStateChanged: (value) {},
            onCityChanged: (value) {},
          ),
        ),
      ));

      expect(find.byType(DropdownWithSearch), findsWidgets);
    });

    testWidgets('Handles disabled state correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CSCPicker(
            showStates: false,
            showCities: false,
            onCountryChanged: (value) {},
            onStateChanged: (value) {},
            onCityChanged: (value) {},
          ),
        ),
      ));

      // Should only find one dropdown when states and cities are disabled
      expect(find.byType(DropdownWithSearch), findsOneWidget);
    });
  });
}
