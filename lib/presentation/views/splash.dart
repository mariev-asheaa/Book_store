import 'package:bookly_app/presentation/widgets/splash_widgets/splash_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: SplashBody(),
    );
  }
}
