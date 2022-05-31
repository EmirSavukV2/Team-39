import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
import 'package:sizer/sizer.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 2, vertical: kDefaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: kDefaultPadding),
          Image.asset(
            "assets/images/auth/welcome.png",
            height: 30.h,
          ),
          AutoSizeText(
            "The story\nbegins here",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline1,
            maxLines: SizerUtil.deviceType == DeviceType.mobile ? 2 : 1,
          ),
          AutoSizeText(
            "Magna exercitation est sit nulla nulla voluptate. In eiusmod Lorem eu excepteur ullamco elit. Lorem ad dolore nostrud dolor proident sunt officia non. ",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 4,
          ),
          SizedBox(height: kDefaultPadding * 2),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Immerse yourself now"),
                ),
              ),
            ],
          ),
          AutoSizeText(
            "Do you have an acount?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text("Log in"),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
