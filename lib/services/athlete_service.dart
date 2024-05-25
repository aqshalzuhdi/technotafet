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
    // QueryBuilder<AthleteEntity> builder = store.box<AthleteEntity>().query();
    // builder.linkMany(
    //     AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));

    //Condition<AthleteEntity> condition

    // final athlete = AthleteEntity(name: '');
    // final exercise =
    //     ExerciseEntity(groupType: 1, category: 1, time: 0.00, createdAt: '');

    // athlete.exercises.linkMany

    // QueryBuilder<AthleteEntity> builder = store.box<AthleteEntity>().query();
    // final rel = store.box<AthleteEntity>().query(AthleteEntity_.id.equals(1)).build();

    // builder.linkMany(rel);

    // final athleteEntityBox = store.box<AthleteEntity>();
    // athleteEntityBox.

    // final queryBuilder = store
    //     .box<AthleteEntity>()
    //     .query()
    //     .backlinkMany(AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));

    // final queryBuilder = store.box<AthleteEntity>().query();
    // queryBuilder.backlinkMany(
    //     AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));

    // final queryBuilder = store.box<ExerciseEntity>().query();
    // queryBuilder.link(ExerciseEntity_.athlete, AthleteEntity_.id.equals(1));
    // queryBuilder.backlinkMany(
    //     AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));

    // final QueryBuilder = store.box<AthleteEntity>().query();
    // QueryBuilder.link(
    //     AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));

    // Query<AthleteEntity> query = store.box<AthleteEntity>().query().build();
    // Stream<AthleteEntity> stream = query.stream();
    // return stream.;

    final queryBuilder = store.box<AthleteEntity>().query();
    // print(queryBuilder.build().find());
    // queryBuilder
    // .backlink(ExerciseEntity_.athlete, ExerciseEntity_.category.equals(1))
    // .linkMany(AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));
    // queryBuilder.linkMany(
    //     AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));
    queryBuilder.backlink(ExerciseEntity_.athlete, condition);
    queryBuilder.order(AthleteEntity_.id, flags: Order.descending);
    // queryBuilder.linkMany(AthleteEntity_.exercises, ExerciseEntity_.category.equals(1));
    return queryBuilder.watch(triggerImmediately: true);

    // return store
    //     .box<AthleteEntity>()
    //     // .query()
    //     .query()
    //     // .linkMany(rel)
    //     .watch(triggerImmediately: true);
    // .linkMany(AthleteEntity_.exercises, ExerciseEntity_.groupType.equals(1))
    // QueryBuilder<AthleteEntity> builder = store.box<AthleteEntity>().query();
    // builder.link(ExerciseEntity_.category.equals(1), );
    // Query<ExerciseEntity> query = builder.build();

    // QueryBuilder<AthleteEntity> builder = store.box<AthleteEntity>().query();
    // // builder.linkMany(
    // //     AthleteEntity_.exercises, ExerciseEntity_.groupType.equals(1));
    // Query<AthleteEntity> query = builder.build();
    // query.property(AthleteEntity_.id).distinct = true;

    // return query.find();
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
