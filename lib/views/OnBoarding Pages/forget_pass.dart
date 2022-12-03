import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/Services/auth.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/utils.dart';
import 'package:flutterdemo/views/Widgets/buttons.dart';
import 'package:flutterdemo/views/Widgets/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

   void _sendEmail() async {
      var response = await _auth.resetPassword(_emailController.text.trim());
      if (response is String) {
        print(response);
        // Show error message
        dialogs.errorToast(
            error: TextFormatter.firebaseError(response.toString()));
      } else {
        // Navigate to Home Page
        Navigator.pop(context);
      }
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => changepsw()));
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Forgot your password? No worries. Just fill in your email and we\'ll send you a link to reset your password.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 59, 59, 61),
                  fontSize: screenHeight * 0.025,
                ),
              ),
              mainBody(
                  screenHeight: screenHeight,
                  emailController: _emailController),
             Buttons(ButtonName: "Send", functionToComply: _sendEmail)
            ],
          ),
        ),
      ),
    );
  }
}

class mainBody extends StatelessWidget {
  const mainBody({
    Key? key,
    required this.screenHeight,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final double screenHeight;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Email TextField
        const TextFieldLabel(text: "Email"),
        emailInput()
      ],
    );
  }

  Widget emailInput() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: "user.name@mail.com",
        fillColor: MyColors.textFieldColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.textColor, width: 1.5),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
