abstract class CountRepository {
  Future<void> setCount(String uid, int count);
  Future<int> getCount(String uid);
}
