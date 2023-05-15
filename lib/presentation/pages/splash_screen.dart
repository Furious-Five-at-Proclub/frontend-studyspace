import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/themes/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: primaryColor,
      child: const Center(
        child: Text('Siap³', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}
