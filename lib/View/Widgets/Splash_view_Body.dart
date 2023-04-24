import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    SlidingAnimation = Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
        .animate(animationController);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AssetsData.Logo,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        AnimatedBuilder(
            animation: SlidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                  position: SlidingAnimation,
                  child: const Text("Read Free Books"));
            })
      ],
    );
  }
}
