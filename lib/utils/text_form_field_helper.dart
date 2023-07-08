import 'package:flutter/material.dart';
import 'package:untitled/utils/extension_helper.dart';

class TextFormFieldHelper {
  static stylePrimary({
    required BuildContext context,
    required String label,
    required String hintText,
    bool usernameValidator = false,
    bool leading = false,
    bool multiLine = false,
    bool obscureText = false,
    bool readOnly = false,
    bool validator = true,
    bool emailValidator = false,
    bool optional = false,
    Color colorLabel = Colors.black,
    TextInputType keyboardType = TextInputType.text,
    Widget? leadingWidget,
    required TextEditingController textController,
  }) {
    final ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 10, bottom: 10, right: 10, top: 13),
          margin: const EdgeInsets.only(bottom: 10, top: 15),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500),
              color: themeData.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              (leading) ? leadingWidget! : Container(),
              Expanded(
                  child: TextFormField(
                maxLines: (multiLine) ? 5 : 1,
                minLines: 1,
                obscureText: obscureText,
                readOnly: readOnly,
                validator: (value) {
                  if (!validator) {
                    return null;
                  }
                  if (value == null || value.isEmpty) {
                    return '$hintText Tidak boleh kosong';
                  }
                  if (usernameValidator) {
                    if (!value.isValidUsername()) {
                      return '$hintText Tidak Valid';
                    }
                  }
                  return null;
                },
                controller: textController,
                keyboardType: keyboardType,
                onChanged: (value) {},
                style: const TextStyle(fontSize: 12),
                autofocus: false,
                autocorrect: false,
                decoration: InputDecoration.collapsed(
                    hintStyle:
                        TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    hintText: hintText),
              ))
            ],
          ),
        ),
        Container(
          color: themeData.scaffoldBackgroundColor,
          padding:
              const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 3),
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                    color: colorLabel,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              (optional)
                  ? const Text(
                      " (Optional)",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
