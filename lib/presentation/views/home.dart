import 'package:bookly_app/presentation/widgets/home_widgets/home_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeBody()),
    );
  }
}
