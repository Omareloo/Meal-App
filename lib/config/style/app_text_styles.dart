import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTextStyle {
  ///FontSize
  static final TextStyle _fontSize28 = TextStyle(fontSize: 28.sp);

  static final TextStyle _fontSize24 = TextStyle(fontSize: 24.sp);

  static final TextStyle _fontSize21 = TextStyle(fontSize: 21.sp);

  static final TextStyle _fontSize18 = TextStyle(fontSize: 18.sp);


  static final TextStyle _fontSize16 = TextStyle(fontSize: 16.sp);

  static final TextStyle _fontSize14 = TextStyle(fontSize: 14.sp);

  static final TextStyle _fontSize13 = TextStyle(fontSize: 13.sp);

  static final TextStyle _fontSize12 = TextStyle(fontSize: 12.sp);




  ///FontWeight
  static const TextStyle _fontWeight700 =
  TextStyle(fontWeight: FontWeight.w700);
  static const TextStyle _fontWeight500 =
  TextStyle(fontWeight: FontWeight.w500);
  static const TextStyle _fontWeight400 =
  TextStyle(fontWeight: FontWeight.w400);

  ///Font Family
  static const TextStyle _fontCairo = TextStyle(fontFamily: "cairo", height: 1);

  ///FontStyle

  static TextStyle font28black700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize28)
      .copyWith(color: AppColor.black);

  static TextStyle font24white700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize24)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.white);

  static TextStyle font24black700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize24)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.black);

  static TextStyle font21background700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize21)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.backGround);

  static TextStyle font18black700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize18)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.black);

  static TextStyle font18background700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize18)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.backGround);

  static TextStyle font18black400 = _fontCairo
      .merge(_fontWeight400)
      .merge(_fontSize18)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.black);

  static TextStyle font16blue700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize16)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.blue);

  static TextStyle font16white400 = _fontCairo
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.white);


  static TextStyle font16black700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);

  static TextStyle font16darkGrey500 = _fontCairo
      .merge(_fontWeight500)
      .merge(_fontSize16)
      .copyWith(color: AppColor.grey);

  static TextStyle font16black500 = _fontCairo
      .merge(_fontWeight500)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);

  static TextStyle font16black400 = _fontCairo
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.black);

  static TextStyle font16grey400 = _fontCairo
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColor.grey);

  static TextStyle font16white700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize16)
      .merge(_fontWeightBold)
      .copyWith(color: AppColor.white);

  static TextStyle font16primary700 = _fontCairo
      .merge(_fontWeight700)
      .merge(_fontSize16)
      .copyWith(color: AppColor.primary);

  static TextStyle font14grey500 = _fontCairo
      .merge(_fontWeight500)
      .merge(_fontSize14)
      .copyWith(color: AppColor.grey);

  static TextStyle font14primary500 = _fontCairo
      .merge(_fontWeight500)
      .merge(_fontSize14)
      .copyWith(color: AppColor.primary);

  static TextStyle font14black400 = _fontCairo
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColor.black);

  static TextStyle font13white400 = _fontCairo
      .merge(_fontWeight400)
      .merge(_fontSize13)
      .copyWith(color: AppColor.white);


  static TextStyle font12grayGray500 = _fontCairo
      .merge(_fontWeight500)
      .merge(_fontSize12)
      .copyWith(color: AppColor.grey);

  static TextStyle? _fontWeightBold;





}
