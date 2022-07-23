import 'package:flutter/material.dart';
import '../utilites/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/images/backimage.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    cityName=value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor:Colors.white,
                    icon: const Icon(
                      Icons.location_city,
                      color:Colors.white,
                    ),
                    hintText: "Enter City Name",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context,cityName);
                },
                child:
                Container(
                  width: 200,
                  height: 50,
                  decoration:BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Text("Get Weather",style:kButtonTextStyle ,)),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}