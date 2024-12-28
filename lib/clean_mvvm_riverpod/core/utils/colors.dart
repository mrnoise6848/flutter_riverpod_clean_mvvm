import 'dart:ui';

import '../../../main.dart';
import '../lang/en_lang.dart';

const background = Color(0xffffffff);
const gray796 = Color(0xff7b96a3);
const gray566 = Color(0xff566f7c);
const gray462 = Color(0xff4b626d);
const grayE0 = Color(0xffE0E0E0);
const gray6C = Color(0xff6C6C6C);
const grayB5 = Color(0xffB5BEC6);
const button = Color(0xff546E7A);
const black = Color(0xFF000000);
const white = Color(0xFFFFFFFF);
const container = Color(0xFFCCE8E4);
const blue = Color(0xFF0086CD);
const colorF9F9 = Color(0xFFF9F9F9);
const colorD8D8 = Color(0xFFD8D8D8);
const colorDarkGreen = Color(0xFF258133);
const colorDarkBlue = Color(0xFF183B56);
const colorCyan = Color(0xFF22A8A8);
const colorC7C9D9 = Color(0xFFC7C9D9);
const color8F90A6 = Color(0xFF8F90A6);
const colorF7F8FA = Color(0xFFF7F8FA);
const color808285 = Color(0xFF808285);
const color28293D = Color(0xFF28293D);
const colorF1F2F6 = Color(0xFFF1F2F6);
const color555770 = Color(0xFF555770);
const colorF9FAFA = Color(0xFFF9FAFA);
const color69727D = Color(0xFF69727D);
const colorDADADA = Color(0xFFDADADA);
const colorE4E4EB = Color(0xFFE4E4EB);
const colorGold = Color(0xFFFFD700);
const colorYellowLight = Color(0xFFF3D08E);
const colorYellowLightTwo = Color(0xFFE0BA73);
const colorOrange = Color(0xFFF57C00);
const colorRed = Color(0xFFE40914);
const colorPurple = Color(0xFF9C27B0);
const color0f151b = Color(0xFF0f151b);
const color798186 = Color(0xFF798186);
const colorDEDEDE = Color(0xFFDEDEDE);
const colorLightPink = Color(0xFFFDF6F7);
const colorF8 = Color(0xFFF5F6FA);
const colorFFF4DB = Color(0xFFFFF4DB);
const colorFAFAFA = Color(0xFFFAFAFA);
Color colorFFFCFCFF = Color(L == EnLang() ?  0xFFFCFCFF : 0xFFFAFAFA);



Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}