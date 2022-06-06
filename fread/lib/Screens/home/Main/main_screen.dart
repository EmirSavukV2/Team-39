import 'package:flutter/material.dart';
import 'package:fread/constants/style.dart';

import '../../../components/sidebar/sidebar.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Anasayfa"),
          iconTheme: const IconThemeData(color: kPrimaryColor),
          leading: IconButton(
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.menu)),
        ),
        drawer: const Sidebar(),
        body: const Body(),
      ),
    );
  }
}
