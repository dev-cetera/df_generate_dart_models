// Shared fixtures referenced by the integration models.
// Enums for the enum-mapper + unknownEnumValue tests. The Money/converter
// class for the per-field converter test. Kept here so each model file
// stays focused on the annotation surface it's verifying.

// ignore_for_file: prefer_const_constructors

enum AuthProviderKindType { password, google, apple, unknown }

enum PostStatusKindType { draft, published, archived }

/// Custom converter used by the `converter:` annotation slot test. Mirrors
/// `package:json_annotation`'s `JsonConverter<T, S>` shape — generated code
/// emits `const MoneyConverter().fromJson(value)` / `.toJson(value)`.
class MoneyConverter {
  const MoneyConverter();

  /// Reads a String "USD 12.34" wire value into a (currency, amount) tuple.
  /// The actual logic isn't important for the test — we're just verifying
  /// the generator wires the call site correctly.
  (String, double)? fromJson(Object? json) {
    if (json is! String) return null;
    final parts = json.split(' ');
    if (parts.length != 2) return null;
    return (parts[0], double.parse(parts[1]));
  }

  String? toJson((String, double)? value) {
    if (value == null) return null;
    return '${value.$1} ${value.$2}';
  }
}

/// Stub stand-ins so models that mention these in fieldType strings still
/// compile. The integration target is the generator's output, not runtime
/// fidelity — so opaque stand-ins are fine.
class DocumentReference {
  const DocumentReference(this.path);
  final String path;
}

class GeoPoint {
  const GeoPoint(this.latitude, this.longitude);
  final double latitude;
  final double longitude;
}

class Blob {
  const Blob(this.bytes);
  final List<int> bytes;
}

class Timestamp {
  const Timestamp(this.seconds, this.nanoseconds);
  final int seconds;
  final int nanoseconds;
  DateTime toDate() =>
      DateTime.fromMillisecondsSinceEpoch(seconds * 1000 + nanoseconds ~/ 1e6);
  static Timestamp fromDate(DateTime dt) {
    final ms = dt.millisecondsSinceEpoch;
    return Timestamp(ms ~/ 1000, (ms.remainder(1000)) * 1000000);
  }
}

class FieldValue {
  const FieldValue._();
  static FieldValue serverTimestamp() => const FieldValue._();
}
