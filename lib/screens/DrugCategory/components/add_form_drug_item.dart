import 'package:flutter/material.dart';
import '../../../models/DrugItem.dart';
import '../../../bloc/bloc_export.dart';
import '../../../Theme/theme_export.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_alertbox.dart';
import '../../../widget/widget_textformfield.dart';
import '../../../bloc/DrugItemBloc/drug_item_bloc.dart';
import 'package:mboa_pharmacie/models/DrugCategories.dart';
import 'package:mboa_pharmacie/bloc/DrugItemBloc/drug_item_event.dart';
import 'package:mboa_pharmacie/bloc/DrugCategoriesBloc/drug_categories_event.dart';

class AddFormDrugItem extends StatefulWidget {
  final DrugCategories equipmentCategory;

  const AddFormDrugItem({required this.equipmentCategory});

  @override
  _AddFormDrugItemState createState() => _AddFormDrugItemState();
}

class _AddFormDrugItemState extends State<AddFormDrugItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void emptyField() {
    nameController.clear();
    descriptionController.clear();
    quantityController.clear();
  }

  void saveDrugItem(BuildContext context) {
    DrugItemBloc equipmentItemBloc = BlocProvider.of<DrugItemBloc>(context);

    DrugCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<DrugCategoriesBloc>(context);

    if (_formKey.currentState!.validate()) {
      // Create a new DrugItem based on the user input
      if (quantityController.text.isEmpty) {
        AlertBox.awesomeAlertBox(
            context, "Drug Item", "Entre la quantite s'il vous plait", () {});
      } else {
        DrugItem newDrugItem = DrugItem(
          id: 1, // Generate ID here
          DrugCategoryID: widget.equipmentCategory.id!,
          name: nameController.text,
          description: descriptionController.text,
          quantity: int.parse(quantityController.text),
        );

        // Fetch the DrugItemBloc

        // Add the new DrugItem to the DrugItemBloc
        equipmentItemBloc.add(AddDrugItem(Item: newDrugItem));
        equipmentCategoriesBloc.add(AddItemDrugCategories(
            Item: newDrugItem, DrugCategory: widget.equipmentCategory));
        // Clear the fields
        AlertBox.awesomeAlertBox(
            context, "Drug Item", "Drug cree avec sucess!!!", () {});
        emptyField();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrugItemBloc>(
      create: (context) => DrugItemBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Drug Item"),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                WidgetTextForm.getTextField(
                  "Name",
                  nameController,
                  TextInputType.text,
                  "Enter name",
                  WidgetIcon.userAccount(false),
                ),
                SizedBox(
                  height: 15,
                ),
                WidgetTextForm.getTextField(
                  "Description",
                  descriptionController,
                  TextInputType.text,
                  "Enter description",
                  WidgetIcon.description(false),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    hintText: 'Enter quantity',
                    prefixIcon: Icon(Icons.add_box),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Builder(
                  builder: (context) {
                    return WidgetButton.largeButton(
                      "Submit",
                      AppTextTheme.buttonwhite,
                      AppColors.primary,
                      null,
                      () => saveDrugItem(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
