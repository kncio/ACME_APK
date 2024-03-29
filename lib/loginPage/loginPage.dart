import 'dart:developer';

import 'package:acme_test/appTheme/acmeTheme.dart';
import 'package:acme_test/appWidgets/roundedButton.dart';
import 'package:acme_test/commons/routesNames.dart';
import 'package:acme_test/commons/stringsValues.dart';
import 'package:acme_test/loginPage/loginCubit.dart';
import 'package:acme_test/loginPage/loginState.dart';
import 'package:acme_test/splashScreenPage/logoImageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginDataModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _userName = "";
  String _password = "";

  bool _invalidCredentials = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageCubit, LoginPageState>(
      listener: (context, state) async {
        if (state is LoginPageSuccessState) {
          if (state.validUser) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                //GO to dashboard and clear navigation stack
                DASHBOARD_PAGE,
                ModalRoute.withName("/"));
          } else {
            log("shit");
            setState(() {
              _invalidCredentials = true;
              _formKey.currentState.reset();
              _formKey.currentState.validate();
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: buildBody(context),
        );
      },
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          heightFactor: 1.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  child: Image.asset(
                    "assets/app_logo.png",
                    fit: BoxFit.cover,
                  )),
              (_invalidCredentials)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Username or Password are incorrect !",
                        style: AcmeAppTheme.themeDataLight.textTheme.bodyText1
                            .copyWith(color: Colors.red),
                      ),
                    )
                  : SizedBox.shrink(),
              Form(
                key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 + 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This Field its mandatory";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              this._userName = newValue;
                            });
                          },
                          style: TextStyle(color: Colors.black54),
                          textInputAction: TextInputAction.next,
                          decoration: AcmeAppTheme.textFormFieldDecoration(
                              hintText: "$userName",
                              prefixIconData:
                                  Icon(Icons.account_circle_outlined)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This Field its mandatory";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              this._password = newValue;
                            });
                          },
                          style: TextStyle(color: Colors.black54),
                          textInputAction: TextInputAction.done,
                          decoration: AcmeAppTheme.textFormFieldDecoration(
                              hintText: "$password",
                              prefixIconData: Icon(Icons.lock_outline)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                width: MediaQuery.of(context).size.width / 3 + 50,
                child: RoundedButton(
                  label: "Login",
                  onPress: () {
                    login();
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 4, 0, 16),
                width: MediaQuery.of(context).size.width / 3 + 50,
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "Forgot?",
                      style: AcmeAppTheme.themeDataLight.textTheme.subtitle2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///Perform form validation, then send form data for login
  void login() {
    if (this._formKey.currentState.validate()) {
      this._formKey.currentState.save();
      var loginData =
          LoginData(userName: this._userName, password: this._password);
      context.read<LoginPageCubit>().login(loginData);
    }
  }
}
