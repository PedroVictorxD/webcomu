import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String Label) {
  return InputDecoration(
      hintText: Label,
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(64)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide: const BorderSide(color: Colors.red, width: 4),
      ),
      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8));
}
