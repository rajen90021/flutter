
import 'package:dspuiproject/constant/colors.dart';
import 'package:dspuiproject/provider/ProviderData.dart';
import 'package:dspuiproject/services/cart.dart';
import 'package:dspuiproject/services/details.dart';
import 'package:dspuiproject/services/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class bookingtest extends StatefulWidget {
  const bookingtest({super.key});

  @override
  State<bookingtest> createState() => _bookingtestState();
}

class _bookingtestState extends State<bookingtest> {

  List newDataList = [
    {
      "ID": 1,
      "Test Name": "POTASSIUM, SERUM (B045)",
      "Parameter Covered": "1 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "130"
    },
    {
      "ID": 2,
      "Test Name": "SODIUM, SERUM (B044)",
      "Parameter Covered": "1 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "130"
    },
    {
      "ID": 3,
      "Test Name": "COMPLETE BLOOD COUNT; CBC (Z021)",
      "Parameter Covered": "20 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "210"
    },
    {
      "ID": 4,
      "Test Name": "UREA, SERUM (B021)",
      "Parameter Covered": "1 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "100"
    },
    {
      "ID": 5,
      "Test Name": "SWASTHFIT LIFE CHECKUP (WM104)",
      "Parameter Covered": "4 Parameter(s) Covered",
      "Special Preparation":
      "24 hours post recipt of sample in the Testing Lab",
      "Sample Reqiured": "Daily",
      "Price": "399"
    },
    {
      "ID": 6,
      "Test Name": "DENGU PANEL (WZ669)",
      "Parameter Covered": "3 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "1400"
    },
    {
      "ID": 7,
      "Test Name": "TYROID PROFILE (Z284)",
      "Parameter Covered": "3 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "250"
    },
    {
      "ID": 8,
      "Test Name": "LIPID SCREEN, SERUM (Z318)",
      "Parameter Covered": "6 Parameter(s) Covered",
      "Special Preparation": "Overnight fasting is not mandatory",
      "Sample Reqiured": "Daily",
      "Price": "350"
    },
    {
      "ID": 9,
      "Test Name": "LIVER PANEL 1; LFT (Z005)",
      "Parameter Covered": "11 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "600"
    },
    {
      "ID": 10,
      "Test Name": "KIDNEY PANEL; KFT (Z007)",
      "Parameter Covered": "16 Parameter(s) Covered",
      "Special Preparation": "NO special preparation required",
      "Sample Reqiured": "Daily",
      "Price": "640"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderData>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "Book A Test",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => homepage2())
            ).then((value){setState(() {});});
          },
          icon: const Icon(Icons.arrow_back),
        ),
        bottomOpacity: 30,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCart()));
            },
            child: Padding(
              padding:
              const EdgeInsets.only(left: 0, right: 15, top: 0, bottom: 15),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: navyBlueColor, size: 25)),
                  provider.addIdValue.length == 0?Container():

                  Positioned(
                    top: -2,
                    left: 6,
                    right: 0,
                    child: Container(
                        decoration: new BoxDecoration(
                          color: redColor,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(provider.addIdValue.length.toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white),),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: lightBink,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: newDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(

                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Image.asset(
                                        'assets/logo.jpg',
                                        height: 30,
                                        width: 30,
                                      )),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      newDataList[index]['Test Name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: navyBlueColor),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Compare",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          color: textColor),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.compare,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(Icons.info_outline,
                                          color: Colors.black, size: 30)),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      newDataList[index]["Parameter Covered"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage()));
                                      },
                                      child: Text(
                                        "DETAILS",
                                        style: TextStyle(
                                            decoration:
                                            TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: navyBlueColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(Icons.settings,
                                          color: Colors.black, size: 30)),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      newDataList[index]["Special Preparation"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Icon(Icons.text_snippet_outlined,
                                          color: Colors.black, size: 30)),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      newDataList[index]["Sample Reqiured"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor),
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color:
                                    provider.addIdValue.contains(newDataList[index]["ID"]) ?tealGreenColor : navyBlueColor
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 0, 0, 0),
                                          child: Text(
                                            "Rs. " + newDataList[index]["Price"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: navyBlueColor),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 28,
                                        width: 2,
                                        // color: textColor,
                                        decoration: const BoxDecoration(
                                          color: navyBlueColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            width: 30,
                                          )),
                                      Container(
                                        height: 28,
                                        width: 2,
                                        // color: textColor,
                                        decoration: const BoxDecoration(
                                          color: navyBlueColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(

                                          onTap:
                                          provider.addIdValue.contains(newDataList[index]["ID"])?

                                              (){
                                            setState(() {
                                              print(provider.addCart);
                                              provider.addIdValue.remove(newDataList[index]["ID"]);
                                              provider.addCart.remove(newDataList[index]);

                                            });


                                          }
                                              :
                                              (){
                                            setState(() {
                                              provider.addCart.add(newDataList[index]);
                                              print(provider.addCart);
                                              provider.addIdValue.add(newDataList[index]["ID"]);
                                              print(newDataList[index]["ID"]);
                                              print( provider.addIdValue.contains(newDataList[index]["ID"]));
                                            });


                                          },
                                          child: Container(
                                            height: 37,
                                            child: Center(
                                              child: Text(
                                                provider.addIdValue.contains(newDataList[index]["ID"]) ? "REMOVE": "ADD TO CART",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: provider.addIdValue.contains(newDataList[index]["ID"])? redColor:navyBlueColor

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // onTap: () => print(data),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
