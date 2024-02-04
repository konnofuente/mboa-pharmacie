import 'dart:io';
import '../../../models/Role.dart';
import 'package:flutter/material.dart';
import '../../../Theme/app_theme.dart';
import 'package:provider/provider.dart';
import '../../../Theme/text_theme.dart';
import '../../../bloc/bloc_export.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget_icon.dart';
import '../../../widget/widget_button.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widget/widget_textformfield.dart';
import '../../../services/internet_connection.dart';
import '../../../services/localisationService/t_key.dart';
import 'package:mboa_pharmacie/models/DrugCategories.dart';
import 'package:mboa_pharmacie/widget/widget_alertbox.dart';
import '../../../widget/imagePicker/image_oval_picker.dart';
import 'package:mboa_pharmacie/bloc/DrugCategoriesBloc/drug_categories_event.dart';

class MedicalPrescription extends StatefulWidget {
  const MedicalPrescription({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MedicalPrescriptionState createState() => _MedicalPrescriptionState();
}

class _MedicalPrescriptionState extends State<MedicalPrescription> {
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

  void SaveDrugCategory(BuildContext context) {
    if (nameController.text.isNotEmpty &&
        directorsController.text.isNotEmpty 
        // && bannerUrl!.isNotEmpty &&
        // imageUrl!.isNotEmpty
        
        ) {
      // DrugCategories newDrugCategory = DrugCategories(
      //   id: 1, // Generate ID here
      //   name: nameController.text,
      //   items: [],
      //   releaseDateDesc: releaseDateController.text,
      //   directors: directorsController.text,
      //   desc: descController.text,
      //   imageUrl: imageUrl,
      //   bannerUrl: bannerUrl,
      // );

      // print(newDrugCategory);
      // DrugCategoriesBloc equipmentCategoriesBloc =
      //     BlocProvider.of<DrugCategoriesBloc>(context);

      // equipmentCategoriesBloc
      //     .add(AddDrugCategories(DrugCategory: newDrugCategory));

      AlertBox.awesomeOkBox(
          context,
          "Drug",
          "La Categorie ${nameController.text} a ete cree avec success!!!",
          () {});

      emptyField();
    } else {
      AlertBox.awesomeAlertBox(
          context,
          "Drug",
          "Assure vous que vous avec entre tous les information dans  champ d'information",
          () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Role? role = Provider.of<AppStatus>(context).role;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Drug Category"),
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
                  "Description",
                  descController,
                  TextInputType.multiline,
                  "Enter description",
                  WidgetIcon.description(false)
                  ),
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
                  labelText: "Date",
                  hintText: "Pick a Date",
                ),
              ),
              // Image upload placeholders
              SizedBox(
                height: 15,
              ),

              ImageOvalPickerWidget(
                label: "Attache an Image",
                onImagePicked: (image) {
                  // Do something with the picked image, like updating the Drug variable
                  imageUrl = image.path;
                },
              ),
              SizedBox(
                height: 15,
              ),

              // ImageOvalPickerWidget(
              //   label: "télécharger la photo banner ",
              //   onImagePicked: (image) {
              //     bannerUrl = image.path;
              //     // Do something with the picked image, like updating the Drug variable
              //   },
              // ),
              SizedBox(
                height: 15,
              ),

              WidgetButton.largeButton('Envoyer lordonnace',
                  AppTextTheme.buttonwhite, AppColors.primary, null, () async {
                SaveDrugCategory(context);
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
          "Upload Drug Image",
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
