import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/Illustrations/imports_illustrations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Services/Bloc_Service/data_render_builder.dart';
import '../manager/fetch_product_controller.dart';
import 'grid_card_product.dart';

class GridCardProductBuilder extends StatefulWidget {
  const GridCardProductBuilder({super.key});

  @override
  State<GridCardProductBuilder> createState() => _GridCardProductBuilderState();
}

class _GridCardProductBuilderState extends State<GridCardProductBuilder> {
  @override
  Widget build(BuildContext context) {
    final fetchController = context.watch<FetchProductController>();

    return StreamBuilder<List<ConnectivityResult>>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        final isOffline = snapshot.hasData &&
            snapshot.data!.isNotEmpty &&
            snapshot.data!.last == ConnectivityResult.none;

        if (isOffline) {
          return GridCardProduct(
            data: fetchController.cashedProduct,
          );
        }

        return DataRenderBuilder<List<ProductE>, FetchProductController>(
          cubit: fetchController,
          // loadingWidget: const Center(child: CircularProgressIndicator()),
          successBuilder: (data) => data.isEmpty
              ? const IllustrationSomethingWrongScreen(
                  body: "something went wrong",
                )
              : GridCardProduct(
                  data: data,
                ),
        );
      },
    );
  }
}
