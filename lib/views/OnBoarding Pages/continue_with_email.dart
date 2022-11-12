import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/forget_pass.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/main_login_screen.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/register_screen.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';

class ContinueWithEmail extends StatefulWidget {
  const ContinueWithEmail({super.key});

  @override
  State<ContinueWithEmail> createState() => _ContinueWithEmailState();
}

class _ContinueWithEmailState extends State<ContinueWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login",
                style: MyStyles.googleTitleText(MediaQuery.of(context).size.width * 0.07),
              ),
              loginInputs(),
              const Buttons(ButtonName: "Login"),
              signUpRedirect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpRedirect() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("Don't have an account? "),
          InkWell(
              child: Text(
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
                        builder: (context) => const SignupPage()));
              })
        ]);
  }

  Widget forgetPassword() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      InkWell(
          child: Text(
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
