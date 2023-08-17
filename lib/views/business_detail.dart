import 'package:flutter/material.dart';

import '../models/business.dart';

class BusinessDetail extends StatefulWidget {
  final Business business;
  const BusinessDetail(this.business, {Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {

  Widget getAppBarUI() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Business Detail',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  getAppBarUI(),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
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
                                    Text("Company:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Text(widget.business.companyName, style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Score:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text("incomplete", style: TextStyle(fontSize: 16), softWrap: true,),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Contact Status:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text("Not verifyed", style: TextStyle(fontSize: 16, color: Colors.red), softWrap: true,),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Contact Person:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.companyContactName, style: TextStyle(fontSize: 16), softWrap: true,),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Phone:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.phone, style: TextStyle(fontSize: 16), softWrap: true,),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Email:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Text(widget.business.businessEmail, style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("License Number:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Text(widget.business.stateLicenseNumber, style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Pending Lawsuit:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Text("0", style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Total Transactions:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.totalTransactionAmt.toString(), style: TextStyle(fontSize: 16), softWrap: true,),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Outstanding Invoices:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.outstandingInvoice.toString(), style: TextStyle(fontSize: 16), softWrap: true,),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(child: Text("How many times that company has been searched: "+ widget.business.timesSearched.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("Late Payments", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("30 Days:", style: TextStyle(fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.late30.toString(), style: TextStyle(fontSize: 16)),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("60 Days:", style: TextStyle(fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.late60.toString(), style: TextStyle(fontSize: 16)),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: Row(
                                  children: [
                                    Text("90 Days:", style: TextStyle(fontSize: 16),),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text(widget.business.late90.toString(), style: TextStyle(fontSize: 16)),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
