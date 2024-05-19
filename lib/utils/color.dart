import 'dart:ui';
import 'package:flutter/material.dart';

// Function to determine color based on days difference
Color getColorByDaysDifference(int daysDifference) {
  if (daysDifference <= 2) {
    return Color.fromRGBO(253, 1, 1, 1);
  } else if (daysDifference <= 4) {
    return Colors.orange;
  } else if (daysDifference <= 7) {
    return Color.fromRGBO(255, 222, 60, 1);
  } else if (daysDifference <= 14) {
    return Colors.green;
  } else {
    return Colors.blue;
  }
}