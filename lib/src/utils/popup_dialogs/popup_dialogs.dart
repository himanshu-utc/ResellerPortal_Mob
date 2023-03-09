import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/strings.dart';
import '../common_widgets/common_widget.dart';


class PopupDialogs {
  static displayMessage(BuildContext context, String message) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 200,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  textHelper(
                    title: StringHelper.alert,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: ColorsHelper.blueColor(),
                    //primaryColor
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      //Cancel
                      Expanded(
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey[500],
                                //offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ],
                            border: Border.all(
                                width: 2, color: ColorsHelper.blueColor()),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: ColorsHelper.whiteColor(),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(30.0),
                                onTap: () {
                                  Navigator.maybePop(context);
                                },
                                child: Center(
                                  child: Text(StringHelper.cancel,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsHelper.blueColor(),
                                      )),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      //Retry
                      Expanded(
                          child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: ColorsHelper.blueColor(),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey[500],
                                blurRadius: 1.5,
                              ),
                            ]),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          color: ColorsHelper.blueColor(),
                          child: InkWell(
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: () {
                                Navigator.maybePop(context);
                              },
                              child: Center(
                                child: Text(StringHelper.ok,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ColorsHelper.whiteColor(),
                                    )),
                              )),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  static displayOnlyMessage(BuildContext context, String message) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            content: Container(
              height: 200,
              width: double.infinity,
              color: ColorsHelper.whiteColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  textHelper(
                    title: StringHelper.alert,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: ColorsHelper.blueColor(),
                    //primaryColor
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      //OK
                      Expanded(
                          child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: ColorsHelper.blueColor(),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey[500],
                                blurRadius: 1.5,
                              ),
                            ]),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          color: ColorsHelper.blueColor(),
                          child: InkWell(
                              borderRadius: BorderRadius.circular(30.0),
                              onTap: () {
                                Navigator.maybePop(context);
                              },
                              child: Center(
                                child: Text(StringHelper.ok,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ColorsHelper.whiteColor(),
                                    )),
                              )),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  // static displayAppUpdate(BuildContext context, String message) {
  //   return showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return WillPopScope(
  //           onWillPop: () => null,
  //           child: AlertDialog(
  //             contentPadding: EdgeInsets.all(10),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(22.0)),
  //             content: Container(
  //               height: 200,
  //               width: double.infinity,
  //               color: ColorsHelper.whiteColor(),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Text(StringHelper.alert,
  //                       style: TextStyle(
  //                           fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic,
  //                           fontSize: 20),
  //                       textAlign: TextAlign.center),
  //                   SizedBox(
  //                     height: 5,
  //                   ),
  //                   Text(
  //                     message,
  //                     style: TextStyle(fontSize: 13),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   submitButton(
  //                       title: StringHelper.update,
  //                       onPressed: () async {
  //                         // if (await canLaunch(StringHelper.playStoreUrl)) {
  //                         //   await launch(StringHelper.playStoreUrl);
  //                         // } else {
  //                         //   throw 'Could not launch ${StringHelper.playStoreUrl}';
  //                         // }
  //                       })
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
