import 'localization_service.dart';
// ignore_for_file: constant_identifier_names

enum TKeys {
  // ignore: constant_identifier_names
  chose_lang,
  en,
  fr,
  splash_text_1,
  splash_title_1,
  splash_text_2,
  splash_title_2,
  splash_text_3,
  splash_title_3,
  skip,
  done,

  admin,
  patients,
  teacher,
  student,
  sign_in,
  welcome,
  name,
  pwd,
  f_pwd,
  did_not_have_acct,
  sign_up,
  creat_acct,
  f_name,
  s_name,
  p_num,
  email,
  next,
  enter,
  confirm,
  save,
  already_h_acct,
  auth_user_info,
  code,
  code_verif,
  code_verif_subtitle,
  req_code,
  not_recieve_code,
  hey,
  get_srt,
  welcome_text,
  equipment_categories,
  app_tip,
  home,
  group,
  download,
  quiz,
  doc,
  stat,
  facilities,
  more,
  setting,
  logout,
  contact,
  request_acct,
  changeLanguage,
  category,
  add_category,
  create_cat,
  project,
  ordonance,
  screen,

  settingTitle,
  userName,
  userProfilePic,
  editProfileTitle,
  editProfileSubtitle,
  privacyTitle,
  privacySubtitle,
  darkModeTitle,
  darkModeSubtitle,
  aboutTitle,
  aboutSubtitle,
  accountTitle,
  signOutTitle,
  changeEmailTitle,
  deleteAccountTitle,
  changeProfilePic,


 addDrugCategory,
 enterName,
 description,
 enterDescription,
 date,
 pickADate,
 symtomsPickADate,
 attachAnImage,
 sendPrescription,

 ordonnanceSuccess,
 emptyFieldAlert
}

//TKeys.hello
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
