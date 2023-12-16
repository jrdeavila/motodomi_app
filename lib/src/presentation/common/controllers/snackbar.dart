import 'package:motodomi_app/lib.dart';

showSnackbar(
  String title,
  String message, {
  IconData? icon,
  String? actionLabel,
  VoidCallback? actionCallback,
}) {
  final action = actionLabel != null
      ? SnackBarAction(
          label: actionLabel,
          onPressed: () {
            actionCallback?.call();
            Get.closeCurrentSnackbar();
          },
        )
      : IconButton(
          onPressed: () => Get.closeCurrentSnackbar(),
          icon: const Icon(Icons.close),
        );
  Get.closeAllSnackbars();
  return Get.showSnackbar(GetSnackBar(
    snackPosition: SnackPosition.TOP,
    title: title,
    message: message,
    backgroundColor: Get.theme.colorScheme.secondary,
    borderRadius: 20,
    mainButton: action,
    margin: const EdgeInsets.all(20),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.decelerate,
    animationDuration: 500.milliseconds,
  ));
}
