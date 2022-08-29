import 'package:flutter/material.dart';

loadingWidgetWithContent({required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.001),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Please wait while we process your request.'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
