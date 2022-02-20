import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';
import 'package:imitate_yay/widget/my_text.dart';

double _titleSize = 48;
double _contentSize = 40;

/// 通话设置页面
class CallingSettingsPage extends StatefulWidget {
  const CallingSettingsPage({Key? key}) : super(key: key);

  @override
  _CallingSettingsPageState createState() => _CallingSettingsPageState();
}

class _CallingSettingsPageState extends State<CallingSettingsPage> {
  // 输出音量
  double _outputVoiceValue = 1;
  // 输入音量
  double _inputVoiceValue = 1;
  // 是否降噪
  bool _isNoiseReduce = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "通話設定"),
      body: _buildBody(),
    );
  }

  /// Body
  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOutputSettings(),
          _buildInputSettings(),
          const Placeholder(),
        ],
      ),
    );
  }

  /// 输出设定
  _buildOutputSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _buildTitle("出力設定"),
        _buildDivider(24),
        // 输出通话音量
        _buildPaddingContent(
            MyText(text: "出力通話音量（自分に聞こえる音量）", fontSize: _contentSize, color: Colors.white70)),
        _buildPaddingContent(
          Row(
            children: [
              Icon(
                Icons.volume_mute,
                color: Colors.white70,
                size: SU.setFontSize(72),
              ),
              Expanded(
                child: _buildSlider(_outputVoiceValue, (value) {
                  setState(() {
                    _outputVoiceValue = value;
                  });
                }),
              ),
              Icon(
                Icons.volume_up,
                color: Colors.white70,
                size: SU.setFontSize(72),
              ),
            ],
          ),
        ),
        _buildDivider(10),
        const SizedBox(height: 10),
        // 输出源
        _buildPaddingContent(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(text: "音声出力先", fontSize: _contentSize, color: Colors.white70),
              MyText(text: "手机", fontSize: _contentSize, color: Colors.white70),
            ],
          ),
        ),
      ],
    );
  }

  /// 输入设定
  _buildInputSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCateDivider(),
        _buildTitle("入力設定"),
        _buildDivider(24),
        // 输入通话音量
        _buildPaddingContent(
            MyText(text: "入力通話音量（相手に聞こえる音量）", fontSize: _contentSize, color: Colors.white70)),
        _buildPaddingContent(Row(
          children: [
            Icon(
              Icons.volume_mute,
              color: Colors.white70,
              size: SU.setFontSize(72),
            ),
            Expanded(
              child: _buildSlider(_inputVoiceValue, (value) {
                setState(() {
                  _inputVoiceValue = value;
                });
              }),
            ),
            Icon(
              Icons.volume_up,
              color: Colors.white70,
              size: SU.setFontSize(72),
            ),
          ],
        )),
        _buildDivider(10),
        const SizedBox(height: 10),
        // 降噪
        _buildPaddingContent(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(text: "ノイズキャンセリング", fontSize: _contentSize, color: Colors.white70),
              Switch(
                value: _isNoiseReduce,
                onChanged: (value) {
                  setState(() {
                    _isNoiseReduce = value;
                  });
                },
                activeTrackColor: CommonConstant.primaryColor,
                inactiveTrackColor: Colors.white12,
                activeColor: CommonConstant.primaryColor,
                inactiveThumbColor: Colors.white12,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// --- 以下为公共部分 ---
  /// 滑块
  _buildSlider(double value, ValueChanged valueChanged) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: CommonConstant.primaryColor,
        inactiveTrackColor: Colors.white12,
        trackHeight: 3,
        trackShape: const RectangularSliderTrackShape(),
        thumbColor: CommonConstant.primaryColor,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      ),
      child: Slider(
        value: value,
        onChanged: valueChanged,
      ),
    );
  }

  /// 设定分类的分割线
  _buildCateDivider() {
    return const Divider(
      color: Colors.white24,
      thickness: 3,
      height: 42,
    );
  }

  /// 子项分割线
  _buildDivider(double height) {
    return Divider(
      color: Colors.white12,
      thickness: 1,
      height: height,
    );
  }

  /// 带边距的组件
  _buildPaddingContent(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
      child: child,
    );
  }

  /// 分类标题
  _buildTitle(String text) {
    return _buildPaddingContent(MyText(text: text, fontSize: _titleSize));
  }
}
