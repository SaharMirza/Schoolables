import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/constants/fonts.dart';

class SchoolablesTextField extends StatefulWidget {
  const SchoolablesTextField({
    super.key,
    required this.FieldLabel,
    this.pswd = false,
    required this.hintText,
    this.textType = TextInputType.text,
    required this.control,
  });
  final String FieldLabel;
  final String hintText;
  final TextInputType textType;

  final TextEditingController control;
  final bool pswd;
  @override
  State<SchoolablesTextField> createState() => _SchoolablesTextFieldState();
}

class _SchoolablesTextFieldState extends State<SchoolablesTextField> {
  late bool _obscured;
  late IconData _suffixIcon;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // Set Initial Value
    _obscured = widget.pswd;
    _suffixIcon = Icons.visibility_off;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(text: widget.FieldLabel),
        TextFormField(
          controller: widget.control,
          obscureText: _obscured,
          keyboardType: widget.textType,
          decoration: InputDecoration(
            hintText: widget.hintText,
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
            // If its a password field, show a suffix icon
            suffixIcon: !widget.pswd
                ? null
                : IconButton(
                    icon: Icon(_suffixIcon),
                    onPressed: () {
                      // Toggle the suffix icon
                      _obscured = !_obscured;
                      setState(() {
                        _obscured
                            ? _suffixIcon = Icons.visibility_off
                            : _suffixIcon = Icons.visibility;
                      });
                    }),
          ),
        ),
      ],
    );
  }
}

// Text Field Label
class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: MyStyles.googleTextFieldLabelStyle);
  }
}
