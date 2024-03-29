// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constantes/controllers.dart';
import '../constantes/style.dart';
import 'custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("Not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName)
              ? lightGrey.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                child: Container(
                  width: 3,
                  height: 72,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      color: menuController.isHovering(itemName)
                          ? dark
                          : lightGrey,
                      size: 20,
                      weight: FontWeight.bold,
                    ))
                  else
                    Flexible(
                        child: CustomText(
                      text: itemName,
                      color: dark,
                      size: 20,
                      weight: FontWeight.bold,
                    ))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
