import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';

class CountRepositoryImpl implements CountRepository {
  static final CountRepositoryImpl _cache = CountRepositoryImpl._internal();
  CountRepositoryImpl._internal();
  factory CountRepositoryImpl() => _cache;

  final _store = FirebaseFirestore.instance;

  @override
  Future<void> setCount(String countId, int count) {
    return _store
        .collection('counts')
        .doc(countId)
        .set({'countId': countId, 'count': count, 'updatedAt': DateTime.now()});
  }

  @override
  Future<int> getCount(String countId) {
    return _store.collection('counts').doc(countId).get().then((snapshot) {
      if (snapshot.data() != null) {
        return snapshot.data()! as int;
      } else {
        return 0;
      }
    });
  }
}
