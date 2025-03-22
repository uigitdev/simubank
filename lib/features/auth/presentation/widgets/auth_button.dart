import 'package:simubank/simubank.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final bool showProgress;
  final VoidCallback onTap;

  const AuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isEnabled = true,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(AppSizes(context).buttonRadius),
      color:
          isEnabled
              ? Theme.of(context).primaryColor
              : Theme.of(context).disabledColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSizes(context).buttonRadius),
        onTap: isEnabled ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes(context).buttonRadius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes(context).paddingHorizontal,
            vertical: AppSizes(context).paddingButtonInternalVertical,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Visibility(
                visible: showProgress,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSizes(context).buttonCircularIndicator,
                  ),
                  child: SizedBox(
                    width: AppSizes(context).buttonCircularIndicator,
                    height: AppSizes(context).buttonCircularIndicator,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      strokeWidth:
                          AppSizes(context).buttonCircularIndicatorStroke,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
