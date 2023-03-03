import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NewsContentScreen extends StatelessWidget {
  const NewsContentScreen({
    super.key,
    required this.image,
    required this.content,
    required this.title,
  });

  final String content;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Hero(
              tag: title,
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fitWidth,
              ),
            ),
            Gap(5.h),
            CustomText(
              text: title,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            Gap(10.h),
            Expanded(
              child: CustomText(
                text: content,
                fontSize: 16,
                color: kTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
