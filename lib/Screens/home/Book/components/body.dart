part of '../book_detail.dart';

class Body extends StatelessWidget {
  Books books;

  Body({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets safePadding = MediaQuery.of(context).padding;
    return Container(
        width: double.infinity,
        height: size.height * 1,
        padding:
            EdgeInsets.only(left: safePadding.left, right: safePadding.right),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * 0.3,
                    decoration: const BoxDecoration(color: Color(0xff718A7D)),
                  ),
                  SizedBox(height: size.height * 0.23),
                  Text(
                    books.name!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  Text(
                    books.author!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: const Color(0xffF5F5F5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: books.numberOfPages.toString(),
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
                              text: books.lang,
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
                              text: books.rate?.toStringAsPrecision(2),
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
                      books.description!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(kDefaultPadding),
                    child: ElevatedButton(
                      child: const Text("Countinue Reading"),
                      onPressed: () {
                        Get.to(LiveRead(
                          books: books,
                        ));
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
                        offset: const Offset(0, 20),
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl: books.thumbnail!,
                    placeholder: (context, url) => loadShimmer(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.contain,
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
                        color: const Color.fromARGB(4, 0, 0, 0).withOpacity(.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const BackButton(color: Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget loadShimmer() {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: const SizedBox(width: 200, height: 100),
      ),
    );
  }
}
