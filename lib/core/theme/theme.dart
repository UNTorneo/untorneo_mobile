import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<CustomTheme, ThemeData>((ref) {
  return CustomTheme();
});

class CustomTheme extends StateNotifier<ThemeData> {
  CustomTheme()
      : super(
          ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.deepOrange,
            listTileTheme: const ListTileThemeData(
              minLeadingWidth: 5,
              horizontalTitleGap: 8,
            ),
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        );

  void changeSeedColor(Color color) {
    state = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: color,
      listTileTheme: const ListTileThemeData(
        minLeadingWidth: 5,
        horizontalTitleGap: 8,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  // [TEXT STYLES]
  static const sectionTitleStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
  TextStyle get selectedItemTextStyle =>
      TextStyle(fontWeight: FontWeight.w600, color: state.primaryColor);
  // [BOX DECORATIONS]
  BoxDecoration get drawerBoxDecoration => BoxDecoration(
        color: state.cardColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      );
  BoxDecoration get roundedBoxDecoration => BoxDecoration(
        color: state.cardColor,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      );
  // [PADDINGS]
  static const drawerBodyPadding = EdgeInsets.symmetric(horizontal: 20);
  static const dialogPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 15);
  static const cardMargin = EdgeInsets.symmetric(vertical: 5);
  // [COLORS]
  static const greyColor = Color(0xff67727d);
  static final redColor = Colors.red[700];
}
