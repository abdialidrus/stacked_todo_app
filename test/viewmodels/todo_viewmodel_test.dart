import 'package:flutter_test/flutter_test.dart';
import 'package:stacked_todo_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TodoViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
