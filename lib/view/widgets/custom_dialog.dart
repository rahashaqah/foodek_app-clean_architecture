import 'package:flutter/material.dart';

import 'bottom_widget.dart';

void showRemoveFromFavDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Text(
                "Are you sure you want to remove it from \nfavorites?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6C7278),
                ),
              ),
              SizedBox(height: 24),
              ButtonWidget(dataName: "Yes", onTap: () {}, colors: Colors.white),
            ],
          ),
        ),
      );
    },
  );
}
