import 'package:simubank/simubank.dart';

//TODO (TDavid): Implement 404 page.
class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.pageNotFound)));
  }
}
