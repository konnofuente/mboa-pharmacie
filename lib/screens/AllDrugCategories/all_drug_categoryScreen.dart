import '../../bloc/bloc_export.dart';
import 'package:flutter/material.dart';
import '../../Theme/theme_export.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_button.dart';
import '../../models/DrugCategories.dart';
import 'components/all_drug_categoriesList.dart';
import '../../services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import '../../bloc/DrugCategoriesBloc/drug_categories_bloc.dart';
import '../../bloc/DrugCategoriesBloc/drug_categories_state.dart';
import 'package:mboa_pharmacie/screens/AllDrugCategories/components/medical_prescription.dart';

class AllDrugCategoryScreen extends StatefulWidget {
  const AllDrugCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllDrugCategoryScreen> createState() => _AllDrugCategoryScreenState();
}

class _AllDrugCategoryScreenState extends State<AllDrugCategoryScreen>
    with TickerProviderStateMixin {
  late List<DrugCategories> equipementCategoriesList;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize your list
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

    List<DrugCategories> drugCategoriesList = [
   DrugCategories(
      id: 1,
      name: 'Paracetamol',
      items: [],
      imageUrl: 'https://th.bing.com/th/id/R.5bb34d74e356117336ff043c42f12163?rik=j5yHygmFP5hnDQ&pid=ImgRaw&r=0',
      bannerUrl: 'https://th.bing.com/th/id/R.5bb34d74e356117336ff043c42f12163?rik=j5yHygmFP5hnDQ&pid=ImgRaw&r=0',
    ),
    DrugCategories(
      id: 2,
      name: 'Doliprane',
      items: [],
      imageUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750157390391L.jpg',
      bannerUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750157390391L.jpg',
    ),
    DrugCategories(
      id: 2,
      name: 'Doliprane',
      items: [],
      imageUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750157390391L.jpg',
      bannerUrl: 'https://res.cloudinary.com/walmart-labs/image/upload/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750157390391L.jpg',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<DrugCategoriesBloc, DrugCategoriesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.lightgray,
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 10),

                WidgetButton.largeButton(
                    "Make a medical prescription",
                    AppTextTheme.buttonwhite,
                    AppColors.primary,
                    null, () async {
                  NavigationScreen.navigate(context, MedicalPrescription());
                  // Implement your action here
                }),
                // ),
                SizedBox(height: 10),
                Expanded(
                  child: drugCategoriesList.isNotEmpty
                      ? FadeTransition(
                          opacity: _animation,
                          // child: _gridView(state.allDrugCategories),
                          child: _gridView(drugCategoriesList),
                        )
                      : Center(child: Text("No category created yet")),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _gridView(List<DrugCategories> allDrugCategories) {
    return GridView.builder(
      itemCount: allDrugCategories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 8.0 / 9.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _animation.value,
              child: AllDrugCategoriesList(
                equipment_categories: allDrugCategories[index],
              ),
            );
          },
        );
      },
    );
  }
}
