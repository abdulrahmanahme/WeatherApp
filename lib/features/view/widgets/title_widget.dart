import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
   required this.title,
   this.color
  });
 final String title;
 final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
       title ,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(
              color:color ??Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'flutterfonts',
            ),
      ),
    );
  }
}