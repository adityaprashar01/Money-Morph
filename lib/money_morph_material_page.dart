import 'package:flutter/material.dart';
//this class extends Stateful widget.
//State<> returning a State _SwapCoinMaterialPageState()
//State<> is used to specify generic type and make the code better.


//steps for making the app functionable->
//1.create a variable that stores the converted currency value
//2.create a function that multiplies the value given by the textfield with whatever the exchangerate we have eg.81
//3.Store the value in the variable that we created
//4.display the variable

class MoneyMorphMaterialPage extends StatefulWidget{
  const MoneyMorphMaterialPage({super.key}) ;

  @override
  State<MoneyMorphMaterialPage> createState() => _MoneyMorphMaterialPageState();
} 

//we make a private class where mutable variables can be created
//as it does'n have constant constructor

class _MoneyMorphMaterialPageState extends State<MoneyMorphMaterialPage> {
   double result = 0;
   final TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      //Color(0xAARRGGBB)
      borderSide:   BorderSide(
      width: 2.0,
      style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5),)
    );
    return  Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.blueGrey,

    //App Bar with Title: Swap Coin.
    

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Money Morph',
          style: TextStyle(color: Colors.white,fontWeight : FontWeight.bold)),
        centerTitle: true,
      ),
    
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children:  [
          //int -> string integervalue.toString()
          // string -> int int.parse(stringvalue)

          
           //logo

            Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 174, 166, 3),width:2),
                    shape:BoxShape.circle),
                  child: const Icon(
                    Icons.currency_exchange,
                    color: Colors.yellow,
                    size: 80,
                  ),
                ),
            //Text:
            //It displays the converted currency.


            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),


            //TextField:
            //It takes input from User.
            //When untyped, display text 'Please enter the amount in USD'.

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle:  TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon:  Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),



           //Button
            //button that when clicked converts the currency.
            //buton text is Convert.
            //result is the variable that converts input String into double.
            //result does the calculation and
            //returns the value to TextEditingController.

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 82.75;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 65),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ), 
        ],
      ),
    ) 
    );
  }
}


