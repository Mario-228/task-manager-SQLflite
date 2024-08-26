import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    super.key,
    required this.title,
    required this.time,
    required this.description,
  });
  final String title;
  final String time;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 15.sp),
      ),
      SizedBox(height: 5.h),
      Row(
        children: [
          const Icon(
            FontAwesomeIcons.clock,
            size: 15,
            color: Colors.white,
          ),
          SizedBox(width: 5.w),
          Text(
            time,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      SizedBox(height: 5.h),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.06,
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: Text(
          description,
          style: const TextStyle(
            color: Colors.white,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
