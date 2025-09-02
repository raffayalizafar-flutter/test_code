import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcode/controller/settings_provider.dart';
import 'package:testcode/controller/tab_provider.dart';
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
      appBar: const _CustomAppBar(),
      floatingActionButton: Consumer<TabsProvider>(
        builder: (context, tabsController, _) {
          return tabsController.currentHomeTab == HomeTabs.todo
              ? FloatingActionButton(
                  child: const Icon(Icons.add_task, color: Colors.white),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => const NewTaskWidget(),
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
      body: Column(
        children: [
          Consumer<TabsProvider>(
            builder: (context, tabsController, _) {
              return _OptionButtons(
                groupValue: tabsController.currentHomeTab,
                onValueChanged: (value) {
                  if (value != null) {
                    tabsController.changeHomeTab(value);
                  }
                },
              );
            },
          ),
          Expanded(
            child: Consumer<TabsProvider>(
              builder: (context, tabsController, _) {
                return getHomeBody(tabsController.currentHomeTab);
              },
            ),
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
          Consumer<SettingsProvider>(
            builder: (context, settingsController, _) {
              return IconButton.filled(
                padding: EdgeInsets.zero,
                visualDensity: const VisualDensity(
                  horizontal: -3,
                  vertical: -3,
                ),
                onPressed: () {
                  settingsController.changeAppTheme();
                },
                icon: settingsController.theme == AppearanceType.light
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
            },
          ),
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
          onValueChanged: onValueChanged,
          children: {
            for (final option in HomeTabs.values)
              option: Text(
                option.enumName,
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
