import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wallet/core/providers/history_provider.dart';
import 'package:riverpod_wallet/ui/shared/utils/constants.dart';

class HistoryPanelView extends ConsumerWidget {
  const HistoryPanelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);

    return Column(
      children: [
        const SizedBox(height: 15.0),
        Center(
          child: Container(
            height: 8.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        todos.isEmpty
            ? Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 8),
                  const Icon(Icons.history, size: 35.0, color: kTextColor),
                  const SizedBox(height: 10.0),
                  const Text(
                    'No transactions record yet.',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: kTextColor,
                    ),
                  ),
                ],
              )
            : Expanded(
                child: ListView(
                  children: [
                    for (final todo in todos)
                      CheckboxListTile(
                        value: todo.completed,
                        // When tapping on the todo, change its completed status
                        onChanged: (value) => ref.read(todosProvider.notifier).toggle(todo.id),
                        title: Text(todo.description),
                      ),
                  ],
                ),
              ),
      ],
    );
  }
}
