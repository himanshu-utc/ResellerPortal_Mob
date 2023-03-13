
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../buttons/button.dart';


callUnfocus({required BuildContext context}) =>
    FocusScope.of(context).requestFocus(new FocusNode());

Widget loginUserLogo() => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.transparent
           //ColorsHelper.greyColor()
          ),
       height: 200,
      padding: EdgeInsets.only(bottom: 5),
      child: assetImageHelper(
        image: ImageAssets.logintopiv,
  ),
    );

Widget textHelper(
        { String? title,
        Color textColor = Colors.black,
         double? fontSize,
        bool isItalic = false,
        FontWeight fontWeight = FontWeight.normal,
        TextAlign textAlign = TextAlign.end}) =>
    Text(
      title ?? "",
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      ),
      textAlign: textAlign,
    );

Widget textHelperSimple(
    { String? title,
      Color textColor = Colors.black,
      double? fontSize,
      bool isItalic = false,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.start}) =>
    Text(
      title ?? "",
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      ),
      textAlign: textAlign,
    );

Widget textHelperOverLop(
        { String? title,
        Color textColor = Colors.black,
         double? fontSize,
        bool isItalic = false,
        FontWeight fontWeight = FontWeight.normal,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      title ?? "",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal),
      textAlign: textAlign,
    );

Widget assetImageHelper({ String? image,  double? height,  double? width}) =>
    Container(
      height: height,
      width: width,
      child: Image.asset(
        image!,
        fit: BoxFit.fill,
      ),
    );

Widget appBarBody(
        {required String title,
        required Color textColor,
        double fontSize = 18,
        FontWeight fontWeight = FontWeight.normal,
        bool isLeading = false,
        required String leadingIcon,
        required Function onTapLeading,
        required String action1Icon,
        required Function onTapaction1,
        required String action2Icon,
        required Function onTapaction2,
        Color bgColor = Colors.transparent,
        double elevation = 0,
        required Function() onTapMenu}) =>
    AppBar(
      brightness: Brightness.light,
      backgroundColor: bgColor,
      elevation: elevation,
      // centerTitle: true,
      //title
      title: Text(
        title ?? "",
        style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Colors.black,
            fontWeight: fontWeight),
        textAlign: TextAlign.center,
      ),
      automaticallyImplyLeading: isLeading,
      //Action icon
    );

Widget textBoxContainer({required Widget child, double vertical = 0}) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: vertical),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsHelper.greyTextBoxColor()),
    child: child);

Widget bodyContainer({required Widget child, double vertical = 0}) => Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: vertical),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsHelper.cardLightWhite2()),
    child: child);

//"[0-9a-zA-Z]"
/*Widget formTextFeild(
    {String? hintText,
      String validation(String val)?,
      String save(String val)?,
      TextEditingController? controller,
      FocusNode? focusNode,
      FocusNode? nextFocusNode,
      textInputType = TextInputType.text,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction? textInputAction,
      int maxLine = 1,
      int maxLength = 100,
      bool obscureText = false,
      bool suffixIcon = false,
      bool isValidateForm = false,
      String formates = "[0-9a-zA-Z]",
      Function? suffixFuncton,
      BuildContext? context}) =>
    TextFormField(
      scrollPadding: EdgeInsets.all(0),
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        if (isValidateForm) FilteringTextInputFormatter.allow(RegExp(formates)),
      ],
      //validator: validation,
      //onSaved: save,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      onFieldSubmitted: (str) => {
        nextFocusNode != null
            ? FocusScope.of(context!).requestFocus(nextFocusNode)
            : FocusScope.of(context!).requestFocus(new FocusNode()),
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        suffixIcon: suffixIcon
            ? Container(
          child: Transform.scale(
            scale: 0.65,
            child: IconButton(
              //onPressed: suffixFuncton,
              icon: assetImageHelper(
                  image: obscureText
                      ? ImageAssets.password_show
                      : ImageAssets.password_hide),
            ),
          ),
        )
            : null,
      ),
    );*/

/*//"[0-9a-zA-Z]"
Widget formTextFeild(
    {String? hintText,
      String validation(String val)?,
      String save(String val)?,
      TextEditingController? controller,
      FocusNode? focusNode,
      FocusNode? nextFocusNode,
      textInputType = TextInputType.text,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction? textInputAction,
      int maxLine = 1,
      int maxLength = 100,
      bool obscureText = false,
      bool suffixIcon = false,
      bool isValidateForm = false,
      String formates = "[0-9a-zA-Z]",
      Function? suffixFuncton,
      required BuildContext context}) =>
    TextFormField(
      scrollPadding: EdgeInsets.all(0),
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        if (isValidateForm) FilteringTextInputFormatter.allow(RegExp(formates)),
      ],
      ///validator: validation,
      // onSaved: save,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,

      keyboardType: textInputType,
      textInputAction: textInputAction,
      onFieldSubmitted: (str) => {
        nextFocusNode != null
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : FocusScope.of(context).requestFocus(new FocusNode()),
      },
      decoration: InputDecoration(
        hintText: hintText,

        border: InputBorder.none,
        prefixIcon:Container(
          child:
          Transform.scale(
            scale:1,
            child: IconButton(
              // onPressed: suffixFuncton,
              icon: assetImageHelper(
                  image: ImageAssets.email), onPressed: () {  },
            ),
          ),
        ) ,
        suffixIcon: suffixIcon
            ? Container(
          child: Transform.scale(
            scale: 0.65,
            child: IconButton(
              // onPressed: suffixFuncton,
              icon: assetImageHelper(
                  image: obscureText
                      ? ImageAssets.password_show
                      : ImageAssets.password_hide), onPressed: () {  },
            ),
          ),
        )
            : null,
      ),
    );*/


Widget formTextFeild(
    {String? hintText,
      String validation(String val)?,
      String save(String val)?,
      TextEditingController? controller,
      FocusNode? focusNode,
      FocusNode? nextFocusNode,
      textInputType = TextInputType.text,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction? textInputAction,
      int maxLine = 1,
      int maxLength = 100,
      bool obscureText = false,
      bool suffixIcon = false,
      bool isValidateForm = false,
      String formates = "[0-9a-zA-Z]",
      Function? suffixFuncton,
      required BuildContext context}) =>
    TextFormField(
      scrollPadding: EdgeInsets.all(0),
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        if (isValidateForm) FilteringTextInputFormatter.allow(RegExp(formates)),
      ],
      ///validator: validation,
      // onSaved: save,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,

      keyboardType: textInputType,
      textInputAction: textInputAction,
      onFieldSubmitted: (str) => {
        nextFocusNode != null
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : FocusScope.of(context).requestFocus(new FocusNode()),
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        prefixIcon:Container(
          height: 40,
          margin: EdgeInsets.only(right: 8,top: 6,bottom: 6),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
          child:
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child:
            IconButton(
              icon: assetImageHelper(
                  image: ImageAssets.email_neww,height: 30,width: 18), onPressed: () {  },
            ),
          ),
        ),

        suffixIcon: suffixIcon
            ? Container(
          child: Transform.scale(
            scale: 0.65,
            child: IconButton(
              // onPressed: suffixFuncton,
              icon: assetImageHelper(
                  image: obscureText
                      ? ImageAssets.password_show
                      : ImageAssets.password_hide), onPressed: () {  },
            ),
          ),
        )
            : null,
      ),
    );

Widget formTextFeildSimple(
    {String? hintText,
      String validation(String val)?,
      String save(String val)?,
      TextEditingController? controller,
      FocusNode? focusNode,
      FocusNode? nextFocusNode,
      textInputType = TextInputType.text,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction? textInputAction,
      int maxLine = 1,
      int maxLength = 100,
      bool obscureText = false,
      bool suffixIcon = false,
      bool isValidateForm = false,
      String formates = "[0-9a-zA-Z]",
      required BuildContext context}) =>
    TextFormField(
      scrollPadding: EdgeInsets.all(0),
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        if (isValidateForm) FilteringTextInputFormatter.allow(RegExp(formates)),
      ],
      ///validator: validation,
      // onSaved: save,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,

      keyboardType: textInputType,
      textInputAction: textInputAction,
      onFieldSubmitted: (str) => {
        nextFocusNode != null
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : FocusScope.of(context).requestFocus(new FocusNode()),
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        /*prefixIcon:Container(
          height: 40,
          margin: EdgeInsets.only(right: 8,top: 6,bottom: 6),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
          child:
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child:
            IconButton(
              icon: assetImageHelper(
                  image: ImageAssets.email_neww,height: 30,width: 18), onPressed: () {  },
            ),
          ),
        ),*/

        suffixIcon: suffixIcon
            ? Container(
          child: Transform.scale(
            scale: 0.65,
            child: IconButton(
              // onPressed: suffixFuncton,
              icon: assetImageHelper(
                  image: obscureText
                      ? ImageAssets.password_show
                      : ImageAssets.password_hide), onPressed: () {  },
            ),
          ),
        )
            : null,
      ),
    );

//"[0-9a-zA-Z]"
Widget PassformTextFeild(
    {String? hintText,
      String validation(String val)?,
      String save(String val)?,
      TextEditingController? controller,
      FocusNode? focusNode,
      FocusNode? nextFocusNode,
      textInputType = TextInputType.text,
      textCapitalization = TextCapitalization.sentences,
      TextInputAction? textInputAction,
      int maxLine = 1,
      int maxLength = 100,
      bool obscureText = false,
      bool suffixIcon = false,
      bool isValidateForm = false,
      String formates = "[0-9a-zA-Z]",
      Function? suffixFuncton,
      required BuildContext context}) =>
    TextFormField(
      scrollPadding: EdgeInsets.all(0),
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        if (isValidateForm) FilteringTextInputFormatter.allow(RegExp(formates)),
      ],
      ///validator: validation,
      // onSaved: save,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,

      keyboardType: textInputType,
      textInputAction: textInputAction,
      onFieldSubmitted: (str) => {
        nextFocusNode != null
            ? FocusScope.of(context).requestFocus(nextFocusNode)
            : FocusScope.of(context).requestFocus(new FocusNode()),
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14),
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        prefixIcon:Container(
          height: 40,
          margin: EdgeInsets.only(right: 8,top: 6,bottom: 6),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
          child:
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child:
            IconButton(
              icon: assetImageHelper(
                  image: ImageAssets.passwor,height: 16,width: 16), onPressed: () {  },
            ),
          ),
        ),
        suffixIcon: suffixIcon
            ? Container(
          child: Transform.scale(
            scale: 0.85,
            child: IconButton(
              // onPressed: suffixFuncton,
              icon: assetImageHelper(
                  image: obscureText
                      ? ImageAssets.password_show
                      : ImageAssets.password_hide), onPressed: () {  },
            ),
          ),
        )
            : null,
      ),
    );

Widget submitButton({String? title,   required Function() onPressed}) => ButtonColor(
    color: ColorsHelper.blueColor(),
    radius: 0,
    width: double.infinity,

    // onPressed: onPressed,
    onPressed: onPressed,
    child: Text(
      title ?? "",
      style: TextStyle(
          color: ColorsHelper.whiteColor(),
          fontSize: 20,
          fontWeight: FontWeight.w600),
    ));

Widget submitButtonGreen({String? title,   required Function() onPressed}) => ButtonColor(
    color: ColorsHelper.greenButtonColor(),
    radius: 0,
    width: double.infinity,

    // onPressed: onPressed,
    onPressed: onPressed,
    child: Text(
      title ?? "",
      style: TextStyle(
          color: ColorsHelper.whiteColor(),
          fontSize: 20,
          fontWeight: FontWeight.w600),
    ));

Widget submitNewButtonGreen( {required String title}   ) => Container(

    width: double.infinity,
    height: 50,
    decoration: const BoxDecoration(
  image:  DecorationImage(
    image: AssetImage("assets/green_button.png"),
    fit: BoxFit.cover,
  ),
),

    child:Align(
      alignment: Alignment.center,
      child:  Text(
        title ?? "",
        style: TextStyle(
            color: ColorsHelper.whiteColor(),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    )


);

Widget submitNewButtonBlue( {required String title}   ) => Container(

    width: double.infinity,
    height: 50,
    decoration: const BoxDecoration(
      image:  DecorationImage(
        image: AssetImage("assets/blue_button.png"),
        fit: BoxFit.cover,
      ),
    ),

    child:Align(
      alignment: Alignment.center,
      child:  Text(
        title ?? "",
        style: TextStyle(
            color: ColorsHelper.whiteColor(),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    )
);


Widget textWithLink({
  required String text1,
  required String text2,
  required Function ontap,
  double fontSize = 13,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //dont_have_an_account
        Flexible(
          child: textHelper(
              textColor: ColorsHelper.blackColor(),
              title: text1 ?? "",
              fontSize: fontSize,
              fontWeight: FontWeight.w500),
        ),
        //create_An_Account
        InkWell(
            borderRadius: BorderRadius.circular(5),
            //onTap: ontap,
            child: Container(
                padding: EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: ColorsHelper.blueColor(),
                    width: 1.0,
                  ))),
                  child: textHelper(
                      title: text2 ?? "",
                      textColor: ColorsHelper.blueColor(),
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize),
                ))),
      ],
    );

Widget line({double margin = 10}) => //Line
    Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      color: ColorsHelper.greyColor(),
      width: double.infinity,
      height: 1,
    );
