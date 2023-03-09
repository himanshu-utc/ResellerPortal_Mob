import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../bloc/bloc_login/login_bloc.dart';
import '../../resources/app_navigator/app_navigator.dart';
import '../../resources/colors.dart';
import '../../resources/strings.dart';
import '../../utils/common_widgets/common_widget.dart';
import '../../utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import '../../utils/popup_dialogs/popup_dialogs.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = "/ResetPassword";
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isHide1 = true, isHide2 = true;

  TextEditingController passswordController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  FocusNode passwordNode = FocusNode();
  FocusNode confirmPwdNode = FocusNode();

  LoginBloc loginBloc = LoginBloc(LoginInitial());

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => callUnfocus(context: context),
        child: Scaffold(
          //AppBar
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => AppNavigator.popBackStack(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          //Body
          body: Container(
              margin: const EdgeInsets.only(top: 35),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: resetPassword()),
        ));
  }

  Widget resetPassword() => SizedBox(
        width: double.infinity,
        child: ScrollConfiguration(
          behavior: ListViewScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                //login_user
                loginUserLogo(),
                const SizedBox(
                  height: 20,
                ),
                //forgot_Password
                textHelper(
                    textColor: ColorsHelper.blueColor(),
                    title: StringHelper.reset_Password,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  height: 20,
                ),
                //do_not_worry_Enter_your_email_ID_below
                textHelper(
                    title: StringHelper.reset_Password_for_abc_gmail_com,
                    fontWeight: FontWeight.w500, fontSize: 14),
                const SizedBox(
                  height: 20,
                ),
                //passwordForm
                passwordForm(),
                const SizedBox(
                  height: 20,
                ),
                //nextButton
                //saveButton(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );

  Widget passwordForm() => Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          //password
          textBoxContainer(
              child: formTextFeild(
                  context: context,
                  controller: passswordController,
                  focusNode: passwordNode,
                  nextFocusNode: confirmPwdNode,
                  hintText: StringHelper.password,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  //validation: CommonValidator.passValidation,
                  obscureText: isHide1,
                  suffixIcon: true,
                  suffixFuncton: () {
                    if (mounted) {
                      isHide1 = !isHide1;
                      setState(() {});
                    }
                  })),
          const SizedBox(
            height: 15,
          ),
          //confirm_password
          textBoxContainer(
              child: formTextFeild(
                  context: context,
                  controller: confirmPwdController,
                  focusNode: confirmPwdNode,
                  nextFocusNode: null,
                  hintText: StringHelper.confirm_password,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  //validation: CommonValidator.passValidation,
                  obscureText: isHide2,
                  suffixIcon: true,
                  suffixFuncton: () {
                    if (mounted) {
                      isHide2 = !isHide2;
                      setState(() {});
                    }
                  })),
          const SizedBox(
            height: 20,
          ),
        ],
      ));
}
