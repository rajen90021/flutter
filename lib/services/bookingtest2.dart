import 'package:flutter/material.dart';
import 'package:dspuiproject/constant/colors.dart';
import 'package:dspuiproject/provider/ProviderData.dart';
import 'package:dspuiproject/repository/TestRepository.dart';
import 'package:dspuiproject/services/cart.dart';
import 'package:dspuiproject/services/details.dart';
import 'package:dspuiproject/services/home_page2.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class BookingTest2 extends StatefulWidget {
  const BookingTest2({Key? key}) : super(key: key);

  @override
  State<BookingTest2> createState() => _BookingTest2State();
}

class _BookingTest2State extends State<BookingTest2> {
  final repository = TestRepository();

  late Future<List<Map<String, dynamic>>> testDataFuture;

  @override
  void initState() {
    super.initState();
    testDataFuture = fetchTestData();
  }

  Future<List<Map<String, dynamic>>> fetchTestData() async {
    try {
      return await repository.fetchTestData();
    } catch (e) {
      print('Error fetching test data: $e');
      rethrow;
    }
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homepage2()),
            ).then((value) {
              setState(() {});
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
        bottomOpacity: 30,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCart()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 15,
                top: 0,
                bottom: 15,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: navyBlueColor,
                      size: 25,
                    ),
                  ),
                  provider.addIdValue.isEmpty
                      ? Container()
                      : Positioned(
                    top: -2,
                    left: 6,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: redColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          provider.addIdValue.length.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white,
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
      body: Container(
        color: lightBink,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: testDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SimpleCircularProgressBar( backStrokeWidth: 0,),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final testData = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: testData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = testData[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/logo.jpg',
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item['Test Name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: navyBlueColor,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Compare",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.compare,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(Icons.info_outline,
                                          color: Colors.black, size: 30),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item["Parameter Covered"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "DETAILS",
                                          style: TextStyle(
                                            decoration:
                                            TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: navyBlueColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(Icons.settings,
                                          color: Colors.black, size: 30),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item["Special Preparation"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                          Icons.text_snippet_outlined,
                                          color: Colors.black,
                                          size: 30),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item["Sample Reqiured"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.price_check,
                                          color: Colors.black, size: 30),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "Rs. " + item["Price"],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: provider.addIdValue
                                            .contains(item["ID"])
                                            ? tealGreenColor
                                            : navyBlueColor,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (provider.addIdValue
                                              .contains(item["ID"])) {
                                            provider.addCart.remove(item);
                                            provider.addIdValue
                                                .remove(item["ID"]);
                                          } else {
                                            provider.addCart.add(item);
                                            provider.addIdValue.add(item["ID"]);
                                          }
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          provider.addIdValue
                                              .contains(item["ID"])
                                              ? "REMOVE FROM CART"
                                              : "ADD TO CART",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: provider.addIdValue
                                                .contains(item["ID"])
                                                ? redColor
                                                : navyBlueColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

//used static data *********************8
// class BookingTest2 extends StatefulWidget {
//   const BookingTest2({Key? key}) : super(key: key);
//
//   @override
//   State<BookingTest2> createState() => _BookingTest2State();
// }
//
// class _BookingTest2State extends State<BookingTest2> {
//   final repository = TestRepository();
//   List<Map<String, dynamic>> newDataList = [
//     {
//       "ID": 1,
//       "Test Name": "POTASSIUM, SERUM (B045)",
//       "Parameter Covered": "1 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "130"
//     },
//     {
//       "ID": 2,
//       "Test Name": "SODIUM, SERUM (B044)",
//       "Parameter Covered": "1 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "130"
//     },
//     {
//       "ID": 3,
//       "Test Name": "COMPLETE BLOOD COUNT; CBC (Z021)",
//       "Parameter Covered": "20 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "210"
//     },
//     {
//       "ID": 4,
//       "Test Name": "UREA, SERUM (B021)",
//       "Parameter Covered": "1 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "100"
//     },
//     {
//       "ID": 5,
//       "Test Name": "SWASTHFIT LIFE CHECKUP (WM104)",
//       "Parameter Covered": "4 Parameter(s) Covered",
//       "Special Preparation":
//       "24 hours post recipt of sample in the Testing Lab",
//       "Sample Reqiured": "Daily",
//       "Price": "399"
//     },
//     {
//       "ID": 6,
//       "Test Name": "DENGU PANEL (WZ669)",
//       "Parameter Covered": "3 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "1400"
//     },
//     {
//       "ID": 7,
//       "Test Name": "TYROID PROFILE (Z284)",
//       "Parameter Covered": "3 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "250"
//     },
//     {
//       "ID": 8,
//       "Test Name": "LIPID SCREEN, SERUM (Z318)",
//       "Parameter Covered": "6 Parameter(s) Covered",
//       "Special Preparation": "Overnight fasting is not mandatory",
//       "Sample Reqiured": "Daily",
//       "Price": "350"
//     },
//     {
//       "ID": 9,
//       "Test Name": "LIVER PANEL 1; LFT (Z005)",
//       "Parameter Covered": "11 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "600"
//     },
//     {
//       "ID": 10,
//       "Test Name": "KIDNEY PANEL; KFT (Z007)",
//       "Parameter Covered": "16 Parameter(s) Covered",
//       "Special Preparation": "NO special preparation required",
//       "Sample Reqiured": "Daily",
//       "Price": "640"
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ProviderData>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         title: const Text(
//           "Book A Test",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => homepage2()),
//             ).then((value) {
//               setState(() {});
//             });
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         bottomOpacity: 30,
//         actions: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddCart()),
//               );
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 0,
//                 right: 15,
//                 top: 0,
//                 bottom: 15,
//               ),
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Icon(
//                       Icons.shopping_cart_rounded,
//                       color: navyBlueColor,
//                       size: 25,
//                     ),
//                   ),
//                   provider.addIdValue.isEmpty
//                       ? Container()
//                       : Positioned(
//                     top: -2,
//                     left: 6,
//                     right: 0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: redColor,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(6.0),
//                         child: Text(
//                           provider.addIdValue.length.toString(),
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 13,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Container(
//         color: lightBink,
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: newDataList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final item = newDataList[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       elevation: 5,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Image.asset(
//                                   'assets/logo.jpg',
//                                   height: 30,
//                                   width: 30,
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     item['Test Name'],
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: navyBlueColor,
//                                     ),
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     "Compare",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: textColor,
//                                     ),
//                                   ),
//                                 ),
//                                 const Icon(
//                                   Icons.compare,
//                                   color: Colors.black,
//                                   size: 25,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 const Icon(Icons.info_outline,
//                                     color: Colors.black, size: 30),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     item["Parameter Covered"],
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: textColor,
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                         builder: (context) => DetailPage(),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text(
//                                     "DETAILS",
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: navyBlueColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 const Icon(Icons.settings,
//                                     color: Colors.black, size: 30),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     item["Special Preparation"],
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: textColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 const Icon(Icons.text_snippet_outlined,
//                                     color: Colors.black, size: 30),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     item["Sample Reqiured"],
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: textColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(Icons.price_check,
//                                     color: Colors.black, size: 30),
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Text(
//                                     "Rs. " + item["Price"],
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: textColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: provider.addIdValue
//                                       .contains(item["ID"])
//                                       ? tealGreenColor
//                                       : navyBlueColor,
//                                 ),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     if (provider.addIdValue
//                                         .contains(item["ID"])) {
//                                       provider.addCart.remove(item);
//                                       provider.addIdValue.remove(item["ID"]);
//                                     } else {
//                                       provider.addCart.add(item);
//                                       provider.addIdValue.add(item["ID"]);
//                                     }
//                                   });
//                                 },
//                                 child: Center(
//                                   child: Text(
//                                     provider.addIdValue.contains(item["ID"])
//                                         ? "REMOVE FROM CART"
//                                         : "ADD TO CART",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: provider.addIdValue
//                                           .contains(item["ID"])
//                                           ? redColor
//                                           : navyBlueColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
