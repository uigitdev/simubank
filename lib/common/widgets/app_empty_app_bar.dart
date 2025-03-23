import 'package:simubank/simubank.dart';

class AppEmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppEmptyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0.0);
}
