import 'package:project_two/src/common/screenutil/screenutil.dart';

extension SizeExtension on num {
  num get w => ScreenUtil().setWidth(this);

  num get h => ScreenUtil().setHeight(this);

  num get sp => ScreenUtil().setSp(this);
}
