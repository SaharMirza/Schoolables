import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';

class TitleText extends StatelessWidget {
    TitleText({
    Key? key,
    required this.text,
      required this.align,
  required this.size

  }) : super(key: key);

  final String text;
  final TextAlign align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: MyStyles.googleTitleText(size),
        textAlign: align,
      )
    );
  }

}
class SecondTitleText extends StatelessWidget {
  SecondTitleText({
    Key? key,
    required this.text,
    required this.align,
    required this.size

  }) : super(key: key);

  final String text;
  final TextAlign align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          text,
          style: MyStyles.googleSecondTitleText(size),
          textAlign: align,
        )
    );
  }

}

class SubtitleText extends StatelessWidget {
  SubtitleText({
    Key? key,
    required this.text,
    required this.align,
    required this.size

  }) : super(key: key);

  final String text;
  final TextAlign align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          text,
          style: MyStyles.googleTextSubtitleListTile(size),
          textAlign: align,
        )
    );
  }

}


class ListtitleText extends StatelessWidget {
  ListtitleText({
    Key? key,
    required this.text,
    required this.align,
    required this.size

  }) : super(key: key);

  final String text;
  final TextAlign align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          text,
          style: MyStyles.googleTextListTile(size),
          textAlign: align,
        )
    );
  }

}

class SubtitleListTileText extends StatelessWidget {
  SubtitleListTileText({
    Key? key,
    required this.text,
    required this.align,
    required this.size

  }) : super(key: key);

  final String text;
  final TextAlign align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
          text,
          style: MyStyles.googleTextSubtitleListTile(size),
          textAlign: align,
        )
    );
  }

}