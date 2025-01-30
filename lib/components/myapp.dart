import 'package:todo_list_udemy/Layout/HomeLayout.dart';
import 'package:todo_list_udemy/components/imports.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home:  const HomeLayout(),
    );
  }
}