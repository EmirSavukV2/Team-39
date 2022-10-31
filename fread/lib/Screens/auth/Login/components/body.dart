import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fread/Services/auth.services.dart';
import 'package:fread/constants/style.dart';

import '../../components/input_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              "auth.login.title".tr(),
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1,
              maxLines: 2,
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          AutoSizeText(
            "auth.login.subtitle".tr(),
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
            maxLines: 4,
          ),
          const Spacer(),
          LoginInputField(
            hintText: "auth.login.email".tr(),
            inputController: emailController,
          ),
          SizedBox(height: kDefaultPadding * 2),
          PasswordInput(
            hintText: "auth.login.password".tr(),
            textEditingController: passwordController,
          ),
          const Spacer(),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await AuthServices().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                child: Text("auth.login.login".tr()),
              ),
              SizedBox(height: kDefaultPadding * 2),
              AutoSizeText(
                "auth.login.forgotPassword".tr(),
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
                child: Text("auth.login.restartPassword".tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    if (emailController.text.trim() == "emirsvk55@gmail.com" &&
        passwordController.text.trim() == "18502000") {
      Navigator.pushNamed(context, '/home');
    } else {
      final snackBar = SnackBar(
        content: const Text('Wrong email or password '),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
