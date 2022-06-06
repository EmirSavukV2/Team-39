import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, '/welcome');
  }

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/illustrator/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
      bodyFlex: 1,
      bodyAlignment: Alignment.topCenter,
      imageAlignment: Alignment.center,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      isTopSafeArea: true,
      pages: [
        PageViewModel(
          title: "FRead'e Hoş Geldin!",
          body: "FRead sizlere neler sunuyor bir göz atalım.",
          image: _buildImage('1.webp'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          body:
              "Okuma hızınızın artmasını ve kısa sürede daha fazla kitap okumayı ister misin?",
          title: "",
          image: _buildImage('2.webp'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          body:
              "O zaman FRead tam sana göre!\nYapman gereken tek şey okumak istediğin herhangi bir metni PDF formatında FRead'e yüklemek",
          title: "",
          image: _buildImage('3.webp'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title:
              "Hem kişisel dosyalarınızı hem de uygulamamızda ki kitap ve belgeleri birbirinden farklı methodlarla okumak için\nHaydi başlayalım",
          body: "",
          image: _buildImage('4.webp'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showBackButton: false,
      showSkipButton: true,
      skip: const Icon(Icons.keyboard_double_arrow_right),
      next: const Icon(Icons.arrow_right_alt),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: kPrimaryColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
