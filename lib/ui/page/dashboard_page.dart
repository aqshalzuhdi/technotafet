part of 'page.dart';

class DashboardPage extends StatelessWidget {
  final int olympiadeCategoryId;

  const DashboardPage({super.key, required this.olympiadeCategoryId});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      titleBar: olympiadeCategories[olympiadeCategoryId - 1],
      actionBar: [
        IndicatorCircleWidget(status: 1),
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
        stream: AthleteService(store: store).readQueryStream(ExerciseEntity_
                .category
                .equals(olympiadeCategoryId) //filter by olympiade from button
            ),
        builder: (context, snapshot) {
          // return Text('test');
          if (snapshot.hasData) {
            if (snapshot.data!.find().isEmpty) {
              return Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 4),
                  Icon(
                    Icons.file_open_rounded,
                    color: kBlackColor,
                    size: 100,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Data not available',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Start Exercise now!',
                    style: blackTextStyle,
                  ),
                ],
              );
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
                                  exercise: e.exercises,
                                  athlete: e,
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