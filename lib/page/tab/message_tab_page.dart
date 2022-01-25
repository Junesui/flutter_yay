import 'package:flutter/material.dart';
import 'package:imitate_yay/util/photo_view_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> with AutomaticKeepAliveClientMixin {
  List<String> imgUrls = [];

  @override
  void initState() {
    super.initState();
    imgUrls.add("https://picsum.photos/id/2/200/400");
    imgUrls.add("https://picsum.photos/id/100/200/300");
    imgUrls.add("https://picsum.photos/id/1000/200/300");
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SizedBox(
        child: InkWell(
          onTap: () {
            PhotoViewUtil.view(context, imgUrls, 0);
          },
          child: const Center(
            child: MyText(
              text: "text",
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
