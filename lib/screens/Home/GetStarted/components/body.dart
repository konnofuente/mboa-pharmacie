import 'package:mboa_pharmacie/screens/Home/home.dart';
import 'package:mboa_pharmacie/utils/utils_export.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/theme_export.dart';
import '../../../../services/localisationService/t_key.dart';
import '../../../../widget/widget_export.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/hospital.png',
              height: 200,
            ),
            SizedBox(
              height: 60.0,
            ),
            Text(
              "${TKeys.hey.translate(context)} ${TKeys.welcome.translate(context)}",
              style: AppTextTheme.header,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(
                  TKeys.welcome_text.translate(context),
                  textAlign: TextAlign.center,
                  style: AppTextTheme.caption,
                )),
              ],
            ),
            SizedBox(
              height: 90.0,
            ),
            WidgetButton.largeButton(TKeys.get_srt.translate(context),
                AppTextTheme.buttonwhite, AppColors.primaryblue, null, () {
              NavigationScreen.replaceNavigate(context, Home());
            })
          ],
        ),
      ),
    );
  }
}
