import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

class HomeTabView extends StatefulWidget {
  final int type;

  const HomeTabView({Key? key, required this.type}) : super(key: key);

  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final List<String> _avatarList = [];
  final List<int> _ChatRoomList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  final List<int> _publishContentList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  final String _publishContent =
      "There is a war between Israel and Hamas in May 2021. The war is 11 days long. No conflict starts since that time.Then, Gaza militants fire two rockets on Saturday.";

  _getChatorNum() {
    for (var i = 0; i < 10; i++) {
      _avatarList.add("images/avatar.jpg");
    }
  }

  @override
  void initState() {
    super.initState();
    _getChatorNum();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            // 聊天室水平列表
            _buildChatRooms(),

            // 用户发表的内容列表
            _buildPublishContents(),
          ],
        ),
      ),
    );
  }

  /// 聊天室水平列表
  _buildChatRooms() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 8),
      height: ScreenUtil.setHeight(300),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.1,
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // 创建房间
          _buildChatRoomBothEnds(Icons.add_ic_call, "发布通话", 40, 30),
          // 中间房间列表
          ...(_ChatRoomList.map<Widget>((room) {
            return _buildChatRoom(room);
          }).toList()),
          // 查看更多
          _buildChatRoomBothEnds(Icons.more_horiz, "查看更多", 50, 40),
        ],
      ),
    );
  }

  /// 聊天室列表子项
  _buildChatRoom(int room) {
    return Container(
      width: ScreenUtil.setWidth(230),
      height: ScreenUtil.setHeight(300),
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          // 头像
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(ScreenUtil.setWidth(20))),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: ScreenUtil.setFontSize(26),
                ),
              ),
              const SizedBox(width: 5),
              const MyText(
                text: "3人参加中",
                color: Colors.grey,
                fontSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 聊天列表两端的子项
  _buildChatRoomBothEnds(
      IconData icon, String title, double left, double right) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil.setWidth(left),
        right: ScreenUtil.setWidth(right),
        bottom: 2,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: ScreenUtil.setWidth(150),
                height: ScreenUtil.setHeight(150),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff545050), width: 2),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Icon(icon, color: Colors.green),
              ),
            ),
          ),
          MyText(
            text: title,
            color: Colors.grey,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  /// 用户发表的内容列表
  _buildPublishContents() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.setWidth(40)),
      child: Column(
        children: _publishContentList.map<Widget>((content) {
          return _buildPublishContent();
        }).toList(),
      ),
    );
  }

  /// 用户发表的内容列表子项
  _buildPublishContent() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧用户头像
          CircleAvatar(
            radius: ScreenUtil.setFontSize(60),
            backgroundImage: const AssetImage(
              "images/avatar.jpg",
            ),
          ),
          const SizedBox(width: 12),
          // 右侧内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 用户昵称和发布时间
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // 用户昵称
                    MyText(
                      text: "用户昵称",
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                    // 发布时间
                    MyText(
                      text: "12分钟前",
                      color: Colors.grey,
                      fontSize: 36,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // 发布内容
                MyText(
                  text: _publishContent,
                  fontSize: 40,
                ),
                const SizedBox(height: 10),
                // 底部按钮
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 左侧三个图标按钮
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIconBtn(() {
                            print("--- click reply btn");
                          }, Icons.reply, 24),
                          _buildIconBtn(() {}, Icons.upload, 22),
                          _buildIconBtn(() {}, Icons.favorite, 18),
                        ],
                      ),
                    ),
                    // 右侧图标按钮
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildIconBtn(() {}, Icons.more_vert, 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 图标按钮
  _buildIconBtn(VoidCallback onPressed, IconData icon, double size) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.grey,
          size: size,
        ));
  }
}
