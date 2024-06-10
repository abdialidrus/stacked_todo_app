import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_todo_app/ui/common/ui_helpers.dart';
import 'package:stacked_todo_app/ui/views/todo/todo_view.form.dart';

import 'todo_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'todoTitleInput',
    validator: TodoTitleValidator.validateTodoTitle,
  ),
])
class TodoView extends StackedView<TodoViewModel> with $TodoView {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TodoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What To Do Today?'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Create a new TODO',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  verticalSpaceSmall,
                  TextFormField(
                    controller: todoTitleInputController,
                    decoration:
                        const InputDecoration(hintText: 'Your To Do Title'),
                  ),
                  if (viewModel.hasTodoTitleInputValidationMessage) ...[
                    verticalSpaceTiny,
                    Text(
                      viewModel.todoTitleInputValidationMessage!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                  verticalSpaceMedium,
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      if (validateFormFields(viewModel)) {
                        viewModel.addTodo();
                      }
                    },
                    child: const Text(
                      'Create TODO',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            viewModel.todos.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('No Todos'),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: viewModel.todos.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (_, index) {
                      final todo = viewModel.todos[index];
                      return ListTile(
                        onTap: () {},
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (value) {
                            if (value!) {
                              viewModel.markToDoAsDone(todo);
                            } else {
                              viewModel.markToDoAsUnDone(todo);
                            }
                          },
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  @override
  TodoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TodoViewModel();

  @override
  void onViewModelReady(TodoViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.getTodos();
  }
}
