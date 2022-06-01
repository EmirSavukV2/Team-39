import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import 'components/body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const BackButton(
            color: kPrimaryColor,
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
