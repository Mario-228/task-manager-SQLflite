import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTaskViewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomTaskViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
