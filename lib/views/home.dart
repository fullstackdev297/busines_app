import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage(this.user, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppTheme.white : AppTheme.nearlyBlack,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.28,
                          height: 180,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: AppTheme.firstColor,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Grade", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black26),),
                              SizedBox(height: 20,),
                              Text(widget.user!.score, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70, color: Colors.green),),
                            ],
                          )
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.28,
                          height: 180,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: AppTheme.secondColor,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 70, height: 70,
                                child:Image.asset('assets/images/search.png'),
                              ),
                              SizedBox(height: 10,),
                              Text("Total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
                              SizedBox(height: 10,),
                              Text(widget.user!.numberSearch.toString(), style: TextStyle(fontSize: 16, color: Colors.white),),
                            ],
                          )
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.28,
                          height: 180,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              color: AppTheme.thirdColor,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 70, width: 70,
                                  child: Image.asset('assets/images/mobile.png')),
                              SizedBox(height: 10,),
                              Text("Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),),
                              SizedBox(height: 10,),
                              Text(widget.user!.typeOfBusiness, style: TextStyle(fontSize: 16, color: Colors.white),),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text("Company Name:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10,),
                              Expanded(child: Text(widget.user!.businessName, style: TextStyle(fontSize: 16),),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              Text("Address:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10,),
                              Expanded(child: Text(widget.user!.address, style: TextStyle(fontSize: 16), softWrap: true,),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              Text("Phone:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10,),
                              Expanded(child: Text(widget.user!.phone, style: TextStyle(fontSize: 16),),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              Text("License Number:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10,),
                              Expanded(child: Text(widget.user!.licenseNum, style: TextStyle(fontSize: 16),),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              Text("Contact Person:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10,),
                              Expanded(child: Text(widget.user!.contactName, style: TextStyle(fontSize: 16),),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              Text("Email:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(width: 10,),
                              Expanded(child: Text(widget.user!.businessEmail, style: TextStyle(fontSize: 16),),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Alert", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 40,),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.grey[100],
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("News", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 10,),
                        Text("Cannicheck launches version 2.0", style: TextStyle(fontSize: 16), softWrap: true,),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}