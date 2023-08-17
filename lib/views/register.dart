import 'package:cannicheck/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../service/http_service.dart';
import 'navigation_home.dart';

enum Business_type { a, b, c, d, e, f, g}
enum Business_operates { a, b, c}
const List<String> state_list = <String>['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware',
  'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idoho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
  'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
  'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakata', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
  'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virgina', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'];

class RegisterPage extends StatefulWidget {
  final Function toggle;
  const RegisterPage(this.toggle, {Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String type_of_business, legal_form, state, licensed_state;

  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var businessController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var zipController = TextEditingController();
  var phoneController = TextEditingController();
  var businessSinceController = TextEditingController();
  var taxIdController = TextEditingController();
  var titleController = TextEditingController();
  var licenseController = TextEditingController();
  var parentController = TextEditingController();
  var contactController = TextEditingController();
  var businessEmailController = TextEditingController();

  User? user;
  Business_type? _business_type = Business_type.a;
  Business_operates? _business_operates = Business_operates.a;
  bool isLoading = false;

  bool _validateBusinessSince = false;
  bool _validateZip = false;

  String dropdownState = state_list.first;
  String dropdownLicensed = state_list.first;

  void initState() {
    super.initState();

    type_of_business = "Cultivation";
    legal_form = "Corporation";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          backgroundColor:  AppTheme.white,
          title: Text("Register", style: TextStyle(color: AppTheme.darkText),),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined, color: AppTheme.darkText),
              onPressed: () {
                widget.toggle();
              }
          )
        ),
        body: isLoading ? Center(child: CircularProgressIndicator()) : Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "First Name",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: firstnameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your First Name',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Last Name",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Last Name',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: confirmController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Confirm Password',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Business Name",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: businessController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Business Name',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Address",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Address',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "City",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter City Name',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "State",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownState,
                      elevation: 16,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownState = value!;
                          state = dropdownState;
                        });
                      },
                      items: state_list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Zip Code",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: zipController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Zip Code',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),SizedBox(
                  height: 3,
                ),
                _validateZip ? Text('Password Value Can\'t Be Empty', style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Phone',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Type of Business",
                  style: TextStyle(fontSize: 16),
                ),
                ListTile(
                  title: const Text('Cultivation'),
                  leading: Radio<Business_type>(
                    value: Business_type.a,
                    groupValue: _business_type,
                    onChanged: (Business_type? value) {
                      setState(() {
                        _business_type = Business_type.a;
                        type_of_business = "Cultivation";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Retail Storefront'),
                  leading: Radio<Business_type>(
                    value: Business_type.b,
                    groupValue: _business_type,
                    onChanged: (Business_type? value) {
                      setState(() {
                        _business_type = Business_type.b;
                        type_of_business = "Retail Storefront";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Manufacturing'),
                  leading: Radio<Business_type>(
                    value: Business_type.c,
                    groupValue: _business_type,
                    onChanged: (Business_type? value) {
                      setState(() {
                        _business_type = Business_type.c;
                        type_of_business = "Manufacturing";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Distribution'),
                  leading: Radio<Business_type>(
                    value: Business_type.d,
                    groupValue: _business_type,
                    onChanged: (Business_type? value) {
                      setState(() {
                        _business_type = Business_type.d;
                        type_of_business = "Distribution";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Retail non Storefront'),
                  leading: Radio<Business_type>(
                    value: Business_type.e,
                    groupValue: _business_type,
                    onChanged: (Business_type? value) {
                      setState(() {
                        _business_type = Business_type.e;
                        type_of_business = "Retail non Storefront";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Testing lab'),
                  leading: Radio<Business_type>(
                    value: Business_type.f,
                    groupValue: _business_type,
                    onChanged: (Business_type? value) {
                      setState(() {
                        _business_type = Business_type.f;
                        type_of_business = "Testing lab";
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Legal Form Under Which Business Operatores",
                  style: TextStyle(fontSize: 16),
                ),
                ListTile(
                  title: const Text('Corporation'),
                  leading: Radio<Business_operates>(
                    value: Business_operates.a,
                    groupValue: _business_operates,
                    onChanged: (Business_operates? value) {
                      setState(() {
                        _business_operates = Business_operates.a;
                        legal_form = "Corporation";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Partnership'),
                  leading: Radio<Business_operates>(
                    value: Business_operates.b,
                    groupValue: _business_operates,
                    onChanged: (Business_operates? value) {
                      setState(() {
                        _business_operates = Business_operates.b;
                        legal_form = "Partnership";
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Proprietorship'),
                  leading: Radio<Business_operates>(
                    value: Business_operates.c,
                    groupValue: _business_operates,
                    onChanged: (Business_operates? value) {
                      setState(() {
                        _business_operates = Business_operates.c;
                        legal_form = "Proprietorship";
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "In Business Since",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: businessSinceController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Business Since',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),SizedBox(
                  height: 3,
                ),
                _validateBusinessSince ? Text('Value Can\'t Be Empty', style: TextStyle(color: Colors.redAccent, fontSize: 12),) : Container(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Tax ID Number",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: taxIdController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Tax ID',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Title",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Title',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "State License Number",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: licenseController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter License Number',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Licensed State",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownLicensed,
                      elevation: 16,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownLicensed = value!;
                          licensed_state = dropdownLicensed;
                        });
                      },
                      items: state_list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Name of Parent Company",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: parentController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Parent Company',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Contact Person",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: contactController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Contact Person',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Business Email",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    controller: businessEmailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Business Email',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    setState(() {
                      zipController.text.isEmpty ? _validateZip = true
                          : _validateZip = false;
                      businessSinceController.text.isEmpty ? _validateBusinessSince = true
                          : _validateBusinessSince = false;
                    });
                    if(_validateZip == false && _validateBusinessSince == false){
                      isLoading = !isLoading;
                      print(emailController.text);
                      print(passwordController.text);
                      var user = await HttpService().register(firstnameController.text, lastnameController.text, emailController.text, passwordController.text,
                          businessController.text, addressController.text, cityController.text, state, zipController.text, phoneController.text,
                          type_of_business, legal_form, businessSinceController.text, taxIdController.text, titleController.text, licenseController.text,
                          parentController.text, contactController.text, businessEmailController.text, licensed_state);
                      if(user != null){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHome(user, widget.toggle)));
                      } else{
                        setState(() {
                          isLoading = !isLoading;
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Text(
                        "Sign In ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
