import 'package:flutter/material.dart';
import 'package:getwallpaper/constants/textstring.dart';

class LoginScreenHeader extends StatelessWidget {
  const LoginScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xfff414753),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          logintitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          loginsubtitle,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: const Color(0xfff414753)),
        ),
      ],
    );
  }
}
