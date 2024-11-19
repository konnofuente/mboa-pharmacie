import 'package:flutter/material.dart';

import '../models/Item.dart';

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp nameValidatorRegExp = RegExp(
    r"^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$");
final RegExp telValidatorRegExp = RegExp(r"^6[0-9]{8}$");
const String kPassNullError = "Veillez entrer votre mot de passe";
const String kShortPassError = "Mot de passe trop court";
const String kMatchPassError = "Mot de passe invalide";
const String kNamelNullError = "Veuillez entrer votre nom";
const String kPhoneNumberNullError =
    "Veuillez entrer votre numéro de téléphone";
const String kAddressNullError = "Veuillez entrer votre adresse";
const String kInvalidPhone = "Numéro de téléphone invalide";
const String kInvalidName = "Ce nom existe déjà";
const String kEmptySerie = "Veuillez choisir une série";
const String kEmptyClasse = "Veuillez choisir une classe";
const String kEmptySysteme = "Veuillez choisir un système éducatif";


//Padding

const double kDefaultPadding = 20.0;

Map<String, dynamic> latex_content = {
  "title": "Example LaTeX Document",
  "content": "\\documentclass{article}\n\n\\begin{document}\n\n\\section{Introduction}\n\nThis is an example LaTeX document.\n\n\\section{Equations}\n\nHere's an equation: \$\\frac{1}{2} + \\frac{1}{3} = \\frac{5}{6} \$.\n\nAnd another one: \$\$\\int_{0}^{\\infty} x^2 e^{-x} dx = 2\$\$\n\n\\section{Conclusion}\n\nThanks for reading!\n\n\\end{document}"

};

class AppConstants {
  static const appName = "Mboa Phamacie";
  static const packageName = "com.example.mboa_pharmacie";
  static const cacheDays = 3;
  static const serverUrl = "http://localhost:8084/mboa";
}


