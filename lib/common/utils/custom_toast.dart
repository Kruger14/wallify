import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showCustomToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT, // Similar to Snackbar duration
    gravity: ToastGravity.BOTTOM, // Can be changed to CENTER or TOP
    backgroundColor: Colors.black87, // Custom background color
    textColor: Colors.white, // Custom text color
    fontSize: 16.0, // Custom font size
  );
}
