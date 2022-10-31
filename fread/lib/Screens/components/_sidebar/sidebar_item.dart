// ignore_for_file: must_be_immutable

part of sidebar;

class SidebarItem extends StatelessWidget {
  String? image;
  String title, subtitle;
  IconData? icon;
  Alignment align;
  List<Color> gColors;
  void Function()? onPress;
  SidebarItem({
    Key? key,
    this.image,
    required this.title,
    this.subtitle = "",
    this.icon,
    required this.gColors,
    this.onPress,
    this.align = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width / 3 - (kDefaultPadding * 2),
          height: size.width / 3 - (kDefaultPadding * 2),
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
        Text(title, style: Theme.of(context).textTheme.bodyText2),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.normal, color: kTextColor),
        ),
      ],
    );
  }
}
