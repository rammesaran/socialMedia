import 'package:flutter/material.dart';
import 'package:socialmedia/screen/loginscreen.dart';


class WelcomeScreen extends StatefulWidget {
   WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>with  SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

@override
  void initState() {
    super.initState();
        animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {
          if (animation.value == 1.0) {
                  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   LoginScreen()),
        );
          }
        }));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Container(
         width: 300,
         height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              
                image: AssetImage("assets/logo.jpg"), fit: BoxFit.cover),
          ),
          //child: Lottie.asset('assets/data_1.json'),
        ),
      ),
    );
  }

  @override
  void dispose() {
        animationController.dispose();

    super.dispose();
  }
}