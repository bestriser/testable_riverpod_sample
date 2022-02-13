import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testable_riverpod_sample/domain/count.dart';
import 'package:testable_riverpod_sample/repository/count_repository.dart';

class CountRepositoryImpl implements CountRepository {
  static final CountRepositoryImpl _cache = CountRepositoryImpl._internal();
  CountRepositoryImpl._internal();
  factory CountRepositoryImpl() => _cache;

  final _store = FirebaseFirestore.instance;

  @override
  Future<void> setCount(Count count) {
    return _store.collection('counts').doc(count.countId).set(count.toJson());
  }

  @override
  Future<Count?> getCount(String countId) {
    return _store.collection('counts').doc(countId).get().then((snap) {
      if (snap.data() == null) return null;
      return Count.fromJson(snap.data()!);
    });
  }
}
