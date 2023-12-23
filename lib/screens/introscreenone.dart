import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';


class IntroPageOne extends StatelessWidget {
  const IntroPageOne({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color(0xfffF8EED4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(image: const AssetImage('assets/images/ob1.png'),height: size.height * 0.5,),
          Container(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                Text(tOnBoardingTitle1,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline4),
                Text(tOnBoardingSubTitle1,textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}