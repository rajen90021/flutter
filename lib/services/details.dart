import 'package:dspuiproject/constant/colors.dart';
import 'package:flutter/material.dart';




class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool visible = false;
  bool toggle =false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POTASSIUM, SERUM",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15),),
        leading: IconButton(
          onPressed: (){

            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        bottomOpacity: 30,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: extralightBlueColor,
                  borderRadius: BorderRadius.all(Radius.circular(8),),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.message_outlined,size: 25),
                              Column(
                                children: [
                                  Text(
                                    "Package Details",
                                    style: TextStyle(
                                       // fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: redColor),
                                  ),
                                  Text(
                                    "Profile/Component",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: textColor),
                                  ),
                                ],
                              ),
                             InkWell(
                               onTap: (){
                                 setState(() {
                                   visible = !visible;
                                 });
                               },
                               child: Container(
                                 height: 25,
                                 width: 25,
                                 decoration: const BoxDecoration(
                                     color: extralightBlueColor,
                                     borderRadius: BorderRadius.all(Radius.circular(5),),
                                 ),
                                 child: Icon(visible == true ?Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,size: 25)
        
                               ),
                             )
        
                            ],
                          ),
                          SizedBox(height: 10,),
                          Visibility(
                            visible: visible,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                "1. Potassium",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: textColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        
        
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: extralightBlueColor,
                  borderRadius: BorderRadius.all(Radius.circular(8),),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.all(Radius.circular(6),),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          toggle= false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: toggle == true ?Colors.white:Colors.blueAccent,
                                          borderRadius: BorderRadius.all(Radius.circular(5),),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Patient Information",
                                            style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: toggle == true ?Colors.grey:Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          toggle = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: toggle == true ?Colors.blueAccent: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(5),),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            "Doctor Information",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: toggle == true ?Colors.white:Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
        
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                        ),
                        width: MediaQuery.of(context).size.width ,
                        child:
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Test Name",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: redColor),
                              ),
                              Text(
                                "POTASSIUM, SERUM (B045)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
        
                    Row(
                      children: [
        
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(8),),
                              ),
                              child:
                              Padding(
                                padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Code",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: redColor),
                                    ),
                                    Text(
                                      "B045",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(8),),
                              ),
                              child:
                              Padding(
                                padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Report Delivery",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: redColor),
                                    ),
                                    Text(
                                      "Daily",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                        ),
                        width: MediaQuery.of(context).size.width ,
                        child:
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: redColor),
                              ),
                              Text(
                                "Electrolytic Imbalance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                        ),
                        width: MediaQuery.of(context).size.width ,
                        child:
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Specimen",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: redColor),
                              ),
                              Text(
                                "2ml (1 mL min.) Serum from 1 SST. Seprate serum from cells within 1 hour of collection. Ship refrigerated on frozen. Hemolysed samples not acceptable.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
                    Row(
                      children: [
        
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(8),),
                              ),
                              child:
                              Padding(
                                padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Stability Room",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: redColor),
                                    ),
                                    Text(
                                      "2 hrs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.all(Radius.circular(8),),
                              ),
                              child:
                              Padding(
                                padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Stability Refrigerated",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: redColor),
                                    ),
                                    Text(
                                      "72 hrs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                        ),
                        width: MediaQuery.of(context).size.width ,
                        child:
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Stability Frozen",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: redColor),
                              ),
                              Text(
                                "1 week",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                        ),
                        width: MediaQuery.of(context).size.width ,
                        child:
                        Padding(
                          padding:  const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Method",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: redColor),
                              ),
                              Text(
                                "Indirect ISE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        
        
        
                  ],
                ),
        
        
              ),
            ),
        
        
          ],
        ),
      ),
    );
  }
}
