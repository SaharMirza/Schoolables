import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/Entities/user_auth_entity.dart';
import 'package:flutterdemo/Services/auth.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:flutterdemo/provider/student_provider.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/OnBoarding%20Pages/tell_us_more.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key, required this.role}) : super(key: key);
  final String role;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final userProfile = context.watch<UserProvider>().userProfile;
 
    void Register() async {
      // Signup Using Email and Password
      dynamic result = await _auth.registerWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      // Check if result is of type UserProfile
      if (result is UserAuth) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TellUsMore()));
      } else {
        // Show error
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Register",
                style: MyStyles.googleTitleText(
                    MediaQuery.of(context).size.width * 0.07),
              ),
              registerInputs(),
              Buttons(
                ButtonName: "Register",
                role: widget.role,
                functionToComply: Register,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerInputs() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
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
          // SchoolablesTextField(
          //     FieldLabel: "Confirm Password",
          //     hintText: "Password",
          //     pswd: true,
          //     control: _confirmpasswordController)
        ],
      ),
    );
  }
}
