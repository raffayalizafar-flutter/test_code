import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/controller/todo_provider.dart';
import 'package:testcode/widgets/custom_dialog_wrapper.dart';
import 'package:testcode/widgets/custom_textfield.dart';

class NewTaskWidget extends StatefulWidget {
  const NewTaskWidget({super.key});

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  final GlobalKey<FormState> todoFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final todoProvider = context.read<TodoProvider>();
    titleController = TextEditingController(
      text: todoProvider.newTodo.title ?? "",
    );
    descriptionController = TextEditingController(
      text: todoProvider.newTodo.description ?? "",
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return CustomDialogWrapper(
      child: Form(
        key: todoFormKey,
        child: Column(
          children: [
            Text("New Task", style: FontConst.getLargeBoldContent(context)),
            CustomCupertinoField(
              aboveSpacing: PaddingConst.itemSpacing,
              controller: titleController,
              focusNode: titleFocusNode,
              labelText: "Title*",
              validationMessage: "Title is required",
              onChanged: (value) {
                todoProvider.newTodo = todoProvider.newTodo.copyWith(
                  title: value,
                );
              },
            ),
            CustomCupertinoField(
              aboveSpacing: PaddingConst.itemSpacing,
              minLines: 5,
              maxLines: 5,
              controller: descriptionController,
              focusNode: descriptionFocusNode,
              labelText: "Description*",
              validationMessage: "Description is required",
              onChanged: (value) {
                todoProvider.newTodo = todoProvider.newTodo.copyWith(
                  description: value,
                );
              },
            ),
            const Spacer(),
            CupertinoButton.filled(
              onPressed: () async {
                if (_submit()) {
                  todoProvider.addTodo(todoProvider.newTodo);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }

  bool _submit() {
    if (titleController.text.trim().isEmpty) {
      titleFocusNode.requestFocus();
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      descriptionFocusNode.requestFocus();
      return false;
    }
    return true;
  }
}
