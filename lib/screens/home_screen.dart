import 'package:dicebear_avatars/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String type = avatarsList[0];
  String seed = 'your-custom-seed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'DiceBear Avatars',
            style: GoogleFonts.fredokaOne(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 320,
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent, width: 3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    margin: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: SvgPicture.network(
                        '$baseUrl/$type/$seed.svg',
                        semanticsLabel: 'Inicial',
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton(
                        style: GoogleFonts.fredokaOne(color: Colors.black),
                        value: type,
                        onChanged: (value) {
                          setState(() {
                            type = value.toString();
                          });
                        },
                        items: avatarsList.map((String value) {
                          return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          decoration: const InputDecoration(
                              labelText: 'Your Custom Seed'),
                          style: GoogleFonts.fredokaOne(),
                          onChanged: (value) {
                            setState(() {
                              seed = value.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            launch('$baseUrl/$type/$seed.png');
                          },
                          child: Text('Download Avatar',
                              style: GoogleFonts.fredokaOne()))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
