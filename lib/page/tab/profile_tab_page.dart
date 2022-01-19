import 'package:flutter/material.dart';
import 'package:imitate_yay/page/profile/profile_page.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return ProfilePage();
  }
}
