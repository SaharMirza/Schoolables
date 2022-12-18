import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/Services/auth.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/utils.dart';

import '../main_pages/Widgets/Bottom_Nav_bar.dart';
import '../main_pages/Widgets/buttons.dart';
import '../main_pages/Widgets/textfield.dart';
import '../main_pages/profile_pages/children_profile_screen.dart';
import 'forget_pass.dart';
import 'register_screen.dart';


class ContinueWithEmail extends StatefulWidget {
  const ContinueWithEmail({Key? key, required this.role}) : super(key: key);
  final String role;

  @override
  State<ContinueWithEmail> createState() => _ContinueWithEmailState();
}

class _ContinueWithEmailState extends State<ContinueWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    void signin() async {
      // Signin with Email and Password
      dynamic result = await auth.signInWithEmailAndPassword(
          _emailController.text.trim(), _passwordController.text.trim());
      // Check if result is of type UserProfile
      if (result!=null && result is UserAuth) {
        if (widget.role == "Parent") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChildernProfileScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          );
        }
      } else {
        // Show error message
        dialogs.errorToast(
            error: TextFormatter.firebaseError(result.toString()));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Login",
                  style: MyStyles.googleTitleText(
                      MediaQuery.of(context).size.width * 0.07),
                ),
                loginInputs(),
                Buttons(
                  ButtonName: "Login",
                  role: widget.role,
                  functionToComply: signin,
                ),
                signUpRedirect(widget.role),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpRedirect(String role) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Don't have an account? "),
          InkWell(
              child: const Text(
                "Signup",
                style: TextStyle(
                  color: MyColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignupPage(
                              role: role,
                            )));
              })
        ]);
  }

  Widget forgetPassword() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      InkWell(
          child: const Text(
            "Forget Password?",
            style: TextStyle(
                color: MyColors.textColor,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ForgetPass()));
          })
    ]);
  }

  Widget loginInputs() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SchoolablesTextField(
              FieldLabel: "Email Address",
              hintText: "user.name@mail.com",
              control: _emailController,
              textType: TextInputType.emailAddress),
          SchoolablesTextField(
            FieldLabel: "Password",
            hintText: "Password",
            control: _passwordController,
            pswd: true,
          ),
          forgetPassword()
        ],
      ),
    );
  }
}
