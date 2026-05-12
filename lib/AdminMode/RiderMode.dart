
import 'package:flutter/material.dart';

class RiderMode extends StatefulWidget {
  const RiderMode({super.key});

  @override
  State<RiderMode> createState() => _RiderModeState();
}

class _RiderModeState extends State<RiderMode> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("this is the Rider mode"),
        ],

      ),
    );
  }
}
