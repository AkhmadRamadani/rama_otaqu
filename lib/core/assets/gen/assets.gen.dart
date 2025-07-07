/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/brands
  $AssetsImagesBrandsGen get brands => const $AssetsImagesBrandsGen();

  /// Directory path: assets/images/illustrations
  $AssetsImagesIllustrationsGen get illustrations => const $AssetsImagesIllustrationsGen();

  /// Directory path: assets/images/statics
  $AssetsImagesStaticsGen get statics => const $AssetsImagesStaticsGen();
}

class $AssetsImagesBrandsGen {
  const $AssetsImagesBrandsGen();

  /// File path: assets/images/brands/otaqu_banner.png
  AssetGenImage get otaquBanner => const AssetGenImage('assets/images/brands/otaqu_banner.png');

  /// File path: assets/images/brands/otaqu_logo.png
  AssetGenImage get otaquLogo => const AssetGenImage('assets/images/brands/otaqu_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [otaquBanner, otaquLogo];
}

class $AssetsImagesIllustrationsGen {
  const $AssetsImagesIllustrationsGen();

  /// File path: assets/images/illustrations/afternoon_illustration.png
  AssetGenImage get afternoonIllustration =>
      const AssetGenImage('assets/images/illustrations/afternoon_illustration.png');

  /// File path: assets/images/illustrations/evening_illustration.png
  AssetGenImage get eveningIllustration =>
      const AssetGenImage('assets/images/illustrations/evening_illustration.png');

  /// File path: assets/images/illustrations/illustration_board_1.png
  AssetGenImage get illustrationBoard1 =>
      const AssetGenImage('assets/images/illustrations/illustration_board_1.png');

  /// File path: assets/images/illustrations/illustration_board_2.png
  AssetGenImage get illustrationBoard2 =>
      const AssetGenImage('assets/images/illustrations/illustration_board_2.png');

  /// File path: assets/images/illustrations/illustration_board_3.png
  AssetGenImage get illustrationBoard3 =>
      const AssetGenImage('assets/images/illustrations/illustration_board_3.png');

  /// File path: assets/images/illustrations/illustration_board_4.png
  AssetGenImage get illustrationBoard4 =>
      const AssetGenImage('assets/images/illustrations/illustration_board_4.png');

  /// File path: assets/images/illustrations/morning_illustration.png
  AssetGenImage get morningIllustration =>
      const AssetGenImage('assets/images/illustrations/morning_illustration.png');

  /// File path: assets/images/illustrations/night_illustration.png
  AssetGenImage get nightIllustration =>
      const AssetGenImage('assets/images/illustrations/night_illustration.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    afternoonIllustration,
    eveningIllustration,
    illustrationBoard1,
    illustrationBoard2,
    illustrationBoard3,
    illustrationBoard4,
    morningIllustration,
    nightIllustration,
  ];
}

class $AssetsImagesStaticsGen {
  const $AssetsImagesStaticsGen();

  /// Directory path: assets/images/statics/promos
  $AssetsImagesStaticsPromosGen get promos => const $AssetsImagesStaticsPromosGen();
}

class $AssetsImagesStaticsPromosGen {
  const $AssetsImagesStaticsPromosGen();

  /// File path: assets/images/statics/promos/promo_1.png
  AssetGenImage get promo1 => const AssetGenImage('assets/images/statics/promos/promo_1.png');

  /// File path: assets/images/statics/promos/promo_2.jpeg
  AssetGenImage get promo2 => const AssetGenImage('assets/images/statics/promos/promo_2.jpeg');

  /// File path: assets/images/statics/promos/promo_3.png
  AssetGenImage get promo3 => const AssetGenImage('assets/images/statics/promos/promo_3.png');

  /// File path: assets/images/statics/promos/promo_4.jpeg
  AssetGenImage get promo4 => const AssetGenImage('assets/images/statics/promos/promo_4.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [promo1, promo2, promo3, promo4];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
