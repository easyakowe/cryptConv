import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'exchange.dart';

class CustomCalc extends StatefulWidget {
  @override
  _CustomCalcState createState() => _CustomCalcState();
}

class _CustomCalcState extends State<CustomCalc> {

  final messageTextController = TextEditingController();
  String messageText;
  String selectedCurrency = 'USD';
  String selectedCrypto = 'BTC';
  double result = 0.0;


  ExchangeModel model = ExchangeModel();

  int BTCamount;
  int ETHamount;
  int LTCamount;

  List <DropdownMenuItem> getCurrencyList (){
    List<DropdownMenuItem<String>> newDropdownItem = [];

    for(String currency in currenciesList){

      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      newDropdownItem.add(newItem);
    }
    return newDropdownItem;
  }

  List <DropdownMenuItem> getCryptoList (){
    List<DropdownMenuItem<String>> newCryptoDropdownItem = [];

    for(String crypto in cryptoList){

      var newCryptoItem = DropdownMenuItem(
        child: Text(crypto),
        value: crypto,
      );

      newCryptoDropdownItem.add(newCryptoItem);
    }
    return newCryptoDropdownItem;
  }

  Future <dynamic> computeExchange() async {
    List<dynamic> amounts = [];
    for (String crypto in cryptoList){
      var exchangeRate = await model.getExchangeRate(crypto, selectedCurrency);
      amounts.add(exchangeRate);
    }
    return amounts;
  }

  void updateUI (List exchangeRate){
    setState(() {
      if (exchangeRate == null){
        BTCamount = 0;
        ETHamount = 0;
        LTCamount = 0;
        return;
      }
      double bAmt = exchangeRate[0]['rate'];
      BTCamount = bAmt.toInt();

      double eAmt = exchangeRate[1]['rate'];
      ETHamount = eAmt.toInt();

      double lAmt = exchangeRate[2]['rate'];
      LTCamount = lAmt.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 CryptConv', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 3.0),),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter Amount: '),
                  SizedBox(height: 20.0),
//                  TextField(
//                    controller: messageTextController,
//                    onChanged: (value) {
//                      messageText = value;
//                    },
//                    decoration: InputDecoration(
//                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                      hintText: 'Type your message here...',
//                      border: InputBorder.none,
//                    ),
//                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 48.0, right: 48.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'From => ',
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                        value: selectedCurrency,
                        items: getCurrencyList(),
                        onChanged: (value) {
                          setState(() async {
                            selectedCurrency = value;
                        });
                      }),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'To => ',
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                          value: selectedCrypto,
                          items: getCryptoList(),
                          onChanged: (value) {
                            setState(() async {
                              selectedCurrency = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Result: ',
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '${result.toInt()} $selectedCrypto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36.0,
                      color: Colors.white,
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
