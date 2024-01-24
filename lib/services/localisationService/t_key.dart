// ignore_for_file: constant_identifier_names

import 'localization_service.dart';

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
  already_h_acct,
  auth_user_info,
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
}

//TKeys.hello
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
