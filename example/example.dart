import 'models/model_test/model_test.dart';
import 'models/model_user/model_user.dart';

void main() {
  final a = const ModelTest(
    users: [
      ModelUser(id: '123'),
    ],
    checks: [1, 2, 3, 4],
  );
  print(a);
  final b = a.copyWith(const ModelTest(checks: [4, 5, 6]));
  print(b);
}
