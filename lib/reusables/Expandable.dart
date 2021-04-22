import 'package:auto_size_text/auto_size_text.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';

import '../Settings.dart';

class Expandable extends StatelessWidget {
  final String title;
  final String text;
  final double width;
  const Expandable({Key key, this.title, this.text, this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Card(
        color: Settings.generateButtonColor,
        child: Column(
          children: [
            SizedBox(height: 10,),
          AutoSizeText(title,
          style: Settings.textStyle,
          maxLines: 1,),
            SizedBox(height: 10,),
            ExpandChild(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  child: AutoSizeText(text , style: Settings.textStyle,),
                ),
              ),
              arrowColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
