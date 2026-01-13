part of 'app_core.dart';

/// **Model**
/// **Enum**
/// **Data**

class FontSizeModel {
  final double dl, dm, ds, hl, hm, hs, tl, tm, ts, ll, lm, ls, bl, bm, bs;
  FontSizeModel({
    required this.dl,
    required this.dm,
    required this.ds,
    required this.hl,
    required this.hm,
    required this.hs,
    required this.tl,
    required this.tm,
    required this.ts,
    required this.ll,
    required this.lm,
    required this.ls,
    required this.bl,
    required this.bm,
    required this.bs,
  });
}

class DeviceModel {
  final int watch, phone, tablet, desktop;
  DeviceModel({
    required this.watch,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });
}
// Widget Model

class SpaceHeightWidget {
  final Widget h4, h5, h8, h10, h12, h15, h16, h20, h25, h30;
  SpaceHeightWidget(this.h4, this.h5, this.h8, this.h10, this.h12, this.h15,
      this.h16, this.h20, this.h25, this.h30);
  add(double value) => value.height;
}

class SpaceWidthWidget {
  final Widget w4, w5, w8, w10, w12, w15, w16, w20, w25, w30;
  SpaceWidthWidget(this.w4, this.w5, this.w8, this.w10, this.w12, this.w15,
      this.w16, this.w20, this.w25, this.w30);
  add(double value) => value.width;
}

// EdgeInsets Model

class SpaceEdgeTop {
  final EdgeInsets t4, t5, t8, t10, t12, t15, t16, t20, t25, t30;
  SpaceEdgeTop(this.t4, this.t5, this.t8, this.t10, this.t12, this.t15,
      this.t16, this.t20, this.t25, this.t30);
}

class SpaceEdgeBottom {
  final EdgeInsets b4, b5, b8, b10, b12, b15, b16, b20, b25, b30;
  SpaceEdgeBottom(this.b4, this.b5, this.b8, this.b10, this.b12, this.b15,
      this.b16, this.b20, this.b25, this.b30);
}

class SpaceEdgeRight {
  final EdgeInsets r4, r5, r8, r10, r12, r15, r16, r20, r25, r30;
  SpaceEdgeRight(this.r5, this.r10, this.r15, this.r20, this.r25, this.r30,
      this.r4, this.r8, this.r12, this.r16);
}

class SpaceEdgeLeft {
  final EdgeInsets l4, l5, l8, l10, l12, l15, l16, l20, l25, l30;
  SpaceEdgeLeft(
    this.l4,
    this.l5,
    this.l8,
    this.l10,
    this.l12,
    this.l15,
    this.l16,
    this.l20,
    this.l25,
    this.l30,
  );
}

class SpaceEdgeAll {
  final EdgeInsets a4, a5, a8, a10, a12, a15, a16, a20, a25, a30;
  SpaceEdgeAll(
    this.a4,
    this.a5,
    this.a8,
    this.a10,
    this.a12,
    this.a15,
    this.a16,
    this.a20,
    this.a25,
    this.a30,
  );
}

class SpaceEdgeVertical {
  final EdgeInsets v4, v5, v8, v10, v12, v15, v16, v20, v25, v30;
  SpaceEdgeVertical(
    this.v4,
    this.v5,
    this.v8,
    this.v10,
    this.v12,
    this.v15,
    this.v16,
    this.v20,
    this.v25,
    this.v30,
  );
}

class SpaceEdgeHorizontal {
  final EdgeInsets d, h4, h5, h8, h10, h12, h15, h16, h20, h25, h30;
  SpaceEdgeHorizontal(
      {required this.d,
      required this.h4,
      required this.h5,
      required this.h8,
      required this.h10,
      required this.h12,
      required this.h15,
      required this.h16,
      required this.h20,
      required this.h25,
      required this.h30});
}

class IconSizeModel {
  final double l, m, s;
  IconSizeModel({
    required this.l,
    required this.m,
    required this.s,
  });
}

/// **Enum**
enum DeviceTypes { watch, phone, tablet, desktop }

/// **Data**
///
/// * For spacing
_height() => SpaceHeightWidget(
      4.0.height,
      5.0.height,
      8.0.height,
      10.0.height,
      12.0.height,
      15.0.height,
      16.0.height,
      20.0.height,
      25.0.height,
      35.0.height,
    );
_widget() => SpaceWidthWidget(
      4.0.width,
      5.0.width,
      8.0.width,
      10.0.width,
      12.0.width,
      15.0.width,
      16.0.width,
      20.0.width,
      25.0.width,
      30.0.width,
    );

_all() => SpaceEdgeAll(
      4.0.all,
      5.0.all,
      8.0.all,
      10.0.all,
      12.0.all,
      15.0.all,
      16.0.all,
      20.0.all,
      25.0.all,
      30.0.all,
    );

_top() => SpaceEdgeTop(
      4.0.top,
      5.0.top,
      8.0.top,
      10.0.top,
      12.0.top,
      15.0.top,
      16.0.top,
      20.0.top,
      25.0.top,
      30.0.top,
    );

_right() => SpaceEdgeRight(
      4.0.right,
      5.0.right,
      8.0.right,
      10.0.right,
      12.0.right,
      15.0.right,
      16.0.right,
      20.0.right,
      25.0.right,
      30.0.right,
    );

_left() => SpaceEdgeLeft(
      4.0.left,
      5.0.left,
      8.0.left,
      10.0.left,
      12.0.left,
      15.0.left,
      16.0.left,
      20.0.left,
      25.0.left,
      30.0.left,
    );

_bottom() => SpaceEdgeBottom(
      4.0.bottom,
      5.0.bottom,
      8.0.bottom,
      10.0.bottom,
      12.0.bottom,
      15.0.bottom,
      16.0.bottom,
      20.0.bottom,
      25.0.bottom,
      30.0.bottom,
    );

_horizontal() => SpaceEdgeHorizontal(
      d: 14.0.horizontal,
      h4: 4.0.horizontal,
      h5: 5.0.horizontal,
      h8: 8.0.horizontal,
      h10: 10.0.horizontal,
      h12: 12.0.horizontal,
      h15: 15.0.horizontal,
      h16: 16.0.horizontal,
      h20: 20.0.horizontal,
      h25: 25.0.horizontal,
      h30: 30.0.horizontal,
    );

_vertical() => SpaceEdgeVertical(
      4.0.vertical,
      5.0.vertical,
      8.0.vertical,
      10.0.vertical,
      12.0.vertical,
      15.0.vertical,
      16.0.vertical,
      20.0.vertical,
      25.0.vertical,
      30.0.vertical,
    );
