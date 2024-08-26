import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_hive/core/notification_service/notification_service.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views/widgets/home_view_body.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views_models/notification_cubit/notification_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationCubit(NotificationService())..createNotification(context),
      child: const Scaffold(
        appBar: CustomHomeAppBar(),
        body: HomeViewBody(),
      ),
    );
  }
}
