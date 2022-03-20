import 'dart:math';

import 'package:dicebear_avatars/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int seed = random.nextInt(9999);
    int artSeed = random.nextInt(avatarsList.length);

    Future.delayed(const Duration(seconds: 5))
        .then((value) => {Modular.to.navigate('/home')});

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.network(
            '$baseUrl/${avatarsList[artSeed]}/:$seed.svg',
            semanticsLabel: 'Inicial',
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('DiceBear Avatars', style: GoogleFonts.fredokaOne(fontSize: 30)),
          const SizedBox(
            height: 30,
          ),
          const CircularProgressIndicator(
            color: Colors.blueAccent,
          )
        ],
      ),
    ));
  }
}
