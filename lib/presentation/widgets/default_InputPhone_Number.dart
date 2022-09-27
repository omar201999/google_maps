import 'package:flutter/material.dart';
import 'package:flutter_maps/constnats/my_colors.dart';
import 'package:flutter_maps/constnats/strings.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class DefaultInputPhoneNumber extends StatelessWidget {
   PhoneNumber? number;
 // final TextEditingController? controller;

  DefaultInputPhoneNumber({
    required this.number,
    //required this.controller,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
        //color:MyColors.blue,
        border: Border.all(color: MyColors.lightGrey),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            phoneNumber=number.phoneNumber;
            debugPrint(phoneNumber);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          initialValue: number,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter yout phone number!';
            }
            else if (value.length < 11) {
              return 'Too short for a phone number!';
            }
            return null;
          },
          selectorTextStyle: const TextStyle(
              color: MyColors.black,
            fontSize: 18,
            letterSpacing: 2.0,
          ),
          textStyle: const TextStyle(
              color: MyColors.black,
            fontSize: 18,
            letterSpacing: 2.0,
          ),
          cursorColor: MyColors.black,
          onSaved: (value)
          {
            phoneNumber = value.phoneNumber;
          },
          //textFieldController: controller,
          autoFocus: true,
          inputDecoration: const InputDecoration(
            //contentPadding: EdgeInsetsDirectional.only(bottom: 15,start: 0),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }


}
