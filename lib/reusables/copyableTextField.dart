import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paperwallet_generator/Settings.dart';

class CopyableTextField extends StatefulWidget {
  String data;
  String title;
  double size;
  CopyableTextField(@required this.title, @required this.data, @required this.size);

  @override
  _CopyableTextFieldState createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  TextEditingController _textController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _textController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Settings.generateButtonColor,
        content: Container(child: Text('Copied to clipboard', style: Settings.generateButtonStyle,),),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.text = widget.data;
  }


  @override
  Widget build(BuildContext context) {
    _textController.text = widget.data;
    return Column(
      children: [
      widget.title != "" ?  AutoSizeText(widget.title , style: Settings.titleStyle,) : Container(),
        SizedBox(height: widget.size,),
        TextField(
          readOnly: true,
          controller: _textController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            icon: IconButton(
              icon: Icon(Icons.copy, color: Settings.generateButtonColor,),
              onPressed: _copyToClipboard,
            ),
          ),
        ),
      ],
    );
  }
}
