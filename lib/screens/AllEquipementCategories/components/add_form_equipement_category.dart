import 'dart:io';

import 'package:mboa_pharmacie/bloc/EquipementCategoriesBloc/equipement_categories_event.dart';
import 'package:mboa_pharmacie/models/EquipementCategories.dart';
import 'package:mboa_pharmacie/widget/widget_alertbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Theme/app_theme.dart';
import '../../../Theme/text_theme.dart';
import '../../../bloc/bloc_export.dart';
import '../../../models/Role.dart';
import '../../../services/internet_connection.dart';
import '../../../services/localisationService/t_key.dart';
import '../../../provider/provider.dart';
import '../../../widget/imagePicker/image_oval_picker.dart';
import '../../../widget/widget_button.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_textformfield.dart';
import 'package:image_picker/image_picker.dart';

class AddFormEquipementCategory extends StatefulWidget {
  const AddFormEquipementCategory({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddFormEquipementCategoryState createState() =>
      _AddFormEquipementCategoryState();
}

class _AddFormEquipementCategoryState extends State<AddFormEquipementCategory> {
  final _formKey = GlobalKey<FormState>();
  late bool alert;
  TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController releaseDateController = TextEditingController();
  final TextEditingController directorsController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  // Placeholder for image upload
  String? imageUrl;
  String? bannerUrl;
  String? trailerImg1;
  String? secondImg;
  TextInputType emailKeytype = TextInputType.emailAddress;
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  File? _image;

  @override
  void initState() {
    checkconnection();
    super.initState();
  }

  void checkconnection() async {
    await InternetConnection().CheckInternetConnectivity(context);
  }

  // Function to pick an image from gallery
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // For demonstration, we're setting the imageUrl to the picked image path
      // You can upload the image to your server and set the URL here
      imageUrl = pickedFile.path;
    }
  }

  void emptyField() {
    nameController.clear();
    releaseDateController.clear();
    directorsController.clear();
    descController.clear();
    imageUrl = null;
    bannerUrl = null;
    trailerImg1 = null;
    secondImg = null;
  }

  void SaveEquipementCategory(BuildContext context) {
    if (nameController.text.isNotEmpty &&
        directorsController.text.isNotEmpty &&
        bannerUrl!.isNotEmpty &&
        imageUrl!.isNotEmpty) {
      EquipmentCategories newEquipmentCategory = EquipmentCategories(
        id: 1, // Generate ID here
        name: nameController.text,
        items: [],
        releaseDateDesc: releaseDateController.text,
        directors: directorsController.text,
        desc: descController.text,
        imageUrl: imageUrl,
        bannerUrl: bannerUrl,
      );

      print(newEquipmentCategory);
      EquipmentCategoriesBloc equipmentCategoriesBloc =
          BlocProvider.of<EquipmentCategoriesBloc>(context);

      equipmentCategoriesBloc
          .add(AddEquipmentCategories(EquipmentCategory: newEquipmentCategory));

      AlertBox.awesomeOkBox(
          context,
          "Equipement",
          "La Categorie ${nameController.text} a ete cree avec success!!!",
          () {});

      emptyField();
    } else {
      AlertBox.awesomeAlertBox(
          context,
          "Equipement",
          "Assure vous que vous avec entre tous les information dans  champ d'information",
          () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Role? role = Provider.of<AppStatus>(context).role;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Equipment Category"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              WidgetTextForm.getTextField(
                  "Name",
                  nameController,
                  TextInputType.text,
                  "Enter name",
                  WidgetIcon.userAccount(false)),
              SizedBox(
                height: 15,
              ),
              WidgetTextForm.getTextField(
                  "Responsable",
                  directorsController,
                  TextInputType.text,
                  "Enter directors",
                  WidgetIcon.userAccount(false)),
              SizedBox(
                height: 15,
              ),
              WidgetTextForm.getTextField(
                  "Description",
                  descController,
                  TextInputType.text,
                  "Enter description",
                  WidgetIcon.description(false)),
              SizedBox(
                height: 15,
              ),
              // Date Picker
              TextFormField(
                controller: releaseDateController,
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null && pickedDate != DateTime.now())
                    releaseDateController.text =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                },
                decoration: InputDecoration(
                  labelText: "Release Date",
                  hintText: "Pick a Date",
                ),
              ),
              // Image upload placeholders
              SizedBox(
                height: 15,
              ),

              ImageOvalPickerWidget(
                label: "télécharger le logo d'equipement",
                onImagePicked: (image) {
                  // Do something with the picked image, like updating the Equipment variable
                  imageUrl = image.path;
                },
              ),
              SizedBox(
                height: 15,
              ),

              ImageOvalPickerWidget(
                label: "télécharger la photo banner ",
                onImagePicked: (image) {
                  bannerUrl = image.path;
                  // Do something with the picked image, like updating the Equipment variable
                },
              ),
              SizedBox(
                height: 15,
              ),

              WidgetButton.largeButton(
                  TKeys.create_cat.translate(context),
                  AppTextTheme.buttonwhite,
                  AppColors.primaryblue,
                  null, () async {
                SaveEquipementCategory(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Column OvalImagePicker() {
    return Column(
      children: [
        Text(
          "Upload Equipment Image",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            _image == null
                ? Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.image, size: 40, color: Colors.grey[800]),
                  )
                : ClipOval(
                    child: Image.file(
                      _image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
            Positioned(
              right: 5,
              bottom: 5,
              child: InkWell(
                onTap: _pickImage,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
