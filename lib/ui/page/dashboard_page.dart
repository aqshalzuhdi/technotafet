part of 'page.dart';

class DashboardPage extends StatelessWidget {
  final int olympiadeCategoryId;

  const DashboardPage({super.key, required this.olympiadeCategoryId});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      titleBar: olympiadeCategories[olympiadeCategoryId - 1],
      actionBar: [
        IndicatorCircleWidget(status: 2),
        const SizedBox(width: 14),
        GestureDetector(
          onTap: () {
            log('Restore from ESP');
          },
          child: Icon(
            Icons.restore_outlined,
            color: kBlackColor,
          ),
        ),
        const SizedBox(width: 14),
      ],
      body: StreamBuilder<Query<AthleteEntity>>(
        stream: AthleteService(store: store).readQueryStream(
          ExerciseEntity_.category
              .equals(olympiadeCategoryId), //filter by olympiade from button
        ),
        builder: (context, snapshot) {
          // return Text('test');
          if (snapshot.hasData) {
            if (snapshot.data!.find().isEmpty) {
              return const ErrorMessageWidget();
            }

            return Column(
                children: snapshot.data!
                    .find()
                    .map(
                      (e) => Column(
                        children: [
                          AthleteWidget(
                            name: e.name,
                            onTap: () {
                              Get.to(
                                ChartDetailPage(
                                  // exercise: e.exercises,
                                  athlete: e,
                                  categoryId: olympiadeCategoryId,
                                  // athleteId: e.id,
                                  // categoryId: olympiadeCategoryId,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 14),
                        ],
                      ),
                    )
                    .toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AthletePage(
            olympiadeCategory: olympiadeCategoryId,
          ));
        },
        backgroundColor: kBlackColor,
        child: Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
