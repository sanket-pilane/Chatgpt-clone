import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/design/app_color.dart';
import 'package:mobile/features/chat/chat_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.greenBgColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset(
                    "assets/svg/log.svg",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Welcome to ChatGPT",
                  style: TextStyle(
                      color: AppColor.pinkBgColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Let's start by tailoring your experience to suit your preferences. Tell us a bit about yourself and what you're interested in.",
                  style: TextStyle(
                    color: AppColor.pinkBgColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  side: BorderSide(
                            color: AppColor.pinkBgColor,
                          )))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatPage(),
                            ));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Try ChatGPT",
                            style: TextStyle(
                                color: AppColor.pinkBgColor, fontSize: 18),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColor.pinkBgColor,
                            size: 40,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
