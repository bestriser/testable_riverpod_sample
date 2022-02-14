import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testable_riverpod_sample/domain/count.dart';

final countRepositoryProvider = Provider((ref) => CountRepository());

class CountRepository {
  static final CountRepository _cache = CountRepository._internal();
  CountRepository._internal();
  factory CountRepository() => _cache;

  final _store = FirebaseFirestore.instance;

  Future<void> setCount(Count count) {
    return _store.collection('counts').doc(count.countId).set(count.toJson());
  }

  Future<Count?> getCount(String countId) {
    return _store.collection('counts').doc(countId).get().then((snap) {
      if (snap.data() == null) return null;
      return Count.fromJson(snap.data()!);
    });
  }
}
