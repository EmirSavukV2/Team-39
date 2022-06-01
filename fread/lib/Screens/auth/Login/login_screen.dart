import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: kPrimaryColor,
          ),
        ),
        body: Body(),
      ),
    );
  }
}
