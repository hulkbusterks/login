import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleConnect extends StatelessWidget {
  bool isLogin;
  Function()? onTap;
  GoogleConnect({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.blue,
        height: 40,
        width: 240,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 40,
            padding: const EdgeInsets.only(left: 2),
            child: Container(
              width: 36,
              color: Colors.white,
              height: 36,
              child: SvgPicture.network(
                "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              isLogin==true?"Sign In with Google":"Sign up with Google",
              style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          )
        ]),
      ),
    );
  }
}
