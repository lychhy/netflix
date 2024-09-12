import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Set the timer to move to Home screen after 4 seconds
    Timer(
      const Duration(seconds: 4), (){ Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        //Use Littie.asset widget to use lottie file
      child: Lottie.asset('assets/Netflix.json'),
    );
  }
}
