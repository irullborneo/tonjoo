import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tonjoo/config/routes/tj_pages.dart';
import 'package:tonjoo/core/params/nested_navigation_param.dart';

class HomeController extends GetxController {
  final List<NestedNavigationParam> _pageList = [];
  final List<String> _pageName = [];

  final RxInt currentIndex = 0.obs;
  final RxString initialRoute = ''.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    _pageList.clear();
    _pageName.clear();

    _pageList.addAll(TjPages.getNestedPage());
    _pageName.addAll(_pageList.map((e) => e.name).toList());

    if (_pageName.isNotEmpty) {
      initialRoute.value = _pageName.first;
    }

    ever(currentIndex, (_) {
      Get.offAllNamed(_pageName[currentIndex.value], id: 1);
    });

    super.onInit();
  }

  @override
  void onReady() {
    final args = Get.arguments;
    if(args != null){
      currentIndex.value = args['tap'] ?? 0;
    }

    super.onReady();
  }

  void changePage(int index) {
    currentIndex.value = index;
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (_pageName.contains(settings.name)) {
      final page =
      _pageList.firstWhere((element) => element.name == settings.name);

      return GetPageRoute(
        settings: settings,
        page: page.page,
        binding: page.binding,
        transition: Transition.noTransition,
      );
    }

    return GetPageRoute(
      settings: settings,
      page: () => const SizedBox(),
    );
  }
}