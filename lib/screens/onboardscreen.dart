
import 'package:flutter/material.dart';
import 'package:getwallpaper/screens/introscreenthree.dart';
import 'package:getwallpaper/screens/introscreentwo.dart';
import 'package:getwallpaper/screens/welcomescreen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'introscreenone.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}
class _OnBoardScreenState extends State<OnBoardScreen> {
  final controller = LiquidController();
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      IntroPageOne(size: size),
      IntroPageTwo(size: size),
      IntroPageThree(size: size),
      WelcomeScreen(size: size,)
    ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            fullTransitionValue: 300,
            onPageChangeCallback: onPageChangeCallback,
            positionSlideIcon: 0.9,
            liquidController: controller,
            enableSideReveal: true,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableLoop: false,


          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 4,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xff272727),
                dotHeight: 8,
              ),
            ),
          ),
          Positioned(
              top: 60,
              right: 25,

              child: TextButton(
            onPressed: (){
              controller.jumpToPage(page: 3);
            },
            child: const Text('Skip',style: TextStyle(
              color: Colors.black26,
              fontSize: 15,
              fontFamily: 'SubFont'
            ),
            ),
          ),
          )

        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    setState(() {
      currentpage = activePageIndex;

    });
  }
}
