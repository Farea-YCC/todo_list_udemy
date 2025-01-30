import 'dart:io';

void main() {
  final projectPath = "${Directory.current.path}/lib";
  final structure = {
    '$projectPath/core': ['constants.dart', 'failure.dart'],
    '$projectPath/data/datasource': ['local_database.dart'],
    '$projectPath/data/models': ['task_model.dart'],
    '$projectPath/data/repositories': ['task_repository_impl.dart'],
    '$projectPath/domain/entities': ['task.dart'],
    '$projectPath/domain/repositories': ['task_repository.dart'],
    '$projectPath/domain/usecases': [
      'add_task.dart',
      'get_tasks.dart',
      'update_task.dart'
    ],
    '$projectPath/presentation/bloc': [
      'task_bloc.dart',
      'task_event.dart',
      'task_state.dart'
    ],
    '$projectPath/presentation/pages': [
      'home_page.dart',
      'task_list_page.dart'
    ],
  };

  // Loop through the structure to create folders and files
  structure.forEach((folderPath, files) {
    final directory = Directory(folderPath);

    // Check if folder exists, create if not
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      print('Created folder: $folderPath ✔');
    } else {
      print('Folder already exists: $folderPath');
    }

    // Create each file in the folder
    for (var file in files) {
      final filePath = '$folderPath/$file';
      final fileInstance = File(filePath);

      if (!fileInstance.existsSync()) {
        fileInstance.createSync();
        print('Created file: $filePath ✔');
      } else {
        print('File already exists: $filePath');
      }
    }
  });

  // Create the main.dart file if it doesn't exist
  final mainFile = File('$projectPath/main.dart');
  if (!mainFile.existsSync()) {
    mainFile.createSync();
    print('Created file: ${mainFile.path} ✔');
  } else {
    print('File already exists: ${mainFile.path}');
  }

  print('Folder and file structure created successfully ✔');
}
