import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:to_do_list_app/apps.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const Apps()));
}
