import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testcode/controllers/controller.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/models/task_dto.dart';
import 'package:testcode/views/todo/widgets/todo_card_widget.dart';
import 'package:testcode/views/todo/widgets/todo_detail_widget.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: PaddingConst.largeSpacing),
          if (todoController.completed.isNotEmpty)
            _buildSection(
              context: context,
              title: "Completed",
              child: _buildCompleted(),
            ),
          if (todoController.remaining.isNotEmpty)
            _buildSection(
              context: context,
              title: "Remaining",
              child: _buildRemaining(),
            ),
        ],
      );
    });
  }

  Widget _buildSection({
    required BuildContext context,
    String? title,
    Widget? child,
  }) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingConst.innerPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: FontConst.getLargeBoldContent(context)),
            Flexible(child: child!),
          ],
        ),
      ),
    );
  }

  Widget _buildCompleted() {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: todoController.completed.length,
        itemBuilder: (context, index) {
          TaskDto todo = todoController.completed[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => TodoDetailWidget(todo: todo));
            },
            onDoubleTap: () {
              todoController.updateTodo(todo);
            },
            child: TodoCard(taskDto: todo),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: PaddingConst.itemSpacing);
        },
      ),
    );
  }

  Widget _buildRemaining() {
    return Obx(
      () => ListView.separated(
        itemCount: todoController.remaining.length,
        itemBuilder: (context, index) {
          TaskDto todo = todoController.remaining[index];
          return GestureDetector(
            onTap: () {
              Get.dialog(TodoDetailWidget(todo: todo));
            },
            onDoubleTap: () {
              todoController.updateTodo(todo);
            },
            child: TodoCard(taskDto: todo),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: PaddingConst.itemSpacing);
        },
      ),
    );
  }
}
