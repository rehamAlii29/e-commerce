part of 'imports_illustration_builder.dart';

class IllustrationPageBuilder extends StatelessWidget {
  final String? title;
  final String? body;
  final String? redirectLabel;
  final String imageUrl;
  final String redirectImageUrl;
  final VoidCallback? onRedirect;
  final Widget? customButton;
  final bool reverseRedirectChildrenOrder;
  final bool showRedirectIcon;

  const IllustrationPageBuilder({
    Key? key,
    this.title,
    this.body,
    this.redirectLabel,
    required this.imageUrl,
    this.redirectImageUrl = Assets.reload,
    this.onRedirect,
    this.showRedirectIcon = true,
    this.customButton,
    this.reverseRedirectChildrenOrder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     ///
        //     Image.asset(
        //       imageUrl,
        //       // height: 150.toH(),
        //       // width: 150.toW(),
        //       width: 84.toW(),
        //       height: 59.toH(),
        //       fit: BoxFit.cover,
        //     ),
        //     Image.asset(
        //       Assets.imageOuter,
        //       width: 170.toW(),
        //       fit: BoxFit.cover,
        //     ),
        //   ],
        // ),
        ImageGeneric.asset(
          url: imageUrl,
          // height: 150.toH(),
          // width: 150.toW(),
          options: ImageOptions(
            width: 84.toW(),
            height: 59.toH(),
            fit: BoxFit.cover,
          ),
        ),
        25.8.ESH(),
        if (title != null) ...[
          CustomText(
            "$title",
            fontWeight: FW.semiBold,
            fontSize: 16,
          ),
          16.0.ESH(),
        ],
        if (body != null)
          CustomText.subtitle(
            "$body",
            padding: EdgeInsets.symmetric(horizontal: 30.0.toW()),
            fontSize: 13.toFS(),
            fontWeight: FW.light,
            textAlign: TextAlign.center,
          ),
        // if (onRedirect != null) ...[
        //   16.0.ESH(),
        //   RedirectionButton(
        //     showIcon: showRedirectIcon,
        //     padding: const EdgeInsets.symmetric(horizontal: 90.0),
        //     label: redirectLabel ?? "retry".tr,
        //     imageUrl: redirectImageUrl,
        //     onPressed: onRedirect,
        //   ),
        // ],
        if (customButton != null || onRedirect != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ConditionalBuilder(
              condition: customButton != null,
              onBuild: customButton ?? const SizedBox.shrink(),
              onFeedBack: onRedirect != null
                  ? Column(
                      children: [
                        16.0.ESH(),
                        ButtonRedirection(
                          reverseOrder: reverseRedirectChildrenOrder,
                          showIcon: showRedirectIcon,
                          padding: EdgeInsets.symmetric(horizontal: 90.0.toW()),
                          label: redirectLabel ?? "retry".tr,
                          imageUrl: redirectImageUrl,
                          onPressed: onRedirect,
                        ),
                      ],
                    )
                  : null,
            ),
          ),
      ],
    );
  }
}
