import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  /// Body
  _buildBody() {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          child: _previewViewWidget,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 200,
            width: 150,
            color: Colors.white,
            child: _playViewWidget,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              _destoryEngine();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.call_end,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: MyIconBtn(
            onPressed: () {
              _createEngine();
              _loginRoom();
              _publishStream();
              _createPreviewRenderer();
              _playStream();
            },
            icon: Icons.add,
            size: 150,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  /// 创建引擎
  _createEngine() {
    ZegoEngineProfile profile = ZegoEngineProfile(
      3442613776,
      "3ee3734cf0979d5053c70519a863c775ae9247aaf359082e6c2222fe578be914",
      ZegoScenario.General,
    );
    // 创建引擎
    ZegoExpressEngine.createEngineWithProfile(profile);
  }

  /// **********登录房间
  _loginRoom() {
    // 创建用户对象
    ZegoUser user = ZegoUser.id('user1');

    // 开始登陆房间
    ZegoExpressEngine.instance.loginRoom('room1', user);
    ZegoExpressEngine.instance.loginRoom('room1', user, config: ZegoRoomConfig(8, true, ""));
  }

  /// **********推流
  _publishStream() {
    // 开始推流
    ZegoExpressEngine.instance.startPublishingStream("streamID");
  }

  /// 本地渲染和预览
  int _previewViewID = 1;
  Widget _previewViewWidget = SizedBox();
  _createPreviewRenderer() {
    int screenWidthPx = SU.getScreenWidth().toInt();
    int screenHeightPx = SU.getScreenHeight().toInt();
    ZegoExpressEngine.instance
        .createTextureRenderer(screenWidthPx, screenHeightPx)
        .then((textureID) {
      _previewViewID = textureID;

      setState(() {
        // Create a Texture Widget
        Widget previewViewWidget = Texture(textureId: textureID);
        // 将此 Widget 加入到页面的渲染树中以显示预览画面
        _previewViewWidget = previewViewWidget;
      });

      // Start preview using texture renderer
      _startPreview(textureID);
    });
  }

  void _startPreview(int viewID) {
    // Set the preview canvas
    ZegoCanvas previewCanvas = ZegoCanvas.view(viewID);

    // Start preview
    ZegoExpressEngine.instance.startPreview(canvas: previewCanvas);
  }

  /// **********拉流
  int _playViewID = 2;
  Widget _playViewWidget = SizedBox();
  _playStream() {
    // <1>. 只拉取音频流
    // ZegoExpressEngine.instance.startPlayingStream("streamID");

    // <2>. 拉流的同时，渲染拉流画面
    int screenWidthPx = 100;
    int screenHeightPx = 200;
    ZegoExpressEngine.instance.createTextureRenderer(screenWidthPx, screenHeightPx).then((viewID) {
      _playViewID = viewID;
      // 将得到的 Widget 加入到页面的渲染树中以显示拉流画面
      setState(() => _playViewWidget = Texture(textureId: viewID));
      _startPlayingStream(viewID, "streamID2");
    });
  }

  void _startPlayingStream(int viewID, String streamID) {
    ZegoCanvas canvas = ZegoCanvas.view(viewID);
    ZegoExpressEngine.instance.startPlayingStream(streamID, canvas: canvas);
  }

  /// **********停止推拉流
  /// 停止推流/预览/渲染
  _stopPublish() {
    // 停止推流
    ZegoExpressEngine.instance.stopPublishingStream();
    // 停止预览
    ZegoExpressEngine.instance.stopPreview();
    // 如果预览时创建了 TextureRenderer，需要调用 destroyTextureRenderer 接口销毁 TextureRenderer。
    // _previewViewID 为调用 createTextureRenderer 时得到的 viewID
    ZegoExpressEngine.instance.destroyTextureRenderer(_previewViewID);
  }

  /// 停止拉流/渲染
  _stopPlay() {
    // 停止拉流
    ZegoExpressEngine.instance.stopPlayingStream("streamID");
    // 如果拉流时创建了 TextureRenderer，需要调用 destroyTextureRenderer 接口销毁 TextureRenderer。
    // _playViewID 为调用 [createTextureRenderer] 时得到的 viewID
    ZegoExpressEngine.instance.destroyTextureRenderer(_playViewID);
  }

  /// *********** 退出房间
  _logoutRoom() {
    // 退出房间
    ZegoExpressEngine.instance.logoutRoom('room1');
  }

  /// ************ 销毁引擎
  _destoryEngine() {
    // 销毁引擎
    ZegoExpressEngine.destroyEngine();
  }
}

/*
// 以下为常用的房间相关回调
// 房间状态更新回调
ZegoExpressEngine.onRoomStateUpdate = (String roomID, ZegoRoomState state, int errorCode, Map<String, dynamic> extendedData) {
// 根据需要实现事件回调
};

// 用户状态更新
ZegoExpressEngine.onRoomUserUpdate = (String roomID, ZegoUpdateType updateType, List<ZegoUser> userList) {
// 根据需要实现事件回调
};

// 流状态更新
ZegoExpressEngine.onRoomStreamUpdate = (String roomID, ZegoUpdateType updateType, List<ZegoStream> streamList) {
// 根据需要实现事件回调
};
 */

/// -----------

/*
// 常用的拉流相关回调
// 拉流状态相关回调
ZegoExpressEngine.onPlayerStateUpdate = (String streamID, ZegoPlayerState state, int errorCode, Map<String, dynamic> extendedData) {
    // 根据需要实现事件回调
};
 */
