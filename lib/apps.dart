import 'package:flutter/material.dart';
import 'package:to_do_list_app/to_do_list_screen.dart';

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Todolistscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
