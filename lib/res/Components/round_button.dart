import 'package:flutter/material.dart';
import 'package:mvvm_architexture/res/Components/colors.dart';
class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({Key? key, required this.title, required this.onPress, this.loading= false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child:loading? CircularProgressIndicator(color: Colors.white,) : Text(title, style: TextStyle( color: AppColors.whiteColor),)),
      ),
    );
  }
}
