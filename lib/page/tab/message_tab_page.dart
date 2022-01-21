import 'package:flutter/material.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        height: 800,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) {
            return Column(
              children: [
                _buildListBuild(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          _scrollController.jumpTo(0);
        },
        icon: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _buildListBuild() {
    return SizedBox(
      height: 500,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: 1000,
          itemBuilder: (context, index) {
            // print("test --> $index");
            return Container(
              height: 100,
              color: Colors.primaries[index % 18],
              child: Center(
                child: Text("$index"),
              ),
            );
          }),
    );
  }
}
