import 'package:flutter/material.dart';

abstract class BoxShadows {
  static final boxShadowForGradientField = [
    BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(0, 4)),
  ];
}
