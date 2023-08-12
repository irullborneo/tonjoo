import 'package:get/get.dart';

class NestedNavigationParam {
  final String name;
  final GetPageBuilder page;
  final Bindings? binding;

  const NestedNavigationParam({
    required this.name,
    required this.page,
    required this.binding,
  });
}