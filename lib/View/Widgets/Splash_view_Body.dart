import 'package:booklyapp/View/Screens/Home_view.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    initSlidingAnimation();

    NavigateTo_HomePage();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
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
        const SizedBox(
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

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    SlidingAnimation = Tween<Offset>(begin: Offset(0, 5), end: Offset(0, 0))
        .animate(animationController);

    animationController.forward();
  }

  // ignore: non_constant_identifier_names
  void NavigateTo_HomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const HomeView(),
          transition: Transition.leftToRightWithFade);
    });
  }
}
