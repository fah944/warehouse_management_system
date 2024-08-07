import 'package:flutter/material.dart';
import 'package:project2/core/utils/color_manager.dart';

import '../../../core/utils/app_manager.dart';

elevatedbtn({
  Color? color,
  required String text,
  
  double? radius, 
  required TextStyle style,
  Function()? onPressed,
  Widget? icon})=>ElevatedButton.icon(
      label: Text(
      text,
      style: style,
     ),

     icon: icon,
      
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: AppPadding.p18, 
            horizontal: AppPadding.p18)),
        
      elevation: WidgetStateProperty.all<double>(0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
           RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius ?? AppSize.s18),
      side:  BorderSide(color: color?? ColorManager.orange)
    )
  ),
      backgroundColor:  WidgetStatePropertyAll(color?? ColorManager.primaryColor),
      ) ,
      onPressed: onPressed,
    
     );



     /*  elevatedbtn(
                        icon: circleIconWidget(icon: Icons.add,
                            backgroundColor: ColorManager.orange, color: ColorManager.bc0),
                        text: 'Add New Type',
                        style: StyleManager.labelMedium(color: ColorManager.bc4),
                        onPressed: ()
                        {
                           openDialog();
                          //الربط هنا
                        },
                                
                      ),*/