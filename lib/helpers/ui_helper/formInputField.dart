import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';

class FormInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final IconData icon;
  final bool? isReadOnly, isObscure, enable;
  final int? maxInputLength;

  const FormInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.inputType,
      required this.icon,
      this.isReadOnly,
      this.isObscure,
      this.enable,
      this.maxInputLength})
      : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFFFDCC31),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          enabled: widget.enable,
          readOnly: widget.isReadOnly ?? false,
          obscureText: widget.isObscure ?? false,
          controller: widget.controller,
          keyboardType: widget.inputType,
          inputFormatters: widget.maxInputLength != null
              ? [
                  LengthLimitingTextInputFormatter(widget.maxInputLength),
                ]
              : [],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(widget.icon),
            labelText: widget.hintText,
            border: const OutlineInputBorder(),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Field can\'t be empty';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}

class FormInputDate extends StatefulWidget {
  TextEditingController textc;
  final String hintText;
  final IconData icon;
  DateTime? selectedDate;
  final String? initialValue, label, setDate;
  final bool isReadOnly, isObscure, isVisible;
  bool? nullable, enable;
  final bool? isFilled;
  final Color? filledColor;

  FormInputDate(
      {Key? key,
      required this.textc,
      required this.hintText,
      required this.icon,
      required this.isObscure,
      this.initialValue,
      this.nullable,
      this.isFilled,
      this.filledColor,
      required this.isReadOnly,
      this.setDate,
      this.selectedDate,
      this.enable,
      required this.isVisible,
      this.label})
      : super(key: key);

  @override
  State<FormInputDate> createState() => _FormInputDateState();
}

class _FormInputDateState extends State<FormInputDate> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.selectedDate ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1966),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        widget.selectedDate = picked;
        widget.textc.text = DateFormat('dd-MM-yyyy')
            .format(widget.selectedDate ?? DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 20.0, left: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.textc,
              keyboardType: TextInputType.number,
              readOnly: widget.isReadOnly,
              decoration: InputDecoration(
                labelText: widget.hintText,
                fillColor: Colors.grey,
                suffixStyle: TextStyling.normal15grey,
                prefixIcon: Icon(widget.icon),
                hintText: 'yyyy-mm-dd',
                border: const OutlineInputBorder(),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              autocorrect: false,
              obscureText: widget.isObscure,
              cursorColor: Colors.black,
              onChanged: (value) {
                setState(() {});
              },
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FormInputLongText extends StatefulWidget {
  TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool? enable, readOnly;

  FormInputLongText(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.enable,
      this.readOnly,
      required this.icon})
      : super(key: key);

  @override
  State<FormInputLongText> createState() => _FormInputLongTextState();
}

class _FormInputLongTextState extends State<FormInputLongText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(right: 20.0, left: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              enabled: widget.enable,
              expands: true,
              readOnly: widget.readOnly ?? false,
              decoration: InputDecoration(
                labelText: widget.hintText,
                fillColor: Colors.grey,
                prefixIcon: Icon(widget.icon),
                suffixStyle: TextStyling.normal15grey,
                border: const OutlineInputBorder(),
                hintText: widget.hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
