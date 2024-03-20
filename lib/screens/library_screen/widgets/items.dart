import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetItems extends StatelessWidget {
  const GetItems({
    super.key,
    required this.imagePath,
    required this.name,
    required this.onTap,
  });

  final String imagePath;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 450.h,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                placeholder: (context, imageUrl) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, imageUrl, error) =>
                    const Icon(Icons.error),
                width: 280.w,
                height: 250.h,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
