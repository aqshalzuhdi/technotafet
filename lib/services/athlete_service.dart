part of 'service.dart';

class AthleteService {
  final Store store;

  AthleteService({required this.store});

  int create(AthleteEntity athlete) {
    return store.box<AthleteEntity>().put(athlete);
  }

  int update(AthleteEntity athlete) {
    return store.box<AthleteEntity>().put(athlete);
  }

  Stream<Query<AthleteEntity>> readQueryStream(
      Condition<ExerciseEntity> condition) {
    final queryBuilder = store.box<AthleteEntity>().query();
    queryBuilder.backlink(ExerciseEntity_.athlete, condition);
    queryBuilder.order(AthleteEntity_.id, flags: Order.descending);
    return queryBuilder.watch(triggerImmediately: true);
  }

  List<AthleteEntity> read() {
    return store.box<AthleteEntity>().getAll();
  }

  AthleteEntity? readById(int id) {
    return store.box<AthleteEntity>().get(id);
  }

  AthleteEntity? readByName(String name) {
    List<AthleteEntity> athletes = store
        .box<AthleteEntity>()
        .query(AthleteEntity_.name.equals(name))
        .build()
        .find();

    if (athletes.isNotEmpty) {
      return athletes.first;
    }

    return null;
  }

  bool delete(int id) {
    return store.box<AthleteEntity>().remove(id);
  }

  int deleteMany(List<int> ids) {
    return store.box<AthleteEntity>().removeMany(ids);
  }

  int deleteAll() {
    return store.box<AthleteEntity>().removeAll();
  }
}
