import '../../bloc/bloc_export.dart';
import 'package:flutter/material.dart';
import '../../Theme/theme_export.dart';
import 'package:flutter/material.dart';
import '../../widget/widget_button.dart';
import '../../models/EquipementCategories.dart';
import '../../services/localisationService/t_key.dart';
import 'components/all_equipement_categoriesList.dart';
import 'package:mboa_pharmacie/utils/navigate_screen.dart';
import '../../bloc/EquipementCategoriesBloc/equipement_categories_bloc.dart';
import '../../bloc/EquipementCategoriesBloc/equipement_categories_state.dart';
import 'package:mboa_pharmacie/screens/AllEquipementCategories/components/add_form_equipement_category.dart';

class AllEquipementCategoryScreen extends StatefulWidget {
  const AllEquipementCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllEquipementCategoryScreen> createState() =>
      _AllEquipementCategoryScreenState();
}

class _AllEquipementCategoryScreenState
    extends State<AllEquipementCategoryScreen> with TickerProviderStateMixin {
  late List<EquipmentCategories> equipementCategoriesList;

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<EquipmentCategoriesBloc, EquipmentCategoriesState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                // Flexible(
                //   flex: 1,
                // child:
                WidgetButton.largeButton(
                    "Ajoutez une Categorie d'equipement",
                    AppTextTheme.buttonwhite,
                    AppColors.primary,
                    null, () async {
                  NavigationScreen.navigate(
                      context, AddFormEquipementCategory());
                  // Implement your action here
                }),
                // ),
                SizedBox(height: 10),
                Expanded(
                  child: state.allEquipmentCategories.isNotEmpty
                      ? FadeTransition(
                          opacity: _animation,
                          child: _gridView(state.allEquipmentCategories),
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

  Widget _gridView(List<EquipmentCategories> allEquipmentCategories) {
    return GridView.builder(
      itemCount: allEquipmentCategories.length,
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
              child: AllEquipmentCategoriesList(
                equipment_categories: allEquipmentCategories[index],
              ),
            );
          },
        );
      },
    );
  }
}
