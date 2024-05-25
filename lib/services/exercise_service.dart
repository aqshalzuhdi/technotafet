part of 'service.dart';

class ExerciseService {
  final Store store;

  ExerciseService({required this.store});

  int create(ExerciseEntity exercise) {
    return store.box<ExerciseEntity>().put(exercise);
  }

  int update(ExerciseEntity exercise) {
    return store.box<ExerciseEntity>().put(exercise);
  }

  Stream<Query<ExerciseEntity>> readQueryStream(
      Condition<ExerciseEntity> condition) {
    return store
        .box<ExerciseEntity>()
        .query(condition)
        .watch(triggerImmediately: true);
    // return store
    //     .box<ExerciseEntity>()
    //     .query(condition)
    //     .watch(triggerImmediately: true)
    //     .map((e) => e.param(ExerciseEntity_.category));

    // final box = store.box<ExerciseEntity>();

    // final query = box.query(ExerciseEntity_.athlete)
  }

  List<ExerciseEntity> read() {
    return store.box<ExerciseEntity>().getAll();
  }

  ExerciseEntity? readById(int id) {
    return store.box<ExerciseEntity>().get(id);
  }

  // ExerciseEntity? readByAthleteId(AthleteEntity athlete) {
  //   List<ExerciseEntity> exerciseEntities = store
  //       .box<ExerciseEntity>()
  //       .query(ExerciseEntity_.athlete.equals(athlete))
  //       .build()
  //       .find();
  // }

  bool delete(int id) {
    return store.box<ExerciseEntity>().remove(id);
  }

  int deleteMany(List<int> ids) {
    return store.box<ExerciseEntity>().removeMany(ids);
  }

  int deleteAll() {
    return store.box<ExerciseEntity>().removeAll();
  }
}
