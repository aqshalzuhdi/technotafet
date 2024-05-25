part of 'page.dart';

class TemplatePage extends StatelessWidget {
  final String? titleBar;
  final List<Widget>? actionBar;
  final Widget body;
  final bool? bodyCenter;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;

  const TemplatePage({
    super.key,
    this.titleBar,
    this.actionBar,
    required this.body,
    this.bodyCenter,
    this.floatingActionButtonAnimator,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (titleBar == null)
          ? null
          : AppBar(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: kBlackColor,
                ),
              ),
              title: Text(
                titleBar!,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              actions: actionBar,
              elevation: 0.6,
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        child: SafeArea(
          child: Center(
            child: ListView(
              shrinkWrap: bodyCenter ?? false,
              children: [body, const SizedBox(height: 10)],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Powered By ',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(width: 14),
            Image.asset(
              'assets/Logo_EEPIS.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButton: floatingActionButton,
    );
  }
}
