import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkar/images.dart';
import 'package:flutkar/theme/app_theme.dart';

import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late RegisterController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = FxControllerStore.putOrFind(RegisterController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: controller,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.fromLTRB(
                  20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.displaySmall(
                    'Sign up',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(20),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
                              prefixIcon: Icon(
                                FeatherIcons.user,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Name",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.nameTE,
                          validator: controller.validateName,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                        FxSpacing.height(20),
                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
                              prefixIcon: Icon(
                                FeatherIcons.mail,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Email Address",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.emailTE,
                          validator: controller.validateEmail,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                        FxSpacing.height(20),
                        TextFormField(
                          style: FxTextStyle.bodyMedium(),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              isDense: true,
                              fillColor: customTheme.card,
                              prefixIcon: Icon(
                                FeatherIcons.lock,
                                color: theme.colorScheme.onBackground,
                              ),
                              hintText: "Password",
                              enabledBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              border: outlineInputBorder,
                              contentPadding: FxSpacing.all(16),
                              hintStyle: FxTextStyle.bodyMedium(),
                              isCollapsed: true),
                          maxLines: 1,
                          controller: controller.passwordTE,
                          validator: controller.validatePassword,
                          cursorColor: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(24),
                  Row(
                    children: [
                      FxText.bodySmall(
                        'By Signing up, you\'re agree to our ',
                        fontSize: 11,
                      ),
                      FxText.bodySmall(
                        'Terms & Conditions',
                        color: customTheme.fitnessPrimary,
                        fontSize: 11,
                      ),
                    ],
                  ),
                  FxSpacing.height(24),
                  Row(
                    children: [
                      FxButton(
                          padding: FxSpacing.xy(16, 12),
                          onPressed: () {
                            controller.register();
                          },
                          backgroundColor: customTheme.card,
                          splashColor:
                              theme.colorScheme.onBackground.withAlpha(40),
                          elevation: 0,
                          borderRadiusAll: 4,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(Images.google),
                                height: 17,
                                width: 17,
                              ),
                              FxSpacing.width(20),
                              FxText.labelMedium(
                                'Login with Google',
                                fontWeight: 600,
                                color: theme.colorScheme.onBackground,
                              ),
                            ],
                          )),
                      FxSpacing.width(20),
                      Expanded(
                        child: FxButton(
                          padding: FxSpacing.y(12),
                          onPressed: () {
                            controller.register();
                          },
                          backgroundColor: customTheme.fitnessPrimary,
                          elevation: 0,
                          borderRadiusAll: 4,
                          child: FxText.bodyMedium(
                            'Continue',
                            color: customTheme.fitnessOnPrimary,
                            fontWeight: 600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FxSpacing.height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FxText.bodySmall(
                        'Joined us before? ',
                      ),
                      InkWell(
                          onTap: () {
                            controller.goToLogInScreen();
                          },
                          child: FxText.bodySmall(
                            'LogIn',
                            color: customTheme.fitnessPrimary,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
