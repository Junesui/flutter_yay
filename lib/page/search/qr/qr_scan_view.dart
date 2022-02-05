import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/router/router_name.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/util/toast_util.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanView extends StatefulWidget {
  const QRScanView({Key? key}) : super(key: key);

  @override
  _QRScanViewState createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> {
  final GlobalKey qrKey = GlobalKey();
  Barcode? _result;
  QRViewController? _qrViewController;

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildQRView(),
        Align(
          alignment: const Alignment(0, 0.6),
          child: MyText(
            text: "扫一扫添加好友",
            fontSize: SU.setFontSize(120),
          ),
        ),
      ],
    );
  }

  /// QR扫描区域
  _buildQRView() {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: CommonConstant.primaryColor,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: SU.getScreenWidth() * 0.6,
      ),
      onPermissionSet: (qrViewController, perms) =>
          _onPermissionSet(context, qrViewController, perms),
    );
  }

  /// QR初始化
  _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _result = scanData;
        print("-----> ${describeEnum(_result!.format)} -- ${_result!.code} ");
      });
    });
  }

  /// 获取权限
  _onPermissionSet(BuildContext context, QRViewController qrViewController, bool perms) {
    if (!perms) {
      Navigator.of(context).pushReplacementNamed(RouterName.qr);
      ToastUtil.show(msg: "需要相机权限扫描二维码", toastLength: Toast.LENGTH_LONG);
    }
  }
}
