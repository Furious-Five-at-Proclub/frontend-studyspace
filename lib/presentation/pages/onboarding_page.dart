import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../widgets/secondary_button.dart';
import '../widgets/rounded_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang di Study Space!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Masuk atau daftar akun untuk melanjutkan',
                    style: TextStyle(fontSize: 16, color: Color(0xFF777777)),
                  ),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    label: 'Masuk',
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ).constrained(width: MediaQuery.of(context).size.width),
                  const SizedBox(height: 12),
                  SecondaryButton(
                    label: 'Daftar Akun ',
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ).constrained(width: MediaQuery.of(context).size.width),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
