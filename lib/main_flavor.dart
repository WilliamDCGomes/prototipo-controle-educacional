import 'package:flutter/material.dart';
import 'app.dart';
import 'app/enums/enums.dart';
import 'flavors.dart';

buildFlavor(Flavor flavor) async {
  F.appFlavor = flavor;
  runApp(App());
}