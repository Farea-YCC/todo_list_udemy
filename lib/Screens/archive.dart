import 'package:todo_list_udemy/components/imports.dart';
import 'package:todo_list_udemy/components/task_card.dart';


class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, MainAppStates>(
        builder: (context, state) {
          var archive = AppCubit.get(context).archive;
          return SafeArea(
              child: ConditionalBuilder(
            condition: archive.isNotEmpty,
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      child: SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 40,
                              child: Text(
                                archive[index]['time'],
                              ),
                            ),
                            horzintalSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    archive[index]['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    archive[index]['date'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => verticalSpace,
                  itemCount: archive.length),
            ),
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ));
        },
        listener: (context, state) {});
  }
}