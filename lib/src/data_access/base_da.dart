abstract class BaseDA<T1, T2> {
  T2 api;

  BaseDA(this.api);

  Future<List<T1>> getAll();

  Future<void> insert(T1 item);
  Future<void> update(T1 item);
  Future<void> delete(T1 item);
  Future<void> saveList(List<T1> list);
}
