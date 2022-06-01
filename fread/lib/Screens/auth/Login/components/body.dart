import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
import 'package:sizer/sizer.dart';

import '../../components/input_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        top: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              "login.title".tr(),
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 2,
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          AutoSizeText(
            "login.subtitle".tr(),
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 4,
          ),
          const Spacer(),
          LoginInputField(
            hintText: "login.email".tr(),
            inputController: TextEditingController(),
          ),
          SizedBox(height: kDefaultPadding * 2),
          PasswordInput(
            hintText: "login.password".tr(),
            textEditingController: TextEditingController(),
          ),
          const Spacer(),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text("login.login".tr()),
              ),
              SizedBox(height: kDefaultPadding * 2),
              AutoSizeText(
                "login.forgotPassword".tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("login.restartPassword".tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
