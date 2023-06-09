
import 'package:flutterdemo/views/main_pages/Widgets/textfield.dart';

import '../../imports.dart';
import '../../text_validator.dart';

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
        if (widget.role == "Student") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TellUsMore()));
        } else {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const TellUsMoreParent()));
        }
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
      body: SingleChildScrollView(
        child: Center(
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
      ),
    );
  }

  Widget registerInputs() {
    String _validate(String value) {
    if (_emailController.text.startsWith(RegExp(r'[a-zA-Z]'))) {
      return TextValidator.email(value);
    }  else {
      return '';
    }
  }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           SchoolablesTextField(
            // FieldLabel: "Email Address",
            // hintText: "user.name@mail.com",
            // control: _emailController,
            textType: TextInputType.emailAddress, 
            controller: _emailController,
            label: 'Email Address',
            validatorFunction: _validate,
            
          ),
          SchoolablesTextField(
            label: "Password",
            // extType: TextInputType., 
            
            // hintText: "Password",
            controller: _passwordController,
            password: true,
          ),
          // SchoolablesTextField(
          //     label: "Email Address",
          //     hintText: "user.name@mail.com",
          //     control: _emailController,
          //     textType: TextInputType.emailAddress),
          // SchoolablesTextField(
          //   FieldLabel: "Password",
          //   hintText: "Password",
          //   control: _passwordController,
          //   pswd: true,
          // ),
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
