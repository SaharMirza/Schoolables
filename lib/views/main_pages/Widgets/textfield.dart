import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';

class SchoolablesTextField extends StatefulWidget {
  const SchoolablesTextField({
    super.key,
    required this.controller,
    required this.label,
    // this.size = TextFieldSize.large,
    this.password = false,
    this.textType = TextInputType.text,
    this.readonly = false,
    this.length,
    this.prefixIcon,
    this.prefixText,
    this.suffixText,
    this.suffixIcon,
    this.onChangedFunction,
    this.validatorFunction,
    this.height,
    // this.formatter,
  });
  // final TextFieldSize size;
  final String label;
  final TextEditingController controller;
  final bool password;
  final TextInputType textType;
  final bool readonly;
  final int? length;
  final Icon? prefixIcon;
  final String? prefixText;
  final String? suffixText;
  final Icon? suffixIcon;
  // final TextInputFormatter? formatter;
  final void Function(String)? onChangedFunction;
  final double? height;

  final String Function(String)? validatorFunction;

  @override
  State<SchoolablesTextField> createState() => _SchoolablesTextFieldState();
}

class _SchoolablesTextFieldState extends State<SchoolablesTextField> {
  late bool _obscured;
  String errorText = '';
  bool iserror = false;
  late String Function(String) validatorFunction;
  final FocusNode focus = FocusNode();
  late double height;
  late double width;
  late int? maxLines;
  int minLines = 1;
  late IconData _suffixIcon;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // Set Initial Value
    focus.addListener(_onFocusChange);
    widget.controller.addListener(_onChangeListener);
    _obscured = widget.password;
    validatorFunction = widget.validatorFunction ?? (String text) => '';
    _suffixIcon = Icons.visibility_off;
  }

  @override
  void dispose() {
    super.dispose();
    focus.removeListener(_onFocusChange);
    focus.dispose();
    widget.controller.removeListener(_onChangeListener);
    // widget.controller.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _onChangeListener() {
    // Check the validation of the text field
    errorText = validatorFunction(widget.controller.text);
    errorText.isNotEmpty ? iserror = true : iserror = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
     Widget? suffixIcon() {
      if (widget.password && widget.controller.text.isNotEmpty) {
        return IconButton(
          icon: Icon(
            _obscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            _obscured = !_obscured;
            setState(() {});
          },
        );
      } else {
        return widget.suffixIcon;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel1(text: widget.label),
        SizedBox(
          height: 60,
          width: 300,
          child: TextField(
            focusNode: focus,
            obscureText: _obscured,
            obscuringCharacter: '*',
            controller: widget.controller,
            // inputFormatters: widget.formatter != null
            //     ? <TextInputFormatter>[widget.formatter!]
            //     : null,
            // keyboardType:
            //     maxLines == null ? TextInputType.multiline : widget.textType,
            maxLength: widget.length,
            maxLines: 1,
            minLines: 1,
            onChanged: widget.onChangedFunction,
            enabled: !widget.readonly,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              // height: 10,
              letterSpacing: 0.4,
            ),
            textAlignVertical: const TextAlignVertical(y: -1.0),
            decoration: InputDecoration(
              counterText: '',
              enabled: !widget.readonly,
              // hintText: widget.label,
              labelText: widget.label,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                height: 14,
                letterSpacing: 0.4,
              ).copyWith(
                color: iserror ? Colors.red : Colors.black,
              ),
              border: const OutlineInputBorder(),
              filled: !focus.hasFocus,
              fillColor: Color.fromARGB(255, 247, 244, 244),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:iserror ? Colors.red : Colors.black,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:iserror ? Colors.red : Colors.black,
                  width: iserror ? 1 : 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              prefixText: widget.prefixText,
              prefixStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                // height: 1,
                letterSpacing: 0.4,
              ).copyWith(
                color: Colors.black,
                // fontSize: 23.sp,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: suffixIcon(),
              suffixText: widget.suffixText,
              suffixStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                // height: 14,
                letterSpacing: 0.4,
              ).copyWith(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            iserror ? errorText : '',
            style:TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                height: 14,
                letterSpacing: 0.4,
              ).copyWith(
              color: Colors.red,
              height: 0,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

// Text Field Label
class TextFieldLabel1 extends StatelessWidget {
  const TextFieldLabel1({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: MyStyles.googleTextFieldLabelStyle);
  }
}
