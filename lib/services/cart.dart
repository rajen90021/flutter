
import 'package:dspuiproject/constant/colors.dart';
import 'package:dspuiproject/provider/ProviderData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bookingtest.dart';

import 'login_page.dart';

class AddCart extends StatefulWidget {
  const AddCart({super.key});

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {


  num totalValue = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final _bosData = Provider.of<ProviderData>(context, listen: false);

    for(int i = 0;i < _bosData.addCart.length;i++){

      totalValue = totalValue +  int.parse(_bosData.addCart[i]['Price']);
    }
    print(totalValue);

  }





  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProviderData>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cart",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => bookingtest())
              ).then((value){setState(() {});});
              //Navigator.of(context).pop();

            },
            icon: const Icon(Icons.arrow_back),
          ),
          bottomOpacity: 30,
        ),
        body: provider.addCart.isEmpty ? Container(
          width: MediaQuery.of(context).size.width,
          color: lightBink,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
              ),
              CircleAvatar(
                radius: 30, //radius of avatar
                backgroundColor: extralightBlueColor, //color
                child: ClipOval(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/empty-cart.png'),
                )),
              ),

              SizedBox(
                height: 20,
              ),
              Text("Find some tests",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              SizedBox(
                height: 5,
              ),
              Text("Looks like there are no tests in your cart."),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Please try some of our tests exclusively"),
              Text("recommended for you."),
              //Text("Please try some of our tests exclusively recommended for you."),
            ],
          ),
        ):

        Container(
          width: MediaQuery.of(context).size.width,
          color: lightBink,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Text Selected - ${provider.addCart.length}",    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: navyBlueColor)),

                SizedBox(height: 10,),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: provider.addCart.length,
                    itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/logo.jpg',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Column(
                                  children: [
                                    Text(
                                    provider.addCart[index]['Test Name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: navyBlueColor),
                                    ),

                                    Text(
                                    provider.addCart[index]["Parameter Covered"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: textColor),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Rs. " + provider.addCart[index]["Price"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: navyBlueColor),
                                ),
                              ),

                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          provider.addIdValue.remove(provider.addCart[index]["ID"]);
                                          provider.addCart.remove( provider.addCart[index]);
                                          totalValue = 0;
                                          for(int i = 0;i < provider.addCart.length;i++){
                                            totalValue = totalValue +  int.parse(provider.addCart[i]['Price']);
                                          }
                                          print(totalValue);
                                        });
                                      },

                                      child: Icon(Icons.close,color: Colors.red,)))
                            ],
                          ),
                        ),
                      ),
                    );}
                  ),
                ),
                Text("Total Charges",    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: navyBlueColor)),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: navyBlueColor),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Text(
                                "\u{20B9}  $totalValue",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: navyBlueColor),
                              ),
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
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Text(
                                "Add More Tests",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: navyBlueColor),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child:  IconButton(
                                  onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => bookingtest())
                                      ).then((value){setState(() {});});
                                  },
                                  icon: Icon(Icons.add_box_outlined,color: Colors.blueAccent)),






                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 100),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Center(
              child: Text('LOGIN TO PROCEED'),
            ),
          ),
        ));
  }
}
