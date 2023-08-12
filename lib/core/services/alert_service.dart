import 'package:get/get.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';

class AlertService {
  final String title, message;
  AlertService({required this.title, required this.message});

  void showSuccess() {
    Get.snackbar(title, message,
        duration: const Duration(seconds: 2),
        colorText: TjColors.neutral10, backgroundColor: TjColors.successMain);
  }

  void showWarning() {
    Get.snackbar(title, message,
        colorText: TjColors.neutral10, backgroundColor: TjColors.confirmed);
  }

  void showError() {
    Get.snackbar(title, message,
        colorText: TjColors.neutral10, backgroundColor: TjColors.dangerMain);
  }

  void showInfo() {
    Get.snackbar(title, message,
        duration: const Duration(seconds: 1),
        colorText: TjColors.neutral10, backgroundColor: TjColors.infoMain);
  }
}
