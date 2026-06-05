//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:io';
import 'dart:isolate';

import 'package:df_generate_dart_models/df_generate_dart_models.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void main(List<String> args) async {
  final version = await _resolvePackageVersion();
  final tag = version != null ? 'v$version' : 'main';
  await generateDartModels(
    args,
    defaultTemplatePathOrUrl:
        'https://raw.githubusercontent.com/dev-cetera/df_generate_dart_models/$tag/templates/featured_v1.dart.md',
  );
}

/// Resolves the installed package's version from its own pubspec.yaml so the
/// default template URL points at the matching git tag.
///
/// Without this, every binary — including ones installed months ago — would
/// pull the *current* `main` template, so any breaking interpolator/template
/// change in HEAD would silently corrupt old users' generated output.
///
/// Returns `null` if the pubspec can't be located or parsed; the caller then
/// falls back to `main`, which preserves historical behaviour for
/// development checkouts where this lookup may not succeed.
Future<String?> _resolvePackageVersion() async {
  try {
    final libraryUri = await Isolate.resolvePackageUri(
      Uri.parse('package:df_generate_dart_models/df_generate_dart_models.dart'),
    );
    if (libraryUri == null) return null;
    final libDir = File.fromUri(libraryUri).parent;
    final pubspec = File('${libDir.parent.path}/pubspec.yaml');
    if (!pubspec.existsSync()) return null;
    final match = RegExp(
      r'^version:\s*(\S+)',
      multiLine: true,
    ).firstMatch(pubspec.readAsStringSync());
    return match?.group(1);
  } catch (_) {
    return null;
  }
}
