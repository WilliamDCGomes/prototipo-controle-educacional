import 'package:flutter/material.dart';
import 'app.dart';
import 'app/enums/enums.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.HMLG;
  runApp(App());
}
