import '../imports.dart';

class MyStyles {
  static const textListStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(34, 34, 59, 1),
  );

  static googleTextListTile(double size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: MyColors.textColor,
    );
  }

  static googleTextSubtitleListTile(double size) {
    return GoogleFonts.poppins(
      fontSize: size,
      color: MyColors.subtitleColor,
      fontWeight: FontWeight.w600,
    );
  }

  static googleTitleText(double size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: MyColors.textColor,
    );
  }

  static googleSecondTitleText(double size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: MyColors.textColor,
    );
  }

  static underlinedGreyText(double size) {
    return GoogleFonts.poppins(
      fontSize: size,
      color: MyColors.subtitleColor,
      decoration: TextDecoration.underline,
    );
  }

  static final googleTextFieldLabelStyle = GoogleFonts.poppins(
    color: MyColors.buttonColor,
    fontWeight: FontWeight.w600,
  );
  static final btnTextStyle = GoogleFonts.poppins(
    color: Colors.white,
  );
}
