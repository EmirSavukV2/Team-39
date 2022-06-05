part of sidebarhead;

class SidebarHead extends StatelessWidget {
  String? image;
  String title, subtitle, alttitle;
  IconData? icon;
  Alignment align;
  List<Color> gColors;
  void Function()? onPress;
  SidebarHead({
    Key? key,
    this.image,
    required this.title,
    this.subtitle = "",
    this.alttitle = "",
    this.icon,
    required this.gColors,
    this.onPress,
    this.align = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(1000)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gColors),
          ),
          child: ClipOval(
            child: Padding(
              padding: EdgeInsets.only(
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  top: kDefaultPadding / 2,
                  bottom: 0),
              child: InkWell(
                onTap: onPress,
                borderRadius: const BorderRadius.all(Radius.circular(1000)),
                child: (image == null)
                    ? Icon(
                        icon,
                        size: 32,
                        color: kPrimaryColor,
                      )
                    : Image.asset(
                        image!,
                        alignment: align,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        AutoSizeText(
          title,
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(height: kDefaultPadding / 2),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.w600, color: kTextColor),
        ),
        SizedBox(height: kDefaultPadding / 2),
        AutoSizeText(
          alttitle,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.w600, color: kTextColor),
        ),
      ],
    );
  }
}
