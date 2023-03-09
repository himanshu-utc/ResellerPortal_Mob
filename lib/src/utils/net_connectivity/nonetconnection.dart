import 'package:flutter/material.dart';

import '../../resources/strings.dart';


class NoNetConnection extends StatelessWidget {
  const NoNetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              StringHelper.no_Internet_Connection,
            ),
            SizedBox(height: 4.0),
            Text(
              StringHelper.please_try_to_connect_with_internet,
            )
          ],
        ),
      ),
    );
  }
}
