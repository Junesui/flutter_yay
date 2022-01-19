import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/widget/my_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Text(
                "Leading",
                style: TextStyle(color: Colors.red),
              ),
              actions: [
                Text(
                  "Action",
                  style: TextStyle(color: Colors.red),
                ),
              ],
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      "images/avatar.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: MyText(
                                  text: "未认证",
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CircleAvatar(
                            radius: 46,
                            backgroundImage: AssetImage("images/avatar.jpg"),
                          ),
                          MyText(
                            text: "NickName",
                            fontSize: 50,
                          ),
                          MyText(
                            text: "自己紹介",
                            fontSize: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: CommonConstant.primaryBackGroundColor,
            ),
            // appbar区域
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyText(
                            text: "NickName",
                            fontSize: 35,
                          ),
                          MyText(
                            text: "NickName",
                            fontSize: 35,
                          ),
                          MyText(
                            text: "NickName",
                            fontSize: 35,
                          ),
                          MyText(
                            text: "NickName",
                            fontSize: 35,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: [
              Container(
                height: 300,
                color: Colors.orangeAccent,
              ),
              Container(
                height: 300,
                color: Colors.red,
              ),
              Container(
                height: 300,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
