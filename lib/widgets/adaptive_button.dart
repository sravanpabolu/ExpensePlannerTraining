import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String btnText;
  final Function handler;

  AdaptiveFlatButton(this.btnText, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              btnText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: handler,
                          )
                        : FlatButton(
                            onPressed: handler,
                            child: Text(
                              btnText,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
  }
}