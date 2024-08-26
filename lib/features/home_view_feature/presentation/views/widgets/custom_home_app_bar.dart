import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:task_manager_hive/features/home_view_feature/presentation/views_models/notification_cubit/notification_cubit.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.nightlight_round),
        onPressed: () async {
          BlocProvider.of<NotificationCubit>(context).displayNotification(
              title: "Theme changed",
              body: !DarkModeCubit.get(context).isDark ? "Dark" : "Light");
          // BlocProvider.of<NotificationCubit>(context).secheduleNotification();
          await DarkModeCubit.get(context).changeThemeMode();
        },
      ),
      actions: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const NetworkImage(
              'https://img.freepik.com/free-photo/user-front-side-with-white-background_187299-40007.jpg?t=st=1724515376~exp=1724518976~hmac=d32bd5e702cd5df4aca674aebedde7d41b1a1fcd760c07eb02f5b93d50ea3334&w=740'),
        ),
        const SizedBox(
          width: 10.0,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
