// Verifies the unknown-annotation behavior of processCommentAnnots.
//
// The comment-annot regex matches ANY `// word` comment, e.g. `// foo`. If
// the matched annotation key isn't in [onAnnotCallbacks], the function uses
// `onAnnotCallbacks1[annot1]!` which throws on a null callback.

import 'dart:io';
import 'package:df_gen_core/df_gen_core.dart';
import 'package:test/test.dart';

void main() {
  test(
      'comment that matches regex but is not a registered annot must not crash',
      () async {
    final tmp = File(
      '${Directory.systemTemp.path}/df_test_${DateTime.now().microsecondsSinceEpoch}.dart',
    );
    await tmp.writeAsString('''
// some random comment
// hello world
void main() {}
''');

    try {
      // Pass empty callbacks. Each line matching `// word` will try to look up
      // a callback and bang.
      await processCommentAnnots(
        filePath: tmp.path,
        onAnnotCallbacks: {},
        annotsToDelete: {},
      );
      // If we get here, the function correctly skipped unknown annots.
    } on TypeError catch (e) {
      fail('processCommentAnnots crashed on unknown annot: $e');
    } catch (e) {
      // Some other failure paths might not be the bug; surface for review.
      print('non-TypeError thrown: $e');
      rethrow;
    } finally {
      try {
        await tmp.delete();
      } catch (_) {}
    }
  });
}
