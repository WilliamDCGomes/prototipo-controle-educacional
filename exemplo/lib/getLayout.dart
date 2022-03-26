import 'package:flutter/material.dart';
import 'DeviceInfo.dart';
import 'layoutCelularTablet.dart';
import 'layoutRelogio.dart';
import 'layoutWeb.dart';

class GetLayout{
  static final GetLayout _getLayout = GetLayout._internal();
  factory GetLayout() {
    return _getLayout;
  }
  GetLayout._internal();

  Widget getTheDeviceLayout(context){
    if(PhoneTablet().isWatch(context))
      return LayoutRelogio();
    if(PhoneTablet().isWeb())
      return LayoutWeb();
    return LayoutCelularTablet();
  }
}