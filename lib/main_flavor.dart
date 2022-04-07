import 'package:flutter/material.dart';
import 'app.dart';
import 'app/enums/enums.dart';
import 'flavors.dart';

buildFlavor(Flavor flavor) {
  F.appFlavor = flavor;
  runApp(App());
}