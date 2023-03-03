import 'package:advancio_test/core/base/base_view.dart';
import 'package:advancio_test/core/enum/view_state.dart';
import 'package:advancio_test/core/view_models/app_viewmodel.dart.dart';
import 'package:advancio_test/ui/common/app_colors.dart';
import 'package:advancio_test/ui/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AppViewModel>(
      onModelReady: (model) async {
        model.onLoad();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const CustomText(text: 'News'),
        ),
        body: model.state == ViewState.busy
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => Gap(20.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: model.articles.length,
                itemBuilder: (ctx, i) {
                  final article = model.articles[i];
                  return GestureDetector(
                    onTap: () {
                      model.navigateToNewsContentScreen(
                        title: article.title,
                        content: article.content,
                        image: article.urlToImage,
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: article.title!,
                          child: CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                  color: kPrimaryColor),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Gap(5),
                        CustomText(
                          text: article.title!,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: kDarkColor,
                        ),
                        const Gap(3),
                        CustomText(
                          text: 'Author : ${article.author}',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kDarkColor,
                        ),
                        const Gap(3),
                        CustomText(
                          text: 'Source : ${article.source!.name}',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kDarkColor,
                        ),
                        const Gap(5),
                        CustomText(
                          text: article.description!,
                          fontSize: 16,
                          color: kTextColor,
                        ),
                        const Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: 'Published at',
                              fontSize: 16,
                              color: kDarkColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: article.publishedAt!,
                              fontSize: 16,
                              color: kTextColor,
                            ),
                          ],
                        ),
                        Gap(10.h),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
