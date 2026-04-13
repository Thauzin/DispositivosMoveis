import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Provider/task_provider.dart';
import '../Widgets/task_widgets.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  void _openAddSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddTaskSheet(),
    );
  }

  void _openRemoveDialog(BuildContext context, WidgetRef ref) {
    final tasks = ref.read(taskProvider);
    if (tasks.isEmpty) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Remover tarefa',
          style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF1B4332)),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (_, i) {
              final task = tasks[i];
              return ListTile(
                leading: Icon(
                  task.isDone
                      ? Icons.check_circle_rounded
                      : Icons.radio_button_unchecked_rounded,
                  color: task.isDone ? const Color(0xFF2D6A4F) : Colors.grey,
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                    color: task.isDone ? Colors.grey : Colors.black87,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline_rounded,
                      color: Color(0xFFB5361C)),
                  onPressed: () {
                    ref.read(taskProvider.notifier).removeTask(task.id);
                    Navigator.of(ctx).pop();
                  },
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar',
                style: TextStyle(color: Color(0xFF1B4332))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending = ref.watch(pendingTasksProvider);
    final done = ref.watch(doneTasksProvider);

    final items = <Object>[
      if (pending.isNotEmpty) ...['header_pending', ...pending],
      if (done.isNotEmpty) ...['header_done', ...done],
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Column(
          children: [

            const TaskHeader(),

            Expanded(
              child: items.isEmpty
                  ? const EmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 100),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        if (item == 'header_pending') {
                          return const SectionLabel(
                            label: 'PENDENTES',
                            color: Color.fromARGB(255, 201, 204, 27),
                          );
                        }
                        if (item == 'header_done') {
                          return const SectionLabel(
                            label: 'CONCLUÍDAS',
                            color: Color.fromARGB(255, 44, 245, 154),
                          );
                        }

                        final task = item as Task;
                        return TaskTile(key: ValueKey(task.id), task: task);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddSheet(context),
        backgroundColor: const Color.fromARGB(255, 47, 200, 238),
        foregroundColor: Colors.white,
        elevation: 4,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Nova Tarefa',
            style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
