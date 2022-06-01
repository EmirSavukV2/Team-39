import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';
import 'package:sizer/sizer.dart';

import '../../components/input_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
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
                  "register.title".tr(),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: kDefaultPadding * 2),
              AutoSizeText(
                "register.subtitle".tr(),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 4,
              ),
              SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  Expanded(
                    child: LoginInputField(
                      hintText: "register.name".tr(),
                      inputController: TextEditingController(),
                    ),
                  ),
                  SizedBox(width: kDefaultPadding),
                  Expanded(
                    child: LoginInputField(
                      hintText: "register.surname".tr(),
                      inputController: TextEditingController(),
                    ),
                  )
                ],
              ),
              SizedBox(height: kDefaultPadding / 2),
              LoginInputField(
                hintText: "register.mail".tr(),
                inputController: TextEditingController(),
              ),
              SizedBox(height: kDefaultPadding / 2),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: LoginInputField(
                  hintText: "register.birtday".tr(),
                  enabled: false,
                  inputController: TextEditingController()
                    ..text =
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
              ),
              SizedBox(height: kDefaultPadding / 2),
              SizedBox(height: kDefaultPadding / 2),
              PasswordInput(
                hintText: "register.password".tr(),
                textEditingController: TextEditingController(),
              ),
              SizedBox(height: kDefaultPadding / 2),
              PasswordInput(
                hintText: "register.passwordRetry".tr(),
                textEditingController: TextEditingController(),
              ),
              SizedBox(height: kDefaultPadding * 2),
              Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text("register.registerButton".tr()),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  AutoSizeText(
                    "register.haveAccount".tr(),
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
                    child: Text("register.login".tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1960),
      lastDate: DateTime(2023, 1, 1),
    );
    if (selected != null && selected != selectedDate)
      setState(() => selectedDate = selected);
  }
}
