import 'package:flutter_riverpod/flutter_riverpod.dart';

class Task {
  final String id;
  final String title;
  final bool isDone;

  const Task({
    required this.id,
    required this.title,
    this.isDone = false,
  });

  Task copyWith({String? title, bool? isDone}) {
    return Task(
      id: id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}


class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier()
      : super([
          Task(id: DateTime.now().microsecondsSinceEpoch.toString(), title: 'Estudar Para Prova'),
          Task(id: DateTime.now().microsecondsSinceEpoch.toString(), title: 'Estudar Flutter', isDone: true),
          Task(id: DateTime.now().microsecondsSinceEpoch.toString(), title: 'Jogar com Amigos'),
        ]);

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    state = [...state, Task(id: DateTime.now().microsecondsSinceEpoch.toString(), title: title.trim())];
  }

  void removeTask(String id) {
    state = state.where((t) => t.id != id).toList();
  }

  void toggleTask(String id) {
    state = [
      for (final t in state)
        if (t.id == id) t.copyWith(isDone: !t.isDone) else t,
    ];
  }
}

final taskProvider =
    StateNotifierProvider<TaskNotifier, List<Task>>((ref) => TaskNotifier());

final pendingTasksProvider = Provider<List<Task>>(
  (ref) => ref.watch(taskProvider).where((t) => !t.isDone).toList(),
);

final doneTasksProvider = Provider<List<Task>>(
  (ref) => ref.watch(taskProvider).where((t) => t.isDone).toList(),
);

final progressProvider = Provider<double>((ref) {
  final tasks = ref.watch(taskProvider);
  if (tasks.isEmpty) return 0;
  return tasks.where((t) => t.isDone).length / tasks.length;
});
