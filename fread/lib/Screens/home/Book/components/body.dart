import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets safePadding = MediaQuery.of(context).padding;
    return Container(
      width: double.infinity,
      height: size.height * 1,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(color: Color(0xff718A7D)),
                ),
                SizedBox(height: size.height * 0.23),
                Text(
                  "Sherlock HOLMES Tanık",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 24,
                      ),
                ),
                Text(
                  "Sır Arthur Conan Doyle",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(0xffF5F5F5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '252 ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'Pages',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        SizedBox(width: kDefaultPadding),
                        RichText(
                          text: TextSpan(
                            text: 'Eng ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'Lang',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        SizedBox(width: kDefaultPadding),
                        RichText(
                          text: TextSpan(
                            text: '4.5',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'Raiting',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    children: [
                      Text(
                        "Introduction",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kDefaultPadding, right: kDefaultPadding),
                  child: Text(
                    "Adipisicing minim voluptate voluptate eu adipisicing cupidatat. Ex cupidatat laborum aliqua irure laborum. In qui et occaecat nisi anim non in velitAdipisicing minim voluptate voluptate eu adipisicing cupidatat. Ex cupidatat laborum aliqua irure laborum. In qui et occaecat nisi anim non in velit.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.13),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 24,
                    spreadRadius: 2,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/books/sherlock.jpg",
                height: size.height * 0.35,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: safePadding +
                  EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(4, 0, 0, 0).withOpacity(.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: BackButton(color: Colors.white)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: ElevatedButton(
                child: Text("Countinue Reading"),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
