import 'package:flutter/material.dart';

import '../../constants/textstring.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
    Key? key,
  }) : super(key: key);

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
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff414753),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          signuptitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          signupsubtitle,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: const Color(0xfff414753)),
        ),

      ],
    );
  }
}