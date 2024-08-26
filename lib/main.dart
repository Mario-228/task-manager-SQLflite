import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pretty_bloc_observer/pretty_bloc_observer.dart';
import 'package:task_manager_hive/core/cache_helper/cache_helper.dart';
import 'package:task_manager_hive/core/constants/constants.dart';
import 'package:task_manager_hive/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_hive/features/database_services_cubit/database_services_cubit.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/home_view.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  if (CacheHelper.getData(Constants.isDark) == null) {
    await CacheHelper.setData(Constants.isDark, false);
  }
  Bloc.observer = PrettyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DarkModeCubit(),
        ),
        BlocProvider(
          create: (context) => DatabaseServicesCubit()..getTasks(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeStates>(
      builder: (context, state) => ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: DarkModeCubit.get(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          home: const HomeView(),
        ),
      ),
    );
  }
}
