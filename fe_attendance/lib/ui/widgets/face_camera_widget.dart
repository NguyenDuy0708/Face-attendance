import 'package:flutter/material.dart';

class FaceCameraWidget extends StatelessWidget {
  const FaceCameraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 300,
      child: const Center(child: Text('Camera preview')),
    );
  }
}
