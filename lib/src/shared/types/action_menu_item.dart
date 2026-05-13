import 'package:flutter/material.dart';

typedef ActionMenuItem = ({
  IconData icon,
  String label,
  Function() callback,
  bool enabled,
});
