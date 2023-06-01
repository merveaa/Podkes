import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podkes/language/colors.dart';
import 'package:podkes/language/lang.dart';

import '../widgets/image_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 67, top: 98, right: 68),
              child: RoundedImage(
                imagePath: ImageItems().splashGirl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 46, bottom: 18),
              child: Text(
                ProjectKeys.projectTitle,
                style: GoogleFonts.poppins(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  height: 0.9,
                  color: ColorItems().mainTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Text(
                ProjectKeys.def,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14.5,
                  height: 1.2,
                  fontWeight: FontWeight.normal,
                  color: ColorItems().defTextColor,
                ),
              ),
            ),
            const SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                DotWidget(),
                SizedBox(width: 6),
                Dot2Widget(),
                SizedBox(width: 6),
                DotWidget(),
              ],
            )
          ],

          // Add other widgets here
        ),
      ),
      floatingActionButton:
          const SizedBox(width: 75, height: 75, child: NextButtonWidget()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      onPressed: () {},
      child: Icon(
        size: 40,
        Icons.arrow_forward_rounded,
        color: ColorItems().nextIconColor,
      ),
    );
  }
}

class Dot2Widget extends StatelessWidget {
  const Dot2Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 23,
        height: 8,
        color: ColorItems().dot2Color,
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorItems().dotColor,
      ),
    );
  }
}
