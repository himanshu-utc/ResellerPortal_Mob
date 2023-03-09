import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerNew {
  DateTime date = DateTime(1987, 11, 24);
  DateTime tempDate = DateTime(2017, 12, 25);

  Widget _buildBottomPicker(
      BuildContext context, Widget picker, VoidCallback doneFunc) {
    return Container(
      height: 210,
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            color: CupertinoColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /*RaisedButton(
                  color: CupertinoColors.white,
                  onPressed: () {
                    date = tempDate;
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                RaisedButton(
                  color: CupertinoColors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    tempDate = date;
                    doneFunc();
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),*/
              ],
            ),
          ),
          Container(
            height: 180,
            padding: const EdgeInsets.only(top: 6.0),
            color: CupertinoColors.white,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 22.0,
              ),
              child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: SafeArea(
                  top: false,
                  child: picker,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> pickDate(BuildContext context,
      {DateTime? initDate, int? minYear, int? maxYear, VoidCallback? doneFunc}) {
    tempDate = initDate!;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomPicker(
            context,
            CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: initDate,
              maximumYear: maxYear,
              //minimumYear: minYear,
              onDateTimeChanged: (DateTime newDateTime) {
                date = newDateTime;
              },
            ),
            doneFunc!);
      },
    );
    return Future.value(true);
  }
}
