import 'package:flutter/material.dart';
import 'package:testcode/core/constants/color_const.dart';
import 'package:testcode/core/constants/font_const.dart';
import 'package:testcode/core/constants/padding_const.dart';
import 'package:testcode/models/task_dto.dart';
import 'package:testcode/widgets/custom_dialog_wrapper.dart';

class TodoDetailWidget extends StatelessWidget {
  const TodoDetailWidget({super.key, required this.todo});
  final TaskDto todo;

  @override
  Widget build(BuildContext context) {
    return CustomDialogWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Todo Details", style: FontConst.getLargeBoldContent(context)),
          SizedBox(height: PaddingConst.sectionSpacing),
          Icon(Icons.task_alt, size: 50, color: ColorConst.getPrimary(context)),
          SizedBox(height: PaddingConst.itemSpacing),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  todo.title ?? '',
                  style: FontConst.getLargeBoldContent(context),
                ),
                SizedBox(height: PaddingConst.itemSpacing),
                Text("Description: ", style: FontConst.getBoldContent(context)),
                Flexible(
                  child: Text(
                    todo.description ?? '',
                    style: FontConst.getContent(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
