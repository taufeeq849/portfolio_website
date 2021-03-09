import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/styles/textStyles.dart';
import 'package:portfolio_website/views/contact_me/contact_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class ContactView extends StatelessWidget {
  final GlobalKey<FormState> _namekey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _messagekey = GlobalKey<FormState>();
  ContactViewModel _contactViewModel = new ContactViewModel();
  String name, email, message;
  Size size;

  Widget _buildInfoSection() {
    return Text(
      'Please feel free to contact me regarding any software development enquiries! ',
      style: mainHeadingStyle,
    );
  }

  Widget _buildNameTextField(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Name",
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Form(
          key: _namekey,
          child: Container(
            width: isDesktop ? size.width / 3 : double.infinity,
            alignment: Alignment.centerLeft,
            decoration: contactMeStyle,
            height: 60.0,
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty || !value.contains(" ")) {
                  return "Name is invalid";
                }
                return null;
              },
              onSaved: (value) {
                this.name = value;
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailTextField(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Form(
          key: _emailkey,
          child: Container(
            width: isDesktop ? size.width / 3 : double.infinity,
            alignment: Alignment.centerLeft,
            decoration: contactMeStyle,
            height: 60.0,
            child: TextFormField(
              validator: (value) {
                var num = int.tryParse(value);
                if (value.isEmpty || !value.contains("@")) {
                  return "Email is invalid";
                }
                return null;
              },
              onSaved: (value) {
                this.email = value;
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMessageTextField(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Message",
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Form(
          key: _messagekey,
          child: Container(
            width: isDesktop ? size.width / 3 : double.infinity,
            alignment: Alignment.centerLeft,
            decoration: contactMeStyle,
            height: size.height / 5,
            child: TextFormField(
              maxLines: null,
              validator: (value) {
                if (value.isEmpty || !value.contains(" ")) {
                  return "Message is invalid";
                }
                return null;
              },
              onSaved: (value) {
                this.message = value;
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        )
      ],
    );
  }

  // Widget _buildSaveBtn() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 25.0),
  //     width: size.height / 2,
  //     child: FlatButton(

  //       onPressed: () {
  //         _namekey.currentState.validate();
  //         _emailkey.currentState.validate();
  //         _messagekey.currentState.validate();
  //         bool isValid = _namekey.currentState.validate() &&
  //             _emailkey.currentState.validate() &&
  //             _messagekey.currentState.validate();
  //         if (isValid) {
  //           _namekey.currentState.save();
  //           _emailkey.currentState.save();
  //           _messagekey.currentState.save();
  //           _contactViewModel.submitData(name, email, message);
  //         }
  //       }),
  //       padding: EdgeInsets.all(15.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       color: buttonColor,
  //       Widget: Text(
  //         'Submit',
  //         style: TextStyle(
  //           color: Colors.white,
  //           letterSpacing: 1.5,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    bool isDesktop = true;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => _contactViewModel,
        builder: (context, model, child) {
          return ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.isMobile || sizingInformation.isTablet) {
              isDesktop = false;
            }
            return Container(
              color: Colors.black,
              child: _contactViewModel.hasSent
                  ? Column(children: [
                      _buildInfoSection(),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Thank you for submiting, you will be contacted shortly. ",
                        style: subheadingStyle,
                      ),
                    ])
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildInfoSection(),
                          SizedBox(
                            height: 20,
                          ),
                          _buildNameTextField(isDesktop),
                          SizedBox(
                            height: 10,
                          ),
                          _buildEmailTextField(isDesktop),
                          SizedBox(
                            height: 10,
                          ),
                          _buildMessageTextField(isDesktop),
                          SizedBox(
                            height: 20,
                          ),
                          //   _buildSaveBtn()
                        ],
                      ),
                    ),
            );
          });
        });
  }
}
