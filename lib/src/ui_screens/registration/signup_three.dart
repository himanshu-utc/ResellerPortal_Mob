// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/image_assets.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';

class SignUpThreeScreen extends StatefulWidget {
  static const String routeName = "/SignUpThreeScreen";

  @override
  _SignUpThreeScreenState createState() => _SignUpThreeScreenState();
}

class _SignUpThreeScreenState extends State<SignUpThreeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isHide1 = true, isHide2 = true;
  bool checked = true;
  //LoginBloc loginBloc = LoginBloc(LoginInitial());
  File? imageFile;
  File? eWasteImageFile;
  File? gstImageFile;
  File? aadharFrontImageFile;
  File? aadharBackImageFile;
  File? cancelledChequeImageFile;
  File? profileImageFile;

  //late MainBloc mainBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 25),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:SingleChildScrollView(
            child: Column(
              children: <Widget>[

                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child:  Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: ColorsHelper.btn_blue(),
                      ),
                    )
                    ,
                    const SizedBox(
                      width: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: textHelper(
                          textAlign: TextAlign.start,
                          title: StringHelper.register,
                          textColor: ColorsHelper.blackColor(),
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),

                eWasteImageFile==null?
                GestureDetector(
                  onTap: (){
                    _ewaste_pickedImage();

                  },
                  child:Container(
                      width: double.infinity,
                      height: 50,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: ColorsHelper.btn_blue()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: assetImageHelper(
                                image: ImageAssets.upload_icon), onPressed: () {  },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textHelper(
                                textAlign: TextAlign.start,
                                title: StringHelper.e_waste_registration_number,
                                textColor: ColorsHelper.btn_blue(),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      )
                  ) ,
                ):
                Container(
                    width: double.infinity,
                    height: 100,
                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsHelper.greenColor()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height:80,
                          width: 80,
                          child: Image.file(
                            eWasteImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: textHelper(
                              textAlign: TextAlign.start,
                              title: "image${eWasteImageFile!.path.substring(eWasteImageFile!.path.length-20)}",
                              textColor: ColorsHelper.btn_blue(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),

                        IconButton(
                          icon: assetImageHelper(
                              image: ImageAssets.circle_check_regular), onPressed: () {  },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                ),

                const SizedBox(
                  height: 40,
                ),

                gstImageFile==null?
                GestureDetector(
                  onTap: (){
                    _gst_pickedImage();
                  },
                  child:Container(
                      width: double.infinity,
                      height: 50,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: ColorsHelper.btn_blue()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: assetImageHelper(
                                image: ImageAssets.upload_icon), onPressed: () {  },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textHelper(
                                textAlign: TextAlign.start,
                                title: StringHelper.gst_certificate,
                                textColor: ColorsHelper.btn_blue(),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      )
                  ) ,
                ):
                Container(
                    width: double.infinity,
                    height: 100,
                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsHelper.greenColor()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height:80,
                          width: 80,
                          child: Image.file(
                            gstImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        // Divider(
                        //   thickness: 10,
                        //   color: Colors.blue,
                        //   height: 80,
                        //   indent: 10,
                        //   endIndent: 10,
                        // ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textHelper(
                              textAlign: TextAlign.start,
                              title: "image${gstImageFile!.path.substring(gstImageFile!.path.length-20)}",
                              textColor: ColorsHelper.btn_blue(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),

                        IconButton(
                          icon: assetImageHelper(
                              image: ImageAssets.circle_check_regular), onPressed: () {  },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                ),

                const SizedBox(
                  height: 40,
                ),

                aadharFrontImageFile==null?
                GestureDetector(
                  onTap: (){
                    _aadhar_front_pickedImage();
                  },
                  child:Container(
                      width: double.infinity,
                      height: 50,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: ColorsHelper.btn_blue()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: assetImageHelper(
                                image: ImageAssets.upload_icon), onPressed: () {  },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textHelper(
                                textAlign: TextAlign.start,
                                title: StringHelper.cancelled_cheque,
                                textColor: ColorsHelper.btn_blue(),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      )
                  ) ,
                ):
                Container(
                    width: double.infinity,
                    height: 100,
                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsHelper.greenColor()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height:80,
                          width: 80,
                          child: Image.file(
                            aadharFrontImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: textHelper(
                              textAlign: TextAlign.start,
                              title: "image${aadharFrontImageFile!.path.substring(aadharFrontImageFile!.path.length-20)}",
                              textColor: ColorsHelper.btn_blue(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),

                        IconButton(
                          icon: assetImageHelper(
                              image: ImageAssets.circle_check_regular), onPressed: () {  },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                ),

                const SizedBox(
                  height: 40,
                ),

                aadharBackImageFile==null?
                GestureDetector(
                  onTap: (){
                    _aadhar_back_pickedImage();
                  },
                  child:Container(
                      width: double.infinity,
                      height: 50,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: ColorsHelper.btn_blue()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: assetImageHelper(
                                image: ImageAssets.upload_icon), onPressed: () {  },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textHelper(
                                textAlign: TextAlign.start,
                                title: StringHelper.aadhar_front_image,
                                textColor: ColorsHelper.btn_blue(),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      )
                  ) ,
                ):
                Container(
                    width: double.infinity,
                    height: 100,
                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsHelper.greenColor()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height:80,
                          width: 80,
                          child: Image.file(
                            aadharBackImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: textHelper(
                              textAlign: TextAlign.start,
                              title: "image${aadharBackImageFile!.path.substring(aadharBackImageFile!.path.length-20)}",
                              textColor: ColorsHelper.btn_blue(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),

                        IconButton(
                          icon: assetImageHelper(
                              image: ImageAssets.circle_check_regular), onPressed: () {  },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                ),

                const SizedBox(
                  height: 40,
                ),

                cancelledChequeImageFile==null?
                GestureDetector(
                  onTap: (){
                    _cancelled_cheque_pickedImage();
                  },
                  child:Container(
                      width: double.infinity,
                      height: 50,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: ColorsHelper.btn_blue()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: assetImageHelper(
                                image: ImageAssets.upload_icon), onPressed: () {  },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textHelper(
                                textAlign: TextAlign.start,
                                title: StringHelper.aadhar_back_image,
                                textColor: ColorsHelper.btn_blue(),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      )
                  ) ,
                ):
                Container(
                    width: double.infinity,
                    height: 100,
                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsHelper.greenColor()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height:80,
                          width: 80,
                          child: Image.file(
                            cancelledChequeImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: textHelper(
                              textAlign: TextAlign.start,
                              title: "image${cancelledChequeImageFile!.path.substring(cancelledChequeImageFile!.path.length-20)}",
                              textColor: ColorsHelper.btn_blue(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),

                        IconButton(
                          icon: assetImageHelper(
                              image: ImageAssets.circle_check_regular), onPressed: () {  },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                ),

                const SizedBox(
                  height: 40,
                ),

                profileImageFile==null?
                GestureDetector(
                  onTap: (){

                    _profile_pickedImage();
                  },
                  child:Container(
                      width: double.infinity,
                      height: 50,
                      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: ColorsHelper.btn_blue()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: assetImageHelper(
                                image: ImageAssets.upload_icon), onPressed: () {  },
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: textHelper(
                                textAlign: TextAlign.start,
                                title: StringHelper.profile_image,
                                textColor: ColorsHelper.btn_blue(),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      )
                  ) ,
                ):
                Container(
                    width: double.infinity,
                    height: 100,
                    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsHelper.greenColor()),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height:80,
                          width: 80,
                          child: Image.file(
                            profileImageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        // Divider(
                        //   thickness: 10,
                        //   color: Colors.blue,
                        //   height: 80,
                        //   indent: 10,
                        //   endIndent: 10,
                        // ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: textHelper(
                              textAlign: TextAlign.start,
                              title: "image${profileImageFile!.path.substring(profileImageFile!.path.length-20)}",
                              textColor: ColorsHelper.btn_blue(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),


                        IconButton(
                          icon: assetImageHelper(
                              image: ImageAssets.circle_check_regular), onPressed: () {  },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                ),

                const SizedBox(
                  height: 60,
                ),
                Align(child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child:  Container(
                                width: 150,
                                margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child:   submitButtonGreen(
                                    title: StringHelper.back,
                                    onPressed: () {

                                    }
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                confirmOtpPage(context);
                                },
                              child:  Container(
                                width: 150,
                                margin: const  EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child:   submitButton(
                                    title: StringHelper.save,
                                    onPressed: () {

                                    }
                                ),
                              ),
                            )
                            ,
                            const SizedBox(
                              height: 20,
                            ),
                          ],) ),

                  ),
                ),)
                //Address
              ],
            ),
          )
      ),
    );
  }

  void _ewaste_pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Choose image source"),
          actions: [
            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.camera,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    eWasteImageFile = File(pickedFile.path);
                  });

                  debugPrint("Gallery image : ${eWasteImageFile!.path.substring(imageFile!.path.length-20)}");

                }
              },
              child:const Text("Camera") ,
            ),

            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {

                    eWasteImageFile = File(pickedFile.path);

                  });

                }
              },
              child: const Text("Gallery"),
            )

          ]
      ),
    );
  }

  void _gst_pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Choose image source"),
          actions: [
            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.camera,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    gstImageFile = File(pickedFile.path);
                  });

                  debugPrint("Gallery image : ${gstImageFile!.path.substring(gstImageFile!.path.length-20)}");

                }
              },
              child:const Text("Camera") ,
            ),

            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    gstImageFile = File(pickedFile.path);
                  });

                }
              },
              child: const Text("Gallery"),
            )

          ]
      ),
    );
  }

  void _cancelled_cheque_pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Choose image source"),
          actions: [
            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.camera,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    cancelledChequeImageFile = File(pickedFile.path);
                  });

                  debugPrint("Gallery image : ${cancelledChequeImageFile!.path.substring(cancelledChequeImageFile!.path.length-20)}");

                }
              },
              child:const Text("Camera") ,
            ),

            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    gstImageFile = File(pickedFile.path);
                  });

                }
              },
              child: const Text("Gallery"),
            )

          ]
      ),
    );
  }

  void _aadhar_front_pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Choose image source"),
          actions: [
            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.camera,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    aadharFrontImageFile = File(pickedFile.path);
                  });

                  debugPrint("Gallery image : ${aadharFrontImageFile!.path.substring(aadharFrontImageFile!.path.length-20)}");

                }
              },
              child:const Text("Camera") ,
            ),

            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    gstImageFile = File(pickedFile.path);
                  });

                }
              },
              child: const Text("Gallery"),
            )

          ]
      ),
    );
  }

  void _aadhar_back_pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Choose image source"),
          actions: [
            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.camera,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    aadharBackImageFile = File(pickedFile.path);
                  });

                  debugPrint("Gallery image : ${aadharBackImageFile!.path.substring(aadharBackImageFile!.path.length-20)}");

                }
              },
              child:const Text("Camera") ,
            ),

            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    gstImageFile = File(pickedFile.path);
                  });

                }
              },
              child: const Text("Gallery"),
            )

          ]
      ),
    );
  }

  void _profile_pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: const Text("Choose image source"),
          actions: [
            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.camera,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    profileImageFile = File(pickedFile.path);
                  });

                  debugPrint("Gallery image : ${profileImageFile!.path.substring(profileImageFile!.path.length-20)}");

                }
              },
              child:const Text("Camera") ,
            ),

            GestureDetector(
              onTap: () async {
                PickedFile? pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxWidth: 1800,
                  maxHeight: 1800,
                );
                if (pickedFile != null) {
                  setState(() {
                    gstImageFile = File(pickedFile.path);
                  });

                }
              },
              child: const Text("Gallery"),
            )

          ]
      ),
    );
  }

  void confirmOtpPage(BuildContext context) async {
    // isLogin = await SharePreferencesHelper.getInstant()
    //     .getBool(SharePreferencesHelper.Is_Login);
    // if (isLogin)
    //   AppNavigator.launchDashBoard(context);
    // else
    AppNavigator.confirmOtpScreen(context);
  }


}
