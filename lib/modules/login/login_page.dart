import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/login/login_controller.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_images.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/social_login_button/social_login_button.dart';
//import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: size.width * 0.5,
                height: size.height * 0.5,
              ),
            ),
            Positioned(
              bottom: size.height * 0.08,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 40, 50, 20),
                    child: Text(
                      'Organize your bills in one place',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                    child: SocialLoginButton(
                      onTap: () async {
                        GoogleSignIn _googleSignIn = GoogleSignIn(
                          scopes: [
                            'email',
                            'https://www.googleapis.com/auth/contacts.readonly',
                          ],
                        );
                        try {
                          final response = await _googleSignIn.signIn();
                          print(response);
                        } catch (error) {
                          print(error);
                        }
                      },
                      // => controller.googleSignIn(context),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
