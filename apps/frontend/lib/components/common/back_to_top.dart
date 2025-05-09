import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackToTopButton extends StatefulWidget {
  @override
  _BackToTopButtonState createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  void _scrollListener(ScrollController controller) {
    if (controller.offset >= 200) {
      setState(() {
        _isVisible = true;
      });
    } else {
      setState(() {
        _isVisible = false;
      });
    }
  }

  void _scrollToTop(ScrollController controller) {
    controller.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = PrimaryScrollController.of(context)!;

    controller.addListener(() => _scrollListener(controller));

    return Visibility(
      visible: _isVisible,
      child: FloatingActionButton(
        onPressed: () => _scrollToTop(controller),
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
