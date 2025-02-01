import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Resources/DataState/data_state.dart';
import 'package:flutter_base/src/Core/NetworkStructure/Resources/Errors/error_model.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class SimpleErrorHandlerBuilder extends StatelessWidget {
  final ErrorModel? error;

  const SimpleErrorHandlerBuilder({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 50,
              color: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            if (kDebugMode) ...[
              CustomText(
                error?.type.toString() ?? "",
                fontSize: 20,
                isBold: true,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
            CustomText.subtitle(
              "illustration_something_went_wrong_details",
            ),
          ],
        ),
      ),
    );
  }
}
