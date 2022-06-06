import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

class Body extends StatelessWidget {
  final String title, author, page, lang, rate, intro, image, pdf;

  const Body({
    Key? key,
    required this.title,
    required this.author,
    required this.page,
    required this.lang,
    required this.rate,
    required this.intro,
    required this.image,
    required this.pdf,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets safePadding = MediaQuery.of(context).padding;
    return Container(
        width: double.infinity,
        height: size.height * 1,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * 0.3,
                    decoration: BoxDecoration(color: Color(0xff718A7D)),
                  ),
                  SizedBox(height: size.height * 0.23),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  Text(
                    author,
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
                              text: page,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: 'Pages',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          SizedBox(width: kDefaultPadding),
                          RichText(
                            text: TextSpan(
                              text: lang,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: 'Lang',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                          SizedBox(width: kDefaultPadding),
                          RichText(
                            text: TextSpan(
                              text: rate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: 'Raiting',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
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
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: kDefaultPadding),
                    child: Text(
                      intro,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: ElevatedButton(
                      child: Text("Countinue Reading"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/live-read', arguments: {
                          "title": title,
                          "pdf": pdf,
                        });
                      },
                    ),
                  ),
                ],
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
                    image,
                    height: size.height * 0.35,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: safePadding +
                      EdgeInsets.only(
                          left: kDefaultPadding, top: kDefaultPadding),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(4, 0, 0, 0).withOpacity(.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: BackButton(color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
