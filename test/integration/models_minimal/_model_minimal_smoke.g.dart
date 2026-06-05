//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED - DO NOT MODIFY BY HAND
// See: https://github.com/dev-cetera/df_generate_dart_models
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: annotate_overrides
// ignore_for_file: overridden_fields

part of 'model_minimal_smoke.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Generated class for [_ModelMinimalSmoke].
class ModelMinimalSmoke {
  //
  //
  //

  /// No description provided.
  final String? id;

  /// No description provided.
  final String? label;

  /// No description provided.
  final int? count;

  /// No description provided.
  final bool? active;

  /// No description provided.
  final List<String>? tags;

  /// Constructs a new instance of [ModelMinimalSmoke]
  /// from optional and required parameters.
  const ModelMinimalSmoke({
    required this.id,
    this.label,
    this.count,
    required this.active,
    this.tags,
  });

  /// Creates a copy of this instance, replacing the specified fields.
  ModelMinimalSmoke copyWith({
    String? id,
    String? label,
    int? count,
    bool? active,
    List<String>? tags,
  }) {
    return ModelMinimalSmoke(
      id: id ?? this.id,
      label: label ?? this.label,
      count: count ?? this.count,
      active: active ?? this.active,
      tags: tags ?? this.tags,
    );
  }

  /// Creates a copy of this instance, removing the specified fields.
  ModelMinimalSmoke copyWithout({
    bool id = true,
    bool label = true,
    bool count = true,
    bool active = true,
    bool tags = true,
  }) {
    return ModelMinimalSmoke(
      id: id ? this.id : null,
      label: label ? this.label : null,
      count: count ? this.count : null,
      active: active ? this.active : null,
      tags: tags ? this.tags : null,
    );
  }

  /// Returns the value of the [id] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String get id$ => id!;

  /// Returns the value of the [label] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  String? get label$ => label;

  /// Returns the value of the [count] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  int? get count$ => count;

  /// Returns the value of the [active] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  bool get active$ => active!;

  /// Returns the value of the [tags] field.
  /// If the field is nullable, the return value may be null; otherwise, it
  /// will always return a non-null value.
  @pragma('vm:prefer-inline')
  List<String>? get tags$ => tags;
}
