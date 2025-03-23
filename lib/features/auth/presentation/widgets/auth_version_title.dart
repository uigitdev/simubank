import 'package:simubank/simubank.dart';

class AuthVersionTitle extends StatelessWidget {
  const AuthVersionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            AppStrings.versionTitle
                .charReplacer('{year}', value: '${DateTime.now().year}')
                .charReplacer('{name}', value: AppStrings.appName)
                .charReplacer('{version}', value: snapshot.data!.version),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
