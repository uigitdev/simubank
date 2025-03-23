import 'package:simubank/simubank.dart';

class HomeWelcomeTitle extends StatelessWidget {
  const HomeWelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        String? name;
        if (state is UserGetProfileDetailsSuccess) {
          name = state.profile.name;
        }
        return RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: AppStrings.profileHello,
            style: Theme.of(context).textTheme.labelLarge,
            children: [
              TextSpan(
                text: name != null ? ' $name!' : '',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
