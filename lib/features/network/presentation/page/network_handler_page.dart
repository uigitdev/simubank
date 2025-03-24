import 'package:simubank/simubank.dart';

class NetworkHandlerPage extends StatefulWidget {
  final Widget page;

  const NetworkHandlerPage({super.key, required this.page});

  @override
  State<NetworkHandlerPage> createState() => _NetworkHandlerPageState();
}

class _NetworkHandlerPageState extends State<NetworkHandlerPage>
    with AppUIHelper {
  late StreamSubscription? subscription;

  @override
  void initState() {
    /// Check listen Internet connection
    ///
    /// If there is no internet connection, show a snackbar.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      subscription = Connectivity().onConnectivityChanged.listen((results) {
        if (results.contains(ConnectivityResult.none) && mounted) {
          showErrorSnackbar(context, AppStrings.snackBarNoInternet);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.page;
  }
}
