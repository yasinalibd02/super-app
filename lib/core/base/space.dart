part of 'app_core.dart';

class Space {
  static late SpaceHeightWidget height;
  static late SpaceWidthWidget width;
  static late SpaceEdgeAll all;
  static late SpaceEdgeTop top;
  static late SpaceEdgeRight right;
  static late SpaceEdgeLeft left;
  static late SpaceEdgeBottom bottom;
  static late SpaceEdgeHorizontal horizontal;
  static late SpaceEdgeVertical vertical;
  static late EdgeInsets zero;

  static void init() {
    height = _height();
    width = _widget();
    all = _all();
    top = _top();
    right = _right();
    left = _left();
    bottom = _bottom();
    horizontal = _horizontal();
    vertical = _vertical();
    zero = EdgeInsets.zero;
  }
}

extension SupperDouble on double {
  //-> Space
  get height => SizedBox(height: v);
  get width => SizedBox(width: h);
  get top => EdgeInsets.only(top: v);
  get right => EdgeInsets.only(right: h);
  get left => EdgeInsets.only(left: h);
  get bottom => EdgeInsets.only(bottom: v);
  get horizontal => EdgeInsets.symmetric(horizontal: h);
  get vertical => EdgeInsets.symmetric(vertical: v);
  get all => EdgeInsets.only(
        left: h,
        top: v,
        right: h,
        bottom: v,
      );
}
