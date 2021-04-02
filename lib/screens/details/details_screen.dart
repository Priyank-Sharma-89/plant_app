import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/icon_card.dart';

class DetailsScreen extends StatelessWidget {
  final String plantImg;
  final String plantName;
  final String plantCountry;
  final double plantPrice;

  DetailsScreen(
      {this.plantImg, this.plantName, this.plantCountry, this.plantPrice});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: kDefaultPadding),
                child: SizedBox(
                  height: size.height * 0.7,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding),
                                  icon: SvgPicture.asset(
                                      "assets/icons/back_arrow.svg"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              // Spacer(),
                              IconCard(icon: "assets/icons/sun.svg"),
                              IconCard(icon: "assets/icons/icon_2.svg"),
                              IconCard(icon: "assets/icons/icon_3.svg"),
                              IconCard(icon: "assets/icons/icon_4.svg"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.6,
                        width: size.width * 0.75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(63),
                            bottomLeft: Radius.circular(63),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 60,
                              color: kPrimaryColor.withOpacity(0.29),
                            ),
                          ],
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.fill,
                            image: AssetImage('$plantImg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$plantName\n",
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: plantCountry,
                            style: TextStyle(
                              fontSize: 20,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$$plantPrice",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        children: <Widget>[
          SizedBox(
            width: size.width / 2,
            height: 84,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                backgroundColor: kPrimaryColor,
              ),
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Description",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
