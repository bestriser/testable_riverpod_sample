import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/utility/constants.dart';

class DummyCount {
  static Count initialValue = Count(
    countId: Constants.countId,
    count: 5,
    updatedAt: DateTime(2022, 2, 14),
  );
}
