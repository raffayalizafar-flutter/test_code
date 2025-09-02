import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testcode/controllers/controller.dart';
import 'package:testcode/controllers/settings_controller.dart';
import 'package:testcode/controllers/tab_controller.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/views/todo/todo_view.dart';
import 'package:testcode/views/weather/weather_view.dart';
import 'package:testcode/widgets/new_task_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(),
      floatingActionButton: Obx(() {
        return tabsController.currentHomeTab.value == HomeTabs.todo
            ? FloatingActionButton(
                child: Icon(Icons.add_task, color: Colors.white),
                onPressed: () => Get.dialog(NewTaskWidget()),
              )
            : SizedBox.shrink();
      }),
      body: Column(
        children: [
          Obx(() {
            return _OptionButtons(
              groupValue: tabsController.currentHomeTab.value,
              onValueChanged: (value) {
                if (value != null) {
                  tabsController.changeHomeTab(value);
                }
              },
            );
          }),
          Expanded(
            child: Obx(() {
              return getHomeBody(tabsController.currentHomeTab.value);
            }),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home", style: FontConst.getLargeBoldContent(context)),
          Obx(() {
            return IconButton.filled(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity(horizontal: -3, vertical: -3),
              onPressed: () {
                settingsController.changeAppTheme();
              },
              icon: settingsController.theme.value == AppearanceType.light
                  ? Icon(
                      Icons.dark_mode,
                      size: PaddingConst.largeIcon,
                      color: ColorConst.white,
                    )
                  : Icon(
                      Icons.light_mode,
                      size: PaddingConst.largeIcon,
                      color: ColorConst.white,
                    ),
            );
          }),
        ],
      ),
    );
  }
}

class _OptionButtons extends StatelessWidget {
  final HomeTabs groupValue;
  final void Function(HomeTabs?) onValueChanged;
  const _OptionButtons({
    required this.groupValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingConst.innerPadding),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl(
          thumbColor: ColorConst.activeBlue,
          groupValue: groupValue,
          backgroundColor: ColorConst.getSlidingSegmentedControlBg(context),
          onValueChanged: (value) {
            onValueChanged.call(value);
          },
          children: {
            for (final option in HomeTabs.values)
              option: Text(
                option.enumName.tr,
                style: FontConst.getContent(context).copyWith(
                  color: groupValue == option ? ColorConst.white : null,
                ),
              ),
          },
        ),
      ),
    );
  }
}

Widget getHomeBody(HomeTabs value) {
  switch (value) {
    case HomeTabs.todo:
      return const TodoView();

    case HomeTabs.weather:
      return const WeatherView();
  }
}
