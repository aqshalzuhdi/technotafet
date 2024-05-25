part of 'page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      bodyCenter: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Category',
            style: blackTextStyle.copyWith(
              fontSize: 28,
              fontWeight: bold,
            ),
          ),
          const SizedBox(height: 14),
          ButtonWidget(
            // height: 45,
            // width: 120,
            backgroundColor: kRedColor,
            text: 'Olimpiade: 4x100m',
            onPressed: () {
              Get.to(DashboardPage(
                olympiadeCategoryId: 1,
              ));
            },
          ),
          const SizedBox(height: 8),
          ButtonWidget(
            // height: 45,
            // width: 120,
            backgroundColor: kBlueColor,
            text: 'Olimpiade: 4x200m',
            onPressed: () {
              Get.to(DashboardPage(
                olympiadeCategoryId: 2,
              ));
            },
          ),
          const SizedBox(height: 8),
          ButtonWidget(
            // height: 45,
            // width: 120,
            backgroundColor: kGreenColor,
            text: 'Non-Olimpiade: 4x100m',
            onPressed: () {
              Get.to(DashboardPage(
                olympiadeCategoryId: 3,
              ));
            },
          ),
        ],
      ),
    );
  }
}
