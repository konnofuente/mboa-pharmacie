import 'package:mboa_pharmacie/bloc/EquipementCategoriesBloc/equipement_categories_event.dart';
import 'package:mboa_pharmacie/models/EquipementCategories.dart';
import 'package:flutter/material.dart';

import '../../../Theme/theme_export.dart';
import '../../../bloc/EquipementItemBloc/equipement_Item_event.dart';
import '../../../bloc/EquipementItemBloc/equipement_item_bloc.dart';
import '../../../bloc/bloc_export.dart';
import '../../../models/EquipementItem.dart';
import '../../../widget/widget_alertbox.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_textformfield.dart';

class AddFormEquipementItem extends StatefulWidget {
  final EquipmentCategories equipmentCategory;

  const AddFormEquipementItem({required this.equipmentCategory});

  @override
  _AddFormEquipementItemState createState() => _AddFormEquipementItemState();
}

class _AddFormEquipementItemState extends State<AddFormEquipementItem> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void emptyField() {
    nameController.clear();
    descriptionController.clear();
    quantityController.clear();
  }

  void saveEquipmentItem(BuildContext context) {
    EquipmentItemBloc equipmentItemBloc =
        BlocProvider.of<EquipmentItemBloc>(context);

    EquipmentCategoriesBloc equipmentCategoriesBloc =
        BlocProvider.of<EquipmentCategoriesBloc>(context);

    if (_formKey.currentState!.validate()) {
      // Create a new EquipmentItem based on the user input
      if (quantityController.text.isEmpty) {
        AlertBox.awesomeAlertBox(context, "Equipement Item",
            "Entre la quantite s'il vous plait", () {});
      } else {
        EquipmentItem newEquipmentItem = EquipmentItem(
          id: 1, // Generate ID here
          EquipementCategoryID: widget.equipmentCategory.id!,
          name: nameController.text,
          description: descriptionController.text,
          quantity: int.parse(quantityController.text),
        );

        // Fetch the EquipmentItemBloc

        // Add the new EquipmentItem to the EquipmentItemBloc
        equipmentItemBloc.add(AddEquipmentItem(Item: newEquipmentItem));
        equipmentCategoriesBloc.add(AddItemEquipmentCategories(
            Item: newEquipmentItem,
            EquipmentCategory: widget.equipmentCategory));
        // Clear the fields
        AlertBox.awesomeAlertBox(context, "Equipement Item",
            "Equipement cree avec sucess!!!", () {});
        emptyField();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EquipmentItemBloc>(
      create: (context) => EquipmentItemBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Equipment Item"),
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
                      AppColors.primaryblue,
                      null,
                      () => saveEquipmentItem(context),
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
