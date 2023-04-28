import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget BuildTextFormField(
  String labelText, TextEditingController controller, TextInputType input,String hintText, String? Function(String?) validator,IconData? icon,
 
  )  {
   
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        labelText,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey[700],
        ),
      ),
      SizedBox(height: 10.0),
      TextFormField(
        controller: controller,
        keyboardType: input,
        obscureText: labelText == 'كلمة المرور' ? true : false,
        decoration: InputDecoration(
         prefixIcon:Icon(icon,color: Colors.grey,) ,
           hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
           focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        validator: validator,
      ),
      SizedBox(height: 20.0),
    ],
  );
}