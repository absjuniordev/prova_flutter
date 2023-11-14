import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:target_sistemas/page/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Animate(
          onComplete: (controller) {
            Navigator.push(
              context,
              PageTransition(
                duration: const Duration(milliseconds: 1500),
                type: PageTransitionType.fade,
                child: const LoginPage(),
              ),
            );
          },
          effects: const [
            FadeEffect(
              delay: Duration(milliseconds: 200),
              duration: Duration(seconds: 3),
            ),
          ],
          child: Image.asset(
            "assets/images/target_logo.png",
            scale: 5,
          ),
        ),
      ),
    );
  }
}
