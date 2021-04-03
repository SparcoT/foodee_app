import 'package:flutter/material.dart';

class Transaction  extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.teal,
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFC4346),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Transaction Detail",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )),
                    ),
                    listTile(title: "Reference", subTitle: "T201253562545522"),
                    listTile(title: "Number", subTitle: "403"),
                    listTile(title: "Amount", subTitle: "40,000"),
                    listTile(
                        title: "Description",
                        subTitle:
                        "The Transaction is Done."),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6, top: 6),
                      child: TextButton(
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFC4346),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listTile({String title, String subTitle}) {
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$subTitle"),
    );
  }
}
