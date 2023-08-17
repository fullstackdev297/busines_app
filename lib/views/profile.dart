import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/user.dart';
import '../service/http_service.dart';
import 'navigation_home.dart';

enum Business_type { a, b, c, d, e, f}
enum Business_operates { a, b, c}
const List<String> state_list = <String>['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware',
  'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idoho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
  'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
  'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakata', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
  'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virgina', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'];

class ProfilePage extends StatefulWidget {
  final User? user;
  final Function toggle;
  const ProfilePage(this.user, this.toggle, {Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String type_of_business, legal_form, state, licensed_state;
  Business_type? _business_type;
  Business_operates? _business_operates;

  var idController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var businessController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var zipController = TextEditingController();
  var phoneController = TextEditingController();
  var businessSinceController = TextEditingController();
  var taxIdController = TextEditingController();
  var licenseNumController = TextEditingController();
  var titleController = TextEditingController();
  var parentCompanyController = TextEditingController();
  var contactNameController = TextEditingController();
  var businessEmailController = TextEditingController();

  bool isLoading = false;

  String dropdownState = state_list.first;
  String dropdownLicensed = state_list.first;

  @override
  void initState() {
    super.initState();
    idController.text = widget.user!.id.toString();
    firstnameController.text = widget.user!.firstname;
    lastnameController.text = widget.user!.lastname;
    emailController.text = widget.user!.email;
    businessController.text = widget.user!.businessName;
    addressController.text = widget.user!.address;
    cityController.text = widget.user!.city;
    state = widget.user!.state;
    zipController.text = widget.user!.zipCode.toString();
    phoneController.text = widget.user!.phone;
    businessSinceController.text = widget.user!.businessSince.toString();
    taxIdController.text = widget.user!.taxId;
    licenseNumController.text = widget.user!.licenseNum;
    titleController.text = widget.user!.title;
    licensed_state = widget.user!.licensedState;
    parentCompanyController.text = widget.user!.parentCompany;
    contactNameController.text = widget.user!.contactName;
    businessEmailController.text = widget.user!.businessEmail;
    type_of_business = widget.user!.typeOfBusiness;
    legal_form = widget.user!.legalForm;
    if(widget.user!.typeOfBusiness == "Cultivation"){
      _business_type = Business_type.a;
    } else if(widget.user!.typeOfBusiness == "Retail Storefront"){
      _business_type = Business_type.b;
    } else if(widget.user!.typeOfBusiness == "Manufacturing"){
      _business_type = Business_type.c;
    } else if(widget.user!.typeOfBusiness == "Distribution"){
      _business_type = Business_type.d;
    } else if(widget.user!.typeOfBusiness == "Retail non Storefront"){
      _business_type = Business_type.e;
    } else{
    _business_type = Business_type.f;
    }
    if(widget.user!.legalForm == "Corporation"){
      _business_operates = Business_operates.a;
    } else if(widget.user!.legalForm == "Partnership"){
      _business_operates = Business_operates.b;
    } else{
      _business_operates = Business_operates.c;
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: isLoading ? Center(child: CircularProgressIndicator()) : Padding(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        value: state,
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
                  ),
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
                  ),
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
                      controller: licenseNumController,
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
                        value: licensed_state,
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
                      controller: parentCompanyController,
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
                      controller: contactNameController,
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
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      setState(() {
                        isLoading = !isLoading;
                      });
                      var user  = await HttpService().profile(
                          idController.text,
                          firstnameController.text,
                          lastnameController.text,
                          emailController.text,
                          passwordController.text,
                          businessController.text,
                          addressController.text,
                          cityController.text,
                          state,
                          zipController.text,
                          phoneController.text,
                          type_of_business,
                          legal_form,
                          businessSinceController.text,
                          taxIdController.text,
                          licenseNumController.text,
                          titleController.text,
                          licensed_state,
                          parentCompanyController.text,
                          contactNameController.text,
                          businessEmailController.text);
                      if(user != null){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHome(user, widget.toggle)));
                      } else{
                        setState(() {
                          isLoading = !isLoading;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
