import 'package:flutter/cupertino.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

/// 即构 SDK 相关操作
class Zego {
  /// 创建引擎
  static createEngine(int appID, String appSign,
      {ZegoScenario zegoScenario = ZegoScenario.General}) {
    ZegoEngineProfile profile = ZegoEngineProfile(appID, appSign, zegoScenario);
    // 创建引擎
    ZegoExpressEngine.createEngineWithProfile(profile);
  }

  /// 登录房间
  static loginRoom(String userId, String roomId, ZegoRoomConfig config) {
    // 创建用户对象
    ZegoUser user = ZegoUser.id(userId);
    // 登录房间
    ZegoExpressEngine.instance.loginRoom(roomId, user, config: config);
  }

  /// 推流
  static publishStream(String streamID) {
    // 开始推流
    ZegoExpressEngine.instance.startPublishingStream(streamID);
  }

  /// (视频使用)推流，返回本地渲染预览组件和视图ID。
  /// return list[0]: 视频渲染的Widget, list[1]: 预览视图ID
  static List publishStreamAndReturnPreview(
    String streamID, {
    int w = 300,
    int h = 500,
  }) {
    List list = [];
    // 开始推流
    ZegoExpressEngine.instance.startPublishingStream(streamID);
    // 创建本地渲染和预览
    ZegoExpressEngine.instance.createTextureRenderer(w, h).then((viewID) {
      Widget previewViewWidget = Texture(textureId: viewID);
      list.add(previewViewWidget);
      list.add(viewID);
    });
    return list;
  }

  /// (视频使用)开始渲染本地视图 (调用 publishStreamAndReturnPreview 之后使用)
  static startPublishView(int viewID) {
    // 设置预览画布
    ZegoCanvas previewCanvas = ZegoCanvas.view(viewID);
    // 开始预览
    ZegoExpressEngine.instance.startPreview(canvas: previewCanvas);
  }

  /// 拉流 (只拉取音频流)
  static playStream(String streamID) {
    ZegoExpressEngine.instance.startPlayingStream(streamID);
  }

  /// (视频使用)拉流 (拉流的同时，渲染拉流画面)
  /// return list[0]: 视频渲染的Widget, list[1]: 预览视图ID, list[2]: 被拉取的流ID
  static List playStreamAndReturnPreview(
    String streamID, {
    int w = 300,
    int h = 500,
  }) {
    List list = [];
    ZegoExpressEngine.instance.createTextureRenderer(w, h).then((viewID) {
      Widget playViewWidget = Texture(textureId: viewID);
      list.add(playViewWidget);
      list.add(viewID);
      list.add(streamID);
    });
    return list;
  }

  /// (视频使用)开始渲染拉取视图 (调用 playStreamAndReturnPreview 之后使用)
  static startPlayView(int viewID, String streamID) {
    ZegoCanvas canvas = ZegoCanvas.view(viewID);
    ZegoExpressEngine.instance.startPlayingStream(streamID, canvas: canvas);
  }

  /// 退出房间
  static logoutRoom(String roomID) {
    ZegoExpressEngine.instance.logoutRoom(roomID);
  }

  /// 销毁引擎
  static destoryEngine() {
    ZegoExpressEngine.destroyEngine();
  }
}

// 监听登录房间后的事件回调
/**
 * 监听登录房间后的事件回调
 * onRoomStateUpdate：房间状态更新回调
 * onRoomUserUpdate：用户状态更新回调
 * onRoomStreamUpdate：流状态更新回调
 * ------------------------
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

// 监听推流后的事件回调
/**
 * 监听推流后的事件回调
 * onPublisherStateUpdate：推流状态更新回调
 * ---------------------
    常用的推流相关回调
    //推流状态更新回调
    ZegoExpressEngine.onPublisherStateUpdate = (String streamID, ZegoPublisherState state, int errorCode, Map<String, dynamic> extendedData) {
    // 根据需要实现事件回调
    };
 *
 */

// 监听拉流后的事件回调
/**
 * 监听拉流后的事件回调
 * onPlayerStateUpdate：拉流状态更新回调
    常用的拉流相关回调
    // 拉流状态相关回调
    ZegoExpressEngine.onPlayerStateUpdate = (String streamID, ZegoPlayerState state, int errorCode, Map<String, dynamic> extendedData) {
    // 根据需要实现事件回调
    };
 */
