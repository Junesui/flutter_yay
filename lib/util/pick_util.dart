import 'dart:async';

import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 从图库选择资源
class PickUtil {
  static Future<List<AssetEntity>> pick(BuildContext context, List<AssetEntity> selectedAssets,
      {int maxAssets = 9}) async {
    List<AssetEntity>? imgs = await AssetPicker.pickAssets(
      context,
      themeColor: CommonConstant.primaryColor,
      selectedAssets: selectedAssets,
      sortPathDelegate: const CustomSortPathDelegate(),
      maxAssets: maxAssets,
    );
    if (imgs == null) {
      return Future.value([]);
    }
    return Future.value(imgs);
  }
}

/// 修改相册名称
class CustomSortPathDelegate extends CommonSortPathDelegate {
  const CustomSortPathDelegate();
  @override
  void sort(List<AssetPathEntity> list) {
    for (final AssetPathEntity entity in list) {
      if (entity.isAll) {
        entity.name = "最近";
      }
      if (entity.name.toLowerCase() == "screenshots") {
        entity.name = "截屏";
      }
      if (entity.name.toLowerCase() == "camera") {
        entity.name = "相机";
      }
    }
  }
}
