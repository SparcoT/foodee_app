import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverSearchingPage extends StatefulWidget {
  @override
  _DriverSearchingPageState createState() => _DriverSearchingPageState();
}

class _DriverSearchingPageState extends State<DriverSearchingPage> {
  static const color = Color(0xfff1ae22);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Searching...',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
      body: Stack(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: Text(
              'WE ARE FINDING RIDE FOR YOU',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Spacer(),
          Text('DESTINATION', style: TextStyle(
            color: Colors.white.withOpacity(.3), fontSize: 12
          ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 25, 40, 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                Icon(CupertinoIcons.location, color: color),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        'ADDRESS LINE 1',
                        style: TextStyle(
                          fontSize: 13,
                          color: color,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Detailed Address line 2',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 1.1,
                          color: Colors.white,
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ]),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade800,
              ),
            ),
          ),
        ]),

        Center(
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width + 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
              color: Colors.black.withOpacity(.1),
            ),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(.3),
                ),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Stack(children: [
                      Center(
                          child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: '00:25',
                            style: GoogleFonts.lato(
                              fontSize: 55,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: 'EST. 1-2 MINUTES',
                            style: GoogleFonts.robotoCondensed(color: color),
                          )
                        ]),
                        textAlign: TextAlign.center,
                      )),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: .65,
                          strokeWidth: 6,
                          valueColor: AlwaysStoppedAnimation(color),
                        ),
                      ),
                    ]),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        height: 70,
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(10, 10),
              primary: Colors.white,
              onSurface: Colors.white,
            ),
            child: Text('Cancel Search',
                style: GoogleFonts.quicksand(fontSize: 17, letterSpacing: 2)),
            onPressed: () {
              /// Driver Cancelation here.
            },
          ),
        ),
      ),
    );
  }
}
