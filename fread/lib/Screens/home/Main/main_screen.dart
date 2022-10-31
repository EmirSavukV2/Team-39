import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fread/Services/auth.services.dart';
import 'package:fread/constants/style.dart';

import '../../components/sidebar/sidebar.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = AuthServices.instance.getCurrentUser();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // Get user name from firebase
          title: Text("${user?.displayName}"),
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
