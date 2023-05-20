import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/themes/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: SafeArea(
          child: const Text(
            'Akun',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ).padding(all: 16).border(bottom: 1, color: grey100Color),
        ),
      ),
    );
  }
}
