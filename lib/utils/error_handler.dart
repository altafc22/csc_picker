import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CSCErrorHandler {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static String getErrorMessage(String errorType) {
    switch (errorType) {
      case 'country':
        return CSCConstants.ERROR_COUNTRY_LOAD;
      case 'state':
        return CSCConstants.ERROR_STATE_LOAD;
      case 'city':
        return CSCConstants.ERROR_CITY_LOAD;
      default:
        return 'An error occurred';
    }
  }
}
