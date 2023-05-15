import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/notifiers/splash_screen/splash_screen_notifier.dart';
import 'presentation/pages/splash_screen.dart';

class Wrapper extends ConsumerStatefulWidget {
  const Wrapper({Key? key}) : super(key: key);
  
  @override
  ConsumerState<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends ConsumerState<Wrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashScreenNotifier.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashScreenNotifier, (previous, next) { 
      next.maybeWhen(
        signedIn: () async {
          Navigator.pushReplacementNamed(context, '/home');
        },
        signedOut: () {
          Navigator.pushReplacementNamed(context, '/onboarding');
        },
        orElse: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Unexpected error'),
            duration: Duration(seconds: 2),
          ));
        },
      );
    });
    
    return const SplashScreen();
  }
}