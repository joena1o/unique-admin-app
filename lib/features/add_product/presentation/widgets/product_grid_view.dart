import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:unique_admin_application/core/app_colors.dart';
import 'package:unique_admin_application/core/app_routes.dart';
import 'package:unique_admin_application/features/add_product/presentation/widgets/top_search_sheet.dart';
import 'package:unique_admin_application/utils/font_class.dart';
import 'package:unique_admin_application/utils/responsive.dart';
import 'package:unique_admin_application/utils/utility_class.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller and animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );

    // Trigger animation after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Start the animation once the app is loaded/rendered
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int responsiveCheck() {
    if (Responsive.isExtraLarge(context)) return 3;
    if (Responsive.isDesktop(context)) return 2;
    if (Responsive.isTablet(context)) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: StaggeredGrid.count(
                crossAxisCount: responsiveCheck(),
                mainAxisSpacing: 30,
                axisDirection: AxisDirection.down,
                crossAxisSpacing: 20,
                children: List.generate(7, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _animation,
                        child: Container(
                          width: Responsive.isMobile(context)
                              ? double.infinity
                              : size.width * .5,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 5),
                        child: Text("Product Name"),
                      ),
                      const Text("N15,000"),
                      Container(
                        width: double.infinity,
                        margin: UtilityClass.verticalPadding,
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              decoration: UtilityClass.setButtonDecoration(
                                  AppColors.oranage),
                              child: ElevatedButton(
                                  onPressed: () {
                                    context.go(AppRoutes.editProducts);
                                  },
                                  child: const Text("Edit")),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              decoration:
                                  UtilityClass.setButtonDecoration(Colors.red),
                              child: ElevatedButton(
                                  onPressed: () {
                                    openSearch();
                                  },
                                  child: const Text("Delete")),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                })),
          ),
        )
      ],
    );
  }

  late OverlayEntry overlayEntry;

  void showTopSheet(BuildContext context, Widget child) {
    final overlay = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background shadow
          GestureDetector(
            onTap: () =>
                overlayEntry.remove(), // Dismiss top sheet on background tap
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), // Adjust opacity for shadow effect
            ),
          ),
          // Top sheet
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopSheet(child: child),
          ),
        ],
      ),
    );

    overlay.insert(overlayEntry);
  }

  void openSearch() {
    showTopSheet(
      context,
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  overlayEntry.remove();
                },
                icon: const Icon(Icons.close),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Are you sure you want to delete this item?",
              style: FontClass.buttonStyleBlack,
            ),
            Container(
              width: double.infinity,
              margin: UtilityClass.verticalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:
                        UtilityClass.setButtonDecoration(Colors.grey[400]!),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Cancel")),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration:
                        UtilityClass.setButtonDecoration(AppColors.green),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Yes")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
