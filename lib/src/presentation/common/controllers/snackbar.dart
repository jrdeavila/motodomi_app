import 'package:motodomi_app/lib.dart';

void showSnackbar(
  String title,
  String message, {
  IconData? icon,
  String? actionLabel,
  VoidCallback? actionCallback,
}) {
  late SnackbarController controller;
  final action = actionLabel != null
      ? SnackBarAction(
          label: actionLabel,
          onPressed: () {
            actionCallback?.call();
            controller.close();
          },
        )
      : IconButton(
          onPressed: () => controller.close(),
          icon: const Icon(Icons.close),
        );
  Get.closeAllSnackbars();
  controller = Get.showSnackbar(GetSnackBar(
    snackPosition: SnackPosition.TOP,
    title: title,
    message: message,
    backgroundColor: Get.theme.colorScheme.tertiary,
    borderRadius: 20,
    mainButton: action,
    margin: const EdgeInsets.all(20),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.decelerate,
    animationDuration: 500.milliseconds,
  ));
}
