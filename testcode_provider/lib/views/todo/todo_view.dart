import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/models/task_dto.dart';
import 'package:testcode/controller/todo_provider.dart';
import 'package:testcode/views/todo/widgets/todo_card_widget.dart';
import 'package:testcode/views/todo/widgets/todo_detail_widget.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    super.initState();
    context.read<TodoProvider>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todoController, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: PaddingConst.largeSpacing),
            if (todoController.completed.isNotEmpty)
              _buildSection(
                context: context,
                title: "Completed",
                child: _buildCompleted(todoController),
              ),
            if (todoController.remaining.isNotEmpty)
              _buildSection(
                context: context,
                title: "Remaining",
                child: _buildRemaining(todoController),
              ),
          ],
        );
      },
    );
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

  Widget _buildCompleted(TodoProvider todoController) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: todoController.completed.length,
      itemBuilder: (context, index) {
        TaskDto todo = todoController.completed[index];
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => TodoDetailWidget(todo: todo),
            );
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
    );
  }

  Widget _buildRemaining(TodoProvider todoController) {
    return ListView.separated(
      itemCount: todoController.remaining.length,
      itemBuilder: (context, index) {
        TaskDto todo = todoController.remaining[index];
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => TodoDetailWidget(todo: todo),
            );
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
    );
  }
}
