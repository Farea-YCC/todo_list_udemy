import 'package:todo_list_udemy/components/imports.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var textTheme = theme.textTheme;

    return BlocConsumer<AppCubit, MainAppStates>(
      builder: (context, state) {
        var tasks = AppCubit.get(context).tasks;
        return SafeArea(
          child: ConditionalBuilder(
            condition: tasks.isNotEmpty,
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(

                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 40,
                            child: Text(
                              tasks[index]['time'],
                            ),
                          ),
                          horzintalSpace,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tasks[index]['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme
                                        .onSurface, // لون النص بناءً على الثيم
                                  ),
                                ),
                                Text(
                                  tasks[index]['date'],
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurface,
                                  ),
                                )
                              ],
                            ),
                          ),
                          horzintalSpace,
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).updateData(
                                id: tasks[index]['id'],
                                status: 1,
                                context: context,
                                message: 'Add to Done List Successfully',
                              );
                            },
                            icon: Icon(Icons.task_alt,
                                color: colorScheme.primary),
                          ),
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).updateData(
                                id: tasks[index]['id'],
                                status: 2,
                                context: context,
                                message: 'Add to Archive List Successfully',
                              );
                            },
                            icon: Icon(Icons.archive_outlined,
                                color: colorScheme.secondary),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => verticalSpace,
                itemCount: tasks.length,
              ),
            ),
            fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(
                color: colorScheme.primary, // جعل مؤشر التحميل يأخذ لون الثيم
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
