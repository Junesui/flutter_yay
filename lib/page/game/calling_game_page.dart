import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/game/game_model.dart';
import 'package:imitate_yay/net/dao/game_dao.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 游戏列表页
class CallingGamePage extends StatefulWidget {
  const CallingGamePage({Key? key}) : super(key: key);

  @override
  _CallingGamePageState createState() => _CallingGamePageState();
}

class _CallingGamePageState extends State<CallingGamePage> {
  // 游戏
  GameModel? _gameModel;

  @override
  void initState() {
    super.initState();
    _getGameData();
  }

  /// 获取游戏数据
  _getGameData() async {
    await GameDao.getGame().then((model) {
      setState(() {
        _gameModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "みんなで遊べるゲーム"),
      body: _buildBody(),
    );
  }

  /// Body
  _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const MyText(
            text: "ゲームを選ぼう",
            fontSize: 46,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          const MyText(
            text: "Yayでだれ通しながらゲームをしよう！",
            fontSize: 40,
          ),
          const SizedBox(height: 10),
          Expanded(child: _buildGames()),
        ],
      ),
    );
  }

  /// 游戏列表
  _buildGames() {
    List<Games> games = _gameModel?.games ?? [];
    return games.isEmpty
        ? const SizedBox()
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              childAspectRatio: 2 / 3,
            ),
            itemCount: games.length,
            itemBuilder: (context, index) {
              return _buildGameItem(games[index]);
            },
          );
  }

  /// 游戏列表子项
  _buildGameItem(Games game) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(SU.setHeight(30)),
          child: MyCacheNetImg(imgUrl: game.iconUrl ?? ""),
        ),
        MyText(
          text: game.title ?? "",
          fontSize: 36,
          fontWeight: FontWeight.bold,
          maxLines: 2,
        ),
      ],
    );
  }
}
