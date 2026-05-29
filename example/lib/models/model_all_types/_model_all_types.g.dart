//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: invalid_null_aware_operator
// ignore_for_file: overridden_fields
// ignore_for_file: require_trailing_commas
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_question_mark

part of 'model_all_types.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Comprehensive fixture exercising every mapper.
class ModelAllTypes extends _ModelAllTypes {
  //
  //
  //

  /// The runtime type of this class as a String.
  static const CLASS_NAME = 'ModelAllTypes';

  @override
  String get $className => CLASS_NAME;

  /// No description provided.
  final dynamic? anyValue;

  /// No description provided.
  final String? name;

  /// No description provided.
  final bool? active;

  /// No description provided.
  final int? count;

  /// No description provided.
  final double? ratio;

  /// No description provided.
  final num? amount;

  /// No description provided.
  final DateTime? createdAt;

  /// No description provided.
  final Duration? interval;

  /// No description provided.
  final Uri? homepage;

  /// No description provided.
  final Color? themeColor;

  /// No description provided.
  final Timestamp? stamp;

  /// No description provided.
  final DataRefModel? ownerRef;

  /// No description provided.
  final PaymentModel? payment;

  /// No description provided.
  final ColorEnum? shade;

  /// No description provided.
  final BigInt? bigCount;

  /// No description provided.
  final Uint8List? blob;

  /// No description provided.
  final RegExp? regex;

  /// No description provided.
  final Offset? origin;

  /// No description provided.
  final Size? canvasSize;

  /// No description provided.
  final Rect? bounds;

  /// No description provided.
  final EdgeInsets? padding;

  /// No description provided.
  final Alignment? anchor;

  /// No description provided.
  final Radius? corner;

  /// No description provided.
  final String? trimmed;

  /// No description provided.
  final String? noSpaces;

  /// No description provided.
  final String? searchable;

  /// No description provided.
  final String? lower;

  /// No description provided.
  final String? upper;

  /// No description provided.
  final String? lowerSnake;

  /// No description provided.
  final String? upperSnake;

  /// No description provided.
  final String? lowerKebab;

  /// No description provided.
  final String? upperKebab;

  /// No description provided.
  final String? camel;

  /// No description provided.
  final String? pascal;

  /// No description provided.
  final String? tLower;

  /// No description provided.
  final String? tUpper;

  /// No description provided.
  final String? tLowerSnake;

  /// No description provided.
  final String? tUpperSnake;

  /// No description provided.
  final String? tLowerKebab;

  /// No description provided.
  final String? tUpperKebab;

  /// No description provided.
  final String? tCamel;

  /// No description provided.
  final String? tPascal;

  /// No description provided.
  final List<String>? tags;

  /// No description provided.
  final Set<bool>? flags;

  /// No description provided.
  final Iterable<int>? scores;

  /// No description provided.
  final Map<String, double>? lookup;

  /// No description provided.
  final Queue<String>? todo;

  /// No description provided.
  final List<List<int>>? matrix;

  /// No description provided.
  final Map<String, List<int>>? groupedColors;

  /// No description provided.
  final Map<String, Map<String, int>>? nestedMap;

  /// No description provided.
  final List<ModelUser>? users;

  /// No description provided.
  final Map<String, String>? localized;

  /// Constructs a new instance of [ModelAllTypes]
  /// from optional and required parameters.
  const ModelAllTypes({
    required this.anyValue,
    this.name,
    this.active,
    this.count,
    this.ratio,
    this.amount,
    this.createdAt,
    this.interval,
    this.homepage,
    this.themeColor,
    this.stamp,
    this.ownerRef,
    this.payment,
    this.shade,
    this.bigCount,
    this.blob,
    this.regex,
    this.origin,
    this.canvasSize,
    this.bounds,
    this.padding,
    this.anchor,
    this.corner,
    this.trimmed,
    this.noSpaces,
    this.searchable,
    this.lower,
    this.upper,
    this.lowerSnake,
    this.upperSnake,
    this.lowerKebab,
    this.upperKebab,
    this.camel,
    this.pascal,
    this.tLower,
    this.tUpper,
    this.tLowerSnake,
    this.tUpperSnake,
    this.tLowerKebab,
    this.tUpperKebab,
    this.tCamel,
    this.tPascal,
    this.tags,
    this.flags,
    this.scores,
    this.lookup,
    this.todo,
    this.matrix,
    this.groupedColors,
    this.nestedMap,
    this.users,
    this.localized,
  });

  /// Construcs a new instance of [ModelAllTypes],
  /// forcing all parameters to be optional.
  const ModelAllTypes.optional({
    this.anyValue,
    this.name,
    this.active,
    this.count,
    this.ratio,
    this.amount,
    this.createdAt,
    this.interval,
    this.homepage,
    this.themeColor,
    this.stamp,
    this.ownerRef,
    this.payment,
    this.shade,
    this.bigCount,
    this.blob,
    this.regex,
    this.origin,
    this.canvasSize,
    this.bounds,
    this.padding,
    this.anchor,
    this.corner,
    this.trimmed,
    this.noSpaces,
    this.searchable,
    this.lower,
    this.upper,
    this.lowerSnake,
    this.upperSnake,
    this.lowerKebab,
    this.upperKebab,
    this.camel,
    this.pascal,
    this.tLower,
    this.tUpper,
    this.tLowerSnake,
    this.tUpperSnake,
    this.tLowerKebab,
    this.tUpperKebab,
    this.tCamel,
    this.tPascal,
    this.tags,
    this.flags,
    this.scores,
    this.lookup,
    this.todo,
    this.matrix,
    this.groupedColors,
    this.nestedMap,
    this.users,
    this.localized,
  });

  /// Constructs a new instance of [ModelAllTypes],
  /// and asserts that all required parameters are not null.
  factory ModelAllTypes.assertRequired({
    dynamic? anyValue,
    String? name,
    bool? active,
    int? count,
    double? ratio,
    num? amount,
    DateTime? createdAt,
    Duration? interval,
    Uri? homepage,
    Color? themeColor,
    Timestamp? stamp,
    DataRefModel? ownerRef,
    PaymentModel? payment,
    ColorEnum? shade,
    BigInt? bigCount,
    Uint8List? blob,
    RegExp? regex,
    Offset? origin,
    Size? canvasSize,
    Rect? bounds,
    EdgeInsets? padding,
    Alignment? anchor,
    Radius? corner,
    String? trimmed,
    String? noSpaces,
    String? searchable,
    String? lower,
    String? upper,
    String? lowerSnake,
    String? upperSnake,
    String? lowerKebab,
    String? upperKebab,
    String? camel,
    String? pascal,
    String? tLower,
    String? tUpper,
    String? tLowerSnake,
    String? tUpperSnake,
    String? tLowerKebab,
    String? tUpperKebab,
    String? tCamel,
    String? tPascal,
    List<String>? tags,
    Set<bool>? flags,
    Iterable<int>? scores,
    Map<String, double>? lookup,
    Queue<String>? todo,
    List<List<int>>? matrix,
    Map<String, List<int>>? groupedColors,
    Map<String, Map<String, int>>? nestedMap,
    List<ModelUser>? users,
    Map<String, String>? localized,
  }) {
    assert(anyValue != null);

    return ModelAllTypes(
      anyValue: anyValue,
      name: name,
      active: active,
      count: count,
      ratio: ratio,
      amount: amount,
      createdAt: createdAt,
      interval: interval,
      homepage: homepage,
      themeColor: themeColor,
      stamp: stamp,
      ownerRef: ownerRef,
      payment: payment,
      shade: shade,
      bigCount: bigCount,
      blob: blob,
      regex: regex,
      origin: origin,
      canvasSize: canvasSize,
      bounds: bounds,
      padding: padding,
      anchor: anchor,
      corner: corner,
      trimmed: trimmed,
      noSpaces: noSpaces,
      searchable: searchable,
      lower: lower,
      upper: upper,
      lowerSnake: lowerSnake,
      upperSnake: upperSnake,
      lowerKebab: lowerKebab,
      upperKebab: upperKebab,
      camel: camel,
      pascal: pascal,
      tLower: tLower,
      tUpper: tUpper,
      tLowerSnake: tLowerSnake,
      tUpperSnake: tUpperSnake,
      tLowerKebab: tLowerKebab,
      tUpperKebab: tUpperKebab,
      tCamel: tCamel,
      tPascal: tPascal,
      tags: tags,
      flags: flags,
      scores: scores,
      lookup: lookup,
      todo: todo,
      matrix: matrix,
      groupedColors: groupedColors,
      nestedMap: nestedMap,
      users: users,
      localized: localized,
    );
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelAllTypes.from(
    BaseModel another,
  ) {
    try {
      return fromOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelAllTypes.from: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelAllTypes? fromOrNull(
    BaseModel? another,
  ) {
    return fromJsonOrNull(another?.toJson())!;
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from the fields of [another] instance. Throws if the conversion fails.
  factory ModelAllTypes.of(
    ModelAllTypes another,
  ) {
    try {
      return ofOrNull(another)!;
    } catch (e) {
      assert(false, '$ModelAllTypes.of: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from the fields of [another] instance. Returns `null` if [another] is
  /// `null` or if the conversion fails.
  @pragma('vm:prefer-inline')
  static ModelAllTypes? ofOrNull(
    ModelAllTypes? other,
  ) {
    return fromJsonOrNull(other?.toJson());
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from [jsonString], which must be a valid JSON String. Throws if the
  /// conversion fails.
  factory ModelAllTypes.fromJsonString(
    String jsonString,
  ) {
    try {
      return fromJsonStringOrNull(jsonString)!;
    } catch (e) {
      assert(false, '$ModelAllTypes.fromJsonString: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from [jsonString], which must be a valid JSON String. Returns `null` if
  /// [jsonString] is `null` or if the conversion fails.
  static ModelAllTypes? fromJsonStringOrNull(
    String? jsonString,
  ) {
    try {
      if (jsonString!.isNotEmpty) {
        final decoded = letMapOrNull<String, dynamic>(jsonDecode(jsonString));
        return ModelAllTypes.fromJson(decoded);
      } else {
        return ModelAllTypes.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from [json], which must be a valid JSON object. Throws if the conversion
  /// fails.
  factory ModelAllTypes.fromJson(
    Map<String, dynamic>? json,
  ) {
    try {
      return fromJsonOrNull(json)!;
    } catch (e) {
      assert(false, '$ModelAllTypes.fromJson: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from [json], which must be a valid JSON object. Returns `null` if
  /// [json] is `null` or if the conversion fails.
  static ModelAllTypes? fromJsonOrNull(
    Map<String, dynamic>? json,
  ) {
    try {
      final anyValue = json?['anyValue'];
      final name = json?['name']?.toString().trim().nullIfEmpty;
      final active = letAsOrNull<bool>(json?['active']);
      final count = letAsOrNull<int>(json?['count']);
      final ratio = letAsOrNull<double>(json?['ratio']);
      final amount = letAsOrNull<num>(json?['amount']);
      final createdAt = () {
        final a = json?['createdAt']?.toString().trim().nullIfEmpty;
        return a != null ? DateTime.tryParse(a)?.toUtc() : null;
      }();
      final interval = () {
        final a = letAsOrNull<int>(json?['interval']);
        return a != null ? Duration(microseconds: a) : null;
      }();
      final homepage = () {
        final a = json?['homepage']?.toString().trim().nullIfEmpty;
        return a != null ? Uri.tryParse(a) : null;
      }();
      final themeColor = () {
        final a = letAsOrNull<int>(json?['themeColor']);
        return a != null ? Color(a) : null;
      }();
      final stamp = letAsOrNull<Timestamp>(json?['stamp']);
      final ownerRef = dataRefFromString(json?['ownerRef']?.toString());
      final payment = () {
        final a = letMapOrNull<String, dynamic>(json?['payment']);
        return a != null ? PaymentModel.fromJson(a) : null;
      }();
      final shade = ColorEnum.values.valueOf(json?['shade']?.toString());
      final bigCount = () {
        final a = json?['bigCount']?.toString().trim().nullIfEmpty;
        return a != null ? BigInt.tryParse(a) : null;
      }();
      final blob = () {
        final a = json?['blob']?.toString().trim().nullIfEmpty;
        if (a == null) return null;
        try {
          return base64Decode(a);
        } catch (_) {
          return null;
        }
      }();
      final regex = () {
        final a = json?['regex']?.toString().trim().nullIfEmpty;
        if (a == null) return null;
        try {
          return RegExp(a);
        } catch (_) {
          return null;
        }
      }();
      final origin = () {
        final a = letMapOrNull<String, dynamic>(json?['origin']);
        return a != null
            ? Offset(letAsOrNull<double>(a['dx']) ?? 0.0,
                letAsOrNull<double>(a['dy']) ?? 0.0)
            : null;
      }();
      final canvasSize = () {
        final a = letMapOrNull<String, dynamic>(json?['canvasSize']);
        return a != null
            ? Size(letAsOrNull<double>(a['width']) ?? 0.0,
                letAsOrNull<double>(a['height']) ?? 0.0)
            : null;
      }();
      final bounds = () {
        final a = letMapOrNull<String, dynamic>(json?['bounds']);
        return a != null
            ? Rect.fromLTRB(
                letAsOrNull<double>(a['left']) ?? 0.0,
                letAsOrNull<double>(a['top']) ?? 0.0,
                letAsOrNull<double>(a['right']) ?? 0.0,
                letAsOrNull<double>(a['bottom']) ?? 0.0)
            : null;
      }();
      final padding = () {
        final a = letMapOrNull<String, dynamic>(json?['padding']);
        return a != null
            ? EdgeInsets.fromLTRB(
                letAsOrNull<double>(a['left']) ?? 0.0,
                letAsOrNull<double>(a['top']) ?? 0.0,
                letAsOrNull<double>(a['right']) ?? 0.0,
                letAsOrNull<double>(a['bottom']) ?? 0.0)
            : null;
      }();
      final anchor = () {
        final a = letMapOrNull<String, dynamic>(json?['anchor']);
        return a != null
            ? Alignment(letAsOrNull<double>(a['x']) ?? 0.0,
                letAsOrNull<double>(a['y']) ?? 0.0)
            : null;
      }();
      final corner = () {
        final a = letMapOrNull<String, dynamic>(json?['corner']);
        return a != null
            ? Radius.elliptical(letAsOrNull<double>(a['x']) ?? 0.0,
                letAsOrNull<double>(a['y']) ?? 0.0)
            : null;
      }();
      final trimmed = json?['trimmed']?.toString().trim().nullIfEmpty;
      final noSpaces = json?['noSpaces']?.toString().trim().nullIfEmpty;
      final searchable = json?['searchable']?.toString().trim().nullIfEmpty;
      final lower = json?['lower']?.toString().trim().nullIfEmpty;
      final upper = json?['upper']?.toString().trim().nullIfEmpty;
      final lowerSnake = json?['lowerSnake']?.toString().trim().nullIfEmpty;
      final upperSnake = json?['upperSnake']?.toString().trim().nullIfEmpty;
      final lowerKebab = json?['lowerKebab']?.toString().trim().nullIfEmpty;
      final upperKebab = json?['upperKebab']?.toString().trim().nullIfEmpty;
      final camel = json?['camel']?.toString().trim().nullIfEmpty;
      final pascal = json?['pascal']?.toString().trim().nullIfEmpty;
      final tLower = json?['tLower']?.toString().trim().nullIfEmpty;
      final tUpper = json?['tUpper']?.toString().trim().nullIfEmpty;
      final tLowerSnake = json?['tLowerSnake']?.toString().trim().nullIfEmpty;
      final tUpperSnake = json?['tUpperSnake']?.toString().trim().nullIfEmpty;
      final tLowerKebab = json?['tLowerKebab']?.toString().trim().nullIfEmpty;
      final tUpperKebab = json?['tUpperKebab']?.toString().trim().nullIfEmpty;
      final tCamel = json?['tCamel']?.toString().trim().nullIfEmpty;
      final tPascal = json?['tPascal']?.toString().trim().nullIfEmpty;
      final tags = letListOrNull<dynamic>(json?['tags'])
          ?.map(
            (p0) => p0?.toString().trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final flags = letSetOrNull<dynamic>(json?['flags'])
          ?.map(
            (p0) => letAsOrNull<bool>(p0),
          )
          .nonNulls
          .nullIfEmpty
          ?.toSet()
          .unmodifiable;
      final scores = letIterableOrNull<dynamic>(json?['scores'])
          ?.map(
            (p0) => letAsOrNull<int>(p0),
          )
          .nonNulls
          .nullIfEmpty;
      final lookup = letMapOrNull<dynamic, dynamic>(json?['lookup'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              letAsOrNull<double>(p1),
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      final todo = () {
        final a = letIterableOrNull<dynamic>(json?['todo'])
            ?.map(
              (p0) => p0?.toString().trim().nullIfEmpty,
            )
            .nonNulls
            .nullIfEmpty;
        return a != null ? Queue.of(a) : null;
      }();
      final matrix = letListOrNull<dynamic>(json?['matrix'])
          ?.map(
            (p0) => letListOrNull<dynamic>(p0)
                ?.map(
                  (p0) => letAsOrNull<int>(p0),
                )
                .nonNulls
                .nullIfEmpty
                ?.toList()
                .unmodifiable,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final groupedColors =
          letMapOrNull<dynamic, dynamic>(json?['groupedColors'])
              ?.map(
                (p0, p1) => MapEntry(
                  p0?.toString().trim().nullIfEmpty,
                  letListOrNull<dynamic>(p1)
                      ?.map(
                        (p0) => letAsOrNull<int>(p0),
                      )
                      .nonNulls
                      .nullIfEmpty
                      ?.toList()
                      .unmodifiable,
                ),
              )
              .nonNulls
              .nullIfEmpty
              ?.unmodifiable;
      final nestedMap = letMapOrNull<dynamic, dynamic>(json?['nestedMap'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              letMapOrNull<dynamic, dynamic>(p1)
                  ?.map(
                    (p0, p1) => MapEntry(
                      p0?.toString().trim().nullIfEmpty,
                      letAsOrNull<int>(p1),
                    ),
                  )
                  .nonNulls
                  .nullIfEmpty
                  ?.unmodifiable,
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      final users = letListOrNull<dynamic>(json?['users'])
          ?.map(
            (p0) => () {
              final a = letMapOrNull<String, dynamic>(p0);
              return a != null ? ModelUser.fromJson(a) : null;
            }(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList()
          .unmodifiable;
      final localized = letMapOrNull<dynamic, dynamic>(json?['localized'])
          ?.map(
            (p0, p1) => MapEntry(
              p0?.toString().trim().nullIfEmpty,
              p1?.toString().trim().nullIfEmpty,
            ),
          )
          .nonNulls
          .nullIfEmpty
          ?.unmodifiable;
      return ModelAllTypes(
        anyValue: anyValue,
        name: name,
        active: active,
        count: count,
        ratio: ratio,
        amount: amount,
        createdAt: createdAt,
        interval: interval,
        homepage: homepage,
        themeColor: themeColor,
        stamp: stamp,
        ownerRef: ownerRef,
        payment: payment,
        shade: shade,
        bigCount: bigCount,
        blob: blob,
        regex: regex,
        origin: origin,
        canvasSize: canvasSize,
        bounds: bounds,
        padding: padding,
        anchor: anchor,
        corner: corner,
        trimmed: trimmed,
        noSpaces: noSpaces,
        searchable: searchable,
        lower: lower,
        upper: upper,
        lowerSnake: lowerSnake,
        upperSnake: upperSnake,
        lowerKebab: lowerKebab,
        upperKebab: upperKebab,
        camel: camel,
        pascal: pascal,
        tLower: tLower,
        tUpper: tUpper,
        tLowerSnake: tLowerSnake,
        tUpperSnake: tUpperSnake,
        tLowerKebab: tLowerKebab,
        tUpperKebab: tUpperKebab,
        tCamel: tCamel,
        tPascal: tPascal,
        tags: tags,
        flags: flags,
        scores: scores,
        lookup: lookup,
        todo: todo,
        matrix: matrix,
        groupedColors: groupedColors,
        nestedMap: nestedMap,
        users: users,
        localized: localized,
      );
    } catch (e) {
      return null;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from the query parameters of [uri]. Throws if the conversion
  /// fails.
  factory ModelAllTypes.fromUri(
    Uri? uri,
  ) {
    try {
      return fromUriOrNull(uri)!;
    } catch (e) {
      assert(false, '$ModelAllTypes.fromUri: $e');
      rethrow;
    }
  }

  /// Constructs a new instance of [ModelAllTypes],
  /// from the query parameters of [uri]. Returns `null` if [uri] is `null` or
  /// if the conversion fails.
  static ModelAllTypes? fromUriOrNull(
    Uri? uri,
  ) {
    try {
      if (uri != null && uri.path == CLASS_NAME) {
        return ModelAllTypes.fromJson(uri.queryParameters);
      } else {
        return ModelAllTypes.assertRequired();
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson({
    bool includeNulls = false,
  }) {
    try {
      final anyValue0 = anyValue;
      final name0 = name?.trim().nullIfEmpty;
      final active0 = active;
      final count0 = count;
      final ratio0 = ratio;
      final amount0 = amount;
      final createdAt0 = createdAt?.toUtc().toIso8601String();
      final interval0 = interval?.inMicroseconds;
      final homepage0 = homepage?.toString();
      final themeColor0 = themeColor?.toARGB32();
      final stamp0 = stamp;
      final ownerRef0 = ownerRef?.path;
      final payment0 = payment?.toJson();
      final shade0 = shade?.name;
      final bigCount0 = bigCount?.toString();
      final blob0 = blob != null ? base64Encode(blob!) : null;
      final regex0 = regex?.pattern;
      final origin0 =
          origin != null ? {'dx': origin!.dx, 'dy': origin!.dy} : null;
      final canvasSize0 = canvasSize != null
          ? {'width': canvasSize!.width, 'height': canvasSize!.height}
          : null;
      final bounds0 = bounds != null
          ? {
              'left': bounds!.left,
              'top': bounds!.top,
              'right': bounds!.right,
              'bottom': bounds!.bottom
            }
          : null;
      final padding0 = padding != null
          ? {
              'left': padding!.left,
              'top': padding!.top,
              'right': padding!.right,
              'bottom': padding!.bottom
            }
          : null;
      final anchor0 = anchor != null ? {'x': anchor!.x, 'y': anchor!.y} : null;
      final corner0 = corner != null ? {'x': corner!.x, 'y': corner!.y} : null;
      final trimmed0 = trimmed?.trim().nullIfEmpty;
      final noSpaces0 = noSpaces?.trim().nullIfEmpty;
      final searchable0 = searchable?.trim().nullIfEmpty;
      final lower0 = lower?.trim().nullIfEmpty;
      final upper0 = upper?.trim().nullIfEmpty;
      final lowerSnake0 = lowerSnake?.trim().nullIfEmpty;
      final upperSnake0 = upperSnake?.trim().nullIfEmpty;
      final lowerKebab0 = lowerKebab?.trim().nullIfEmpty;
      final upperKebab0 = upperKebab?.trim().nullIfEmpty;
      final camel0 = camel?.trim().nullIfEmpty;
      final pascal0 = pascal?.trim().nullIfEmpty;
      final tLower0 = tLower?.trim().nullIfEmpty;
      final tUpper0 = tUpper?.trim().nullIfEmpty;
      final tLowerSnake0 = tLowerSnake?.trim().nullIfEmpty;
      final tUpperSnake0 = tUpperSnake?.trim().nullIfEmpty;
      final tLowerKebab0 = tLowerKebab?.trim().nullIfEmpty;
      final tUpperKebab0 = tUpperKebab?.trim().nullIfEmpty;
      final tCamel0 = tCamel?.trim().nullIfEmpty;
      final tPascal0 = tPascal?.trim().nullIfEmpty;
      final tags0 = tags
          ?.map(
            (p0) => p0?.trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final flags0 = flags
          ?.map(
            (p0) => p0,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final scores0 = scores
          ?.map(
            (p0) => p0,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final lookup0 = lookup
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1,
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final todo0 = todo
          ?.map(
            (p0) => p0?.trim().nullIfEmpty,
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final matrix0 = matrix
          ?.map(
            (p0) => p0
                ?.map(
                  (p0) => p0,
                )
                .nonNulls
                .nullIfEmpty
                ?.toList(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final groupedColors0 = groupedColors
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1
                  ?.map(
                    (p0) => p0,
                  )
                  .nonNulls
                  .nullIfEmpty
                  ?.toList(),
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final nestedMap0 = nestedMap
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1
                  ?.map(
                    (p0, p1) => MapEntry(
                      p0?.trim().nullIfEmpty,
                      p1,
                    ),
                  )
                  .nonNulls
                  .nullIfEmpty,
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final users0 = users
          ?.map(
            (p0) => p0?.toJson(),
          )
          .nonNulls
          .nullIfEmpty
          ?.toList();
      final localized0 = localized
          ?.map(
            (p0, p1) => MapEntry(
              p0?.trim().nullIfEmpty,
              p1?.trim().nullIfEmpty,
            ),
          )
          .nonNulls
          .nullIfEmpty;
      final withNulls = {
        'users': users0,
        'upperSnake': upperSnake0,
        'upperKebab': upperKebab0,
        'upper': upper0,
        'trimmed': trimmed0,
        'todo': todo0,
        'themeColor': themeColor0,
        'tags': tags0,
        'tUpperSnake': tUpperSnake0,
        'tUpperKebab': tUpperKebab0,
        'tUpper': tUpper0,
        'tPascal': tPascal0,
        'tLowerSnake': tLowerSnake0,
        'tLowerKebab': tLowerKebab0,
        'tLower': tLower0,
        'tCamel': tCamel0,
        'stamp': stamp0,
        'shade': shade0,
        'searchable': searchable0,
        'scores': scores0,
        'regex': regex0,
        'ratio': ratio0,
        'payment': payment0,
        'pascal': pascal0,
        'padding': padding0,
        'ownerRef': ownerRef0,
        'origin': origin0,
        'noSpaces': noSpaces0,
        'nestedMap': nestedMap0,
        'name': name0,
        'matrix': matrix0,
        'lowerSnake': lowerSnake0,
        'lowerKebab': lowerKebab0,
        'lower': lower0,
        'lookup': lookup0,
        'localized': localized0,
        'interval': interval0,
        'homepage': homepage0,
        'groupedColors': groupedColors0,
        'flags': flags0,
        'createdAt': createdAt0,
        'count': count0,
        'corner': corner0,
        'canvasSize': canvasSize0,
        'camel': camel0,
        'bounds': bounds0,
        'blob': blob0,
        'bigCount': bigCount0,
        'anyValue': anyValue0,
        'anchor': anchor0,
        'amount': amount0,
        'active': active0,
      };
      return includeNulls ? withNulls : withNulls.nonNulls;
    } catch (e) {
      assert(false, '$ModelAllTypes.toJson: $e');
      rethrow;
    }
  }

  /// Returns the value of the [anyValue] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  dynamic get anyValue$ => anyValue!;

  /// Returns the value of the [name] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get name$ => name;

  /// Returns the value of the [active] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool? get active$ => active;

  /// Returns the value of the [count] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int? get count$ => count;

  /// Returns the value of the [ratio] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  double? get ratio$ => ratio;

  /// Returns the value of the [amount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  num? get amount$ => amount;

  /// Returns the value of the [createdAt] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DateTime? get createdAt$ => createdAt;

  /// Returns the value of the [interval] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Duration? get interval$ => interval;

  /// Returns the value of the [homepage] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uri? get homepage$ => homepage;

  /// Returns the value of the [themeColor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Color? get themeColor$ => themeColor;

  /// Returns the value of the [stamp] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Timestamp? get stamp$ => stamp;

  /// Returns the value of the [ownerRef] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  DataRefModel? get ownerRef$ => ownerRef;

  /// Returns the value of the [payment] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  PaymentModel? get payment$ => payment;

  /// Returns the value of the [shade] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  ColorEnum? get shade$ => shade;

  /// Returns the value of the [bigCount] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  BigInt? get bigCount$ => bigCount;

  /// Returns the value of the [blob] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Uint8List? get blob$ => blob;

  /// Returns the value of the [regex] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  RegExp? get regex$ => regex;

  /// Returns the value of the [origin] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Offset? get origin$ => origin;

  /// Returns the value of the [canvasSize] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Size? get canvasSize$ => canvasSize;

  /// Returns the value of the [bounds] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Rect? get bounds$ => bounds;

  /// Returns the value of the [padding] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  EdgeInsets? get padding$ => padding;

  /// Returns the value of the [anchor] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Alignment? get anchor$ => anchor;

  /// Returns the value of the [corner] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Radius? get corner$ => corner;

  /// Returns the value of the [trimmed] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get trimmed$ => trimmed;

  /// Returns the value of the [noSpaces] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get noSpaces$ => noSpaces;

  /// Returns the value of the [searchable] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get searchable$ => searchable;

  /// Returns the value of the [lower] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get lower$ => lower;

  /// Returns the value of the [upper] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get upper$ => upper;

  /// Returns the value of the [lowerSnake] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get lowerSnake$ => lowerSnake;

  /// Returns the value of the [upperSnake] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get upperSnake$ => upperSnake;

  /// Returns the value of the [lowerKebab] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get lowerKebab$ => lowerKebab;

  /// Returns the value of the [upperKebab] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get upperKebab$ => upperKebab;

  /// Returns the value of the [camel] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get camel$ => camel;

  /// Returns the value of the [pascal] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get pascal$ => pascal;

  /// Returns the value of the [tLower] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tLower$ => tLower;

  /// Returns the value of the [tUpper] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tUpper$ => tUpper;

  /// Returns the value of the [tLowerSnake] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tLowerSnake$ => tLowerSnake;

  /// Returns the value of the [tUpperSnake] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tUpperSnake$ => tUpperSnake;

  /// Returns the value of the [tLowerKebab] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tLowerKebab$ => tLowerKebab;

  /// Returns the value of the [tUpperKebab] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tUpperKebab$ => tUpperKebab;

  /// Returns the value of the [tCamel] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tCamel$ => tCamel;

  /// Returns the value of the [tPascal] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get tPascal$ => tPascal;

  /// Returns the value of the [tags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<String>? get tags$ => tags;

  /// Returns the value of the [flags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Set<bool>? get flags$ => flags;

  /// Returns the value of the [scores] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Iterable<int>? get scores$ => scores;

  /// Returns the value of the [lookup] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, double>? get lookup$ => lookup;

  /// Returns the value of the [todo] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Queue<String>? get todo$ => todo;

  /// Returns the value of the [matrix] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<List<int>>? get matrix$ => matrix;

  /// Returns the value of the [groupedColors] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, List<int>>? get groupedColors$ => groupedColors;

  /// Returns the value of the [nestedMap] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, Map<String, int>>? get nestedMap$ => nestedMap;

  /// Returns the value of the [users] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<ModelUser>? get users$ => users;

  /// Returns the value of the [localized] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  Map<String, String>? get localized$ => localized;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract final class ModelAllTypesFieldNames {
  /// The field name of [ModelAllTypes.anyValue].
  static const anyValue = 'anyValue';

  /// The field name of [ModelAllTypes.name].
  static const name = 'name';

  /// The field name of [ModelAllTypes.active].
  static const active = 'active';

  /// The field name of [ModelAllTypes.count].
  static const count = 'count';

  /// The field name of [ModelAllTypes.ratio].
  static const ratio = 'ratio';

  /// The field name of [ModelAllTypes.amount].
  static const amount = 'amount';

  /// The field name of [ModelAllTypes.createdAt].
  static const createdAt = 'createdAt';

  /// The field name of [ModelAllTypes.interval].
  static const interval = 'interval';

  /// The field name of [ModelAllTypes.homepage].
  static const homepage = 'homepage';

  /// The field name of [ModelAllTypes.themeColor].
  static const themeColor = 'themeColor';

  /// The field name of [ModelAllTypes.stamp].
  static const stamp = 'stamp';

  /// The field name of [ModelAllTypes.ownerRef].
  static const ownerRef = 'ownerRef';

  /// The field name of [ModelAllTypes.payment].
  static const payment = 'payment';

  /// The field name of [ModelAllTypes.shade].
  static const shade = 'shade';

  /// The field name of [ModelAllTypes.bigCount].
  static const bigCount = 'bigCount';

  /// The field name of [ModelAllTypes.blob].
  static const blob = 'blob';

  /// The field name of [ModelAllTypes.regex].
  static const regex = 'regex';

  /// The field name of [ModelAllTypes.origin].
  static const origin = 'origin';

  /// The field name of [ModelAllTypes.canvasSize].
  static const canvasSize = 'canvasSize';

  /// The field name of [ModelAllTypes.bounds].
  static const bounds = 'bounds';

  /// The field name of [ModelAllTypes.padding].
  static const padding = 'padding';

  /// The field name of [ModelAllTypes.anchor].
  static const anchor = 'anchor';

  /// The field name of [ModelAllTypes.corner].
  static const corner = 'corner';

  /// The field name of [ModelAllTypes.trimmed].
  static const trimmed = 'trimmed';

  /// The field name of [ModelAllTypes.noSpaces].
  static const noSpaces = 'noSpaces';

  /// The field name of [ModelAllTypes.searchable].
  static const searchable = 'searchable';

  /// The field name of [ModelAllTypes.lower].
  static const lower = 'lower';

  /// The field name of [ModelAllTypes.upper].
  static const upper = 'upper';

  /// The field name of [ModelAllTypes.lowerSnake].
  static const lowerSnake = 'lowerSnake';

  /// The field name of [ModelAllTypes.upperSnake].
  static const upperSnake = 'upperSnake';

  /// The field name of [ModelAllTypes.lowerKebab].
  static const lowerKebab = 'lowerKebab';

  /// The field name of [ModelAllTypes.upperKebab].
  static const upperKebab = 'upperKebab';

  /// The field name of [ModelAllTypes.camel].
  static const camel = 'camel';

  /// The field name of [ModelAllTypes.pascal].
  static const pascal = 'pascal';

  /// The field name of [ModelAllTypes.tLower].
  static const tLower = 'tLower';

  /// The field name of [ModelAllTypes.tUpper].
  static const tUpper = 'tUpper';

  /// The field name of [ModelAllTypes.tLowerSnake].
  static const tLowerSnake = 'tLowerSnake';

  /// The field name of [ModelAllTypes.tUpperSnake].
  static const tUpperSnake = 'tUpperSnake';

  /// The field name of [ModelAllTypes.tLowerKebab].
  static const tLowerKebab = 'tLowerKebab';

  /// The field name of [ModelAllTypes.tUpperKebab].
  static const tUpperKebab = 'tUpperKebab';

  /// The field name of [ModelAllTypes.tCamel].
  static const tCamel = 'tCamel';

  /// The field name of [ModelAllTypes.tPascal].
  static const tPascal = 'tPascal';

  /// The field name of [ModelAllTypes.tags].
  static const tags = 'tags';

  /// The field name of [ModelAllTypes.flags].
  static const flags = 'flags';

  /// The field name of [ModelAllTypes.scores].
  static const scores = 'scores';

  /// The field name of [ModelAllTypes.lookup].
  static const lookup = 'lookup';

  /// The field name of [ModelAllTypes.todo].
  static const todo = 'todo';

  /// The field name of [ModelAllTypes.matrix].
  static const matrix = 'matrix';

  /// The field name of [ModelAllTypes.groupedColors].
  static const groupedColors = 'groupedColors';

  /// The field name of [ModelAllTypes.nestedMap].
  static const nestedMap = 'nestedMap';

  /// The field name of [ModelAllTypes.users].
  static const users = 'users';

  /// The field name of [ModelAllTypes.localized].
  static const localized = 'localized';
}

extension ModelAllTypesX on ModelAllTypes {
  /// Creates a copy of this instance, merging another model's fields into
  /// this model's fields.
  ModelAllTypes mergeWith(
    BaseModel? other, {
    bool deepMerge = false,
  }) {
    final a = toJson();
    final b = other?.toJson() ?? {};
    final data = (deepMerge ? mergeDataDeep(a, b) : {...a, ...b}) as Map;
    return ModelAllTypes.fromJson(data.cast());
  }

  /// Creates a copy of this instance, replacing the specified fields.
  ModelAllTypes copyWith({
    dynamic? anyValue,
    String? name,
    bool? active,
    int? count,
    double? ratio,
    num? amount,
    DateTime? createdAt,
    Duration? interval,
    Uri? homepage,
    Color? themeColor,
    Timestamp? stamp,
    DataRefModel? ownerRef,
    PaymentModel? payment,
    ColorEnum? shade,
    BigInt? bigCount,
    Uint8List? blob,
    RegExp? regex,
    Offset? origin,
    Size? canvasSize,
    Rect? bounds,
    EdgeInsets? padding,
    Alignment? anchor,
    Radius? corner,
    String? trimmed,
    String? noSpaces,
    String? searchable,
    String? lower,
    String? upper,
    String? lowerSnake,
    String? upperSnake,
    String? lowerKebab,
    String? upperKebab,
    String? camel,
    String? pascal,
    String? tLower,
    String? tUpper,
    String? tLowerSnake,
    String? tUpperSnake,
    String? tLowerKebab,
    String? tUpperKebab,
    String? tCamel,
    String? tPascal,
    List<String>? tags,
    Set<bool>? flags,
    Iterable<int>? scores,
    Map<String, double>? lookup,
    Queue<String>? todo,
    List<List<int>>? matrix,
    Map<String, List<int>>? groupedColors,
    Map<String, Map<String, int>>? nestedMap,
    List<ModelUser>? users,
    Map<String, String>? localized,
  }) {
    return ModelAllTypes.assertRequired(
      anyValue: anyValue ?? this.anyValue,
      name: name ?? this.name,
      active: active ?? this.active,
      count: count ?? this.count,
      ratio: ratio ?? this.ratio,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      interval: interval ?? this.interval,
      homepage: homepage ?? this.homepage,
      themeColor: themeColor ?? this.themeColor,
      stamp: stamp ?? this.stamp,
      ownerRef: ownerRef ?? this.ownerRef,
      payment: payment ?? this.payment,
      shade: shade ?? this.shade,
      bigCount: bigCount ?? this.bigCount,
      blob: blob ?? this.blob,
      regex: regex ?? this.regex,
      origin: origin ?? this.origin,
      canvasSize: canvasSize ?? this.canvasSize,
      bounds: bounds ?? this.bounds,
      padding: padding ?? this.padding,
      anchor: anchor ?? this.anchor,
      corner: corner ?? this.corner,
      trimmed: trimmed ?? this.trimmed,
      noSpaces: noSpaces ?? this.noSpaces,
      searchable: searchable ?? this.searchable,
      lower: lower ?? this.lower,
      upper: upper ?? this.upper,
      lowerSnake: lowerSnake ?? this.lowerSnake,
      upperSnake: upperSnake ?? this.upperSnake,
      lowerKebab: lowerKebab ?? this.lowerKebab,
      upperKebab: upperKebab ?? this.upperKebab,
      camel: camel ?? this.camel,
      pascal: pascal ?? this.pascal,
      tLower: tLower ?? this.tLower,
      tUpper: tUpper ?? this.tUpper,
      tLowerSnake: tLowerSnake ?? this.tLowerSnake,
      tUpperSnake: tUpperSnake ?? this.tUpperSnake,
      tLowerKebab: tLowerKebab ?? this.tLowerKebab,
      tUpperKebab: tUpperKebab ?? this.tUpperKebab,
      tCamel: tCamel ?? this.tCamel,
      tPascal: tPascal ?? this.tPascal,
      tags: tags ?? this.tags,
      flags: flags ?? this.flags,
      scores: scores ?? this.scores,
      lookup: lookup ?? this.lookup,
      todo: todo ?? this.todo,
      matrix: matrix ?? this.matrix,
      groupedColors: groupedColors ?? this.groupedColors,
      nestedMap: nestedMap ?? this.nestedMap,
      users: users ?? this.users,
      localized: localized ?? this.localized,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelAllTypes copyWithout({
    bool anyValue = true,
    bool name = true,
    bool active = true,
    bool count = true,
    bool ratio = true,
    bool amount = true,
    bool createdAt = true,
    bool interval = true,
    bool homepage = true,
    bool themeColor = true,
    bool stamp = true,
    bool ownerRef = true,
    bool payment = true,
    bool shade = true,
    bool bigCount = true,
    bool blob = true,
    bool regex = true,
    bool origin = true,
    bool canvasSize = true,
    bool bounds = true,
    bool padding = true,
    bool anchor = true,
    bool corner = true,
    bool trimmed = true,
    bool noSpaces = true,
    bool searchable = true,
    bool lower = true,
    bool upper = true,
    bool lowerSnake = true,
    bool upperSnake = true,
    bool lowerKebab = true,
    bool upperKebab = true,
    bool camel = true,
    bool pascal = true,
    bool tLower = true,
    bool tUpper = true,
    bool tLowerSnake = true,
    bool tUpperSnake = true,
    bool tLowerKebab = true,
    bool tUpperKebab = true,
    bool tCamel = true,
    bool tPascal = true,
    bool tags = true,
    bool flags = true,
    bool scores = true,
    bool lookup = true,
    bool todo = true,
    bool matrix = true,
    bool groupedColors = true,
    bool nestedMap = true,
    bool users = true,
    bool localized = true,
  }) {
    return ModelAllTypes.assertRequired(
      anyValue: anyValue ? this.anyValue : null,
      name: name ? this.name : null,
      active: active ? this.active : null,
      count: count ? this.count : null,
      ratio: ratio ? this.ratio : null,
      amount: amount ? this.amount : null,
      createdAt: createdAt ? this.createdAt : null,
      interval: interval ? this.interval : null,
      homepage: homepage ? this.homepage : null,
      themeColor: themeColor ? this.themeColor : null,
      stamp: stamp ? this.stamp : null,
      ownerRef: ownerRef ? this.ownerRef : null,
      payment: payment ? this.payment : null,
      shade: shade ? this.shade : null,
      bigCount: bigCount ? this.bigCount : null,
      blob: blob ? this.blob : null,
      regex: regex ? this.regex : null,
      origin: origin ? this.origin : null,
      canvasSize: canvasSize ? this.canvasSize : null,
      bounds: bounds ? this.bounds : null,
      padding: padding ? this.padding : null,
      anchor: anchor ? this.anchor : null,
      corner: corner ? this.corner : null,
      trimmed: trimmed ? this.trimmed : null,
      noSpaces: noSpaces ? this.noSpaces : null,
      searchable: searchable ? this.searchable : null,
      lower: lower ? this.lower : null,
      upper: upper ? this.upper : null,
      lowerSnake: lowerSnake ? this.lowerSnake : null,
      upperSnake: upperSnake ? this.upperSnake : null,
      lowerKebab: lowerKebab ? this.lowerKebab : null,
      upperKebab: upperKebab ? this.upperKebab : null,
      camel: camel ? this.camel : null,
      pascal: pascal ? this.pascal : null,
      tLower: tLower ? this.tLower : null,
      tUpper: tUpper ? this.tUpper : null,
      tLowerSnake: tLowerSnake ? this.tLowerSnake : null,
      tUpperSnake: tUpperSnake ? this.tUpperSnake : null,
      tLowerKebab: tLowerKebab ? this.tLowerKebab : null,
      tUpperKebab: tUpperKebab ? this.tUpperKebab : null,
      tCamel: tCamel ? this.tCamel : null,
      tPascal: tPascal ? this.tPascal : null,
      tags: tags ? this.tags : null,
      flags: flags ? this.flags : null,
      scores: scores ? this.scores : null,
      lookup: lookup ? this.lookup : null,
      todo: todo ? this.todo : null,
      matrix: matrix ? this.matrix : null,
      groupedColors: groupedColors ? this.groupedColors : null,
      nestedMap: nestedMap ? this.nestedMap : null,
      users: users ? this.users : null,
      localized: localized ? this.localized : null,
    );
  }
}
