import 'package:simubank/simubank.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppEmptyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('logo'),
                  Text('field1'),
                  Text('field2'),
                  Text('button'),
                  Text('account creation'),
                  Text('register'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: AppSizes(context).paddingHorizontal,
                right: AppSizes(context).paddingHorizontal,
                bottom: AppSizes(context).paddingPageBottom,
              ),
              child: VersionTitleWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
