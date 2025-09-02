import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/models/task_dto.dart';
import 'package:testcode/controller/todo_provider.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.taskDto});
  final TaskDto taskDto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConst.innerPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: taskDto.isCompleted
            ? ColorConst.greenColor.withOpacity(0.2)
            : ColorConst.activeBlue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              spacing: PaddingConst.itemSpacing,
              children: [
                Icon(
                  Icons.task_alt,
                  color: taskDto.isCompleted
                      ? ColorConst.greenColor
                      : ColorConst.greyColor,
                ),
                Text(
                  taskDto.title ?? '',
                  style: FontConst.getLargeBoldContent(context),
                ),
              ],
            ),
          ),
          IconButton(
            color: ColorConst.redColor,
            onPressed: () {
              context.read<TodoProvider>().deleteTodo(taskDto.id);
            },
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
    );
  }
}
