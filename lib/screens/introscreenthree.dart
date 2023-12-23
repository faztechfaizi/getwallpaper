import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';



class IntroPageThree extends StatelessWidget {
  const IntroPageThree({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(23),
      color:Colors.white,
      child: PageView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(image: const AssetImage('assets/images/ob3.png'),height: size.height * 0.5,),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  children: [
                    Text(tOnBoardingTitle3,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline4),
                    Text(tOnBoardingSubTitle3,textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle1,),

                  ],

                ),
              ),






            ],
          ),
        ],
      ),
    );
  }
}