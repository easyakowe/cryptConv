import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'exchange.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  Color baseColor = Color(0xFFF2F2F2);

  bool showSpinner = false;

  ExchangeModel model = ExchangeModel();

  int btcAmount;
  int ethAmount;
  int ltcAmount;
  int xrpAmount;
  int bchAmount;
  int eosAmount;

  void initState(){
    super.initState();

  }

  void updateUI (List exchangeRate){
    setState(() {
      if (exchangeRate == null){
        btcAmount = 0;
        ethAmount = 0;
        ltcAmount = 0;
        xrpAmount = 0;
        bchAmount = 0;
        eosAmount = 0;
        return;
      }
      double bAmt = exchangeRate[0]['rate'];
      btcAmount = bAmt.toInt();

      double eAmt = exchangeRate[1]['rate'];
      ethAmount = eAmt.toInt();

      double lAmt = exchangeRate[2]['rate'];
      ltcAmount = lAmt.toInt();

      double xAmt = exchangeRate[3]['rate'];
      xrpAmount = xAmt.toInt();

      double bcAmt = exchangeRate[4]['rate'];
      bchAmount = bcAmt.toInt();

      double eoAmt = exchangeRate[5]['rate'];
      eosAmount = eoAmt.toInt();
    });
  }


  String selectedCurrency = 'USD';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F2F2),
        title: Text('CryptConv', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 3.0, color: Color(0xFFff8f00)),),
        actions: [
          IconButton(
              icon: Icon(Icons.home, color: Colors.black87),
              onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.info, color: Colors.black87,),
            onPressed: (){},
          ),
        ],
      ),
      body: ProgressHUD(
        child: Builder(
        builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: Text('Today\'s Crypto Exchange Rate ', style: TextStyle(fontSize: 12.0, color: Colors.black87, fontWeight: FontWeight.bold),),
            ),
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/gold_pot.png'),
                height: 60.0,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Ethereum', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 14.0),),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$ethAmount $selectedCurrency', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
                                      textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              color: baseColor,
                              height: 140,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Bitcoin', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 14.0),),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$btcAmount $selectedCurrency',
                                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
                                    textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              color: baseColor,
                              height: 140,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Litecoin', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 14.0),),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$ltcAmount $selectedCurrency', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
                                      textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              color: baseColor,
                              height: 140,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Ripple', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 14.0),),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$xrpAmount $selectedCurrency', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
                                      textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              color: baseColor,
                              height: 140,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Bitcoin Cash', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 14.0),),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$bchAmount $selectedCurrency', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
                                      textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              color: baseColor,
                              height: 140,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClayContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('EOS', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 14.0),),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('$eosAmount $selectedCurrency',
                                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20.0),
                                    textAlign: TextAlign.center,),
                                  ),
                                ],
                              ),
                              color: baseColor,
                              height: 140,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0, top: 50.0),
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Color(0xFFff8f00),),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: DropdownButton(
                              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3.0, fontSize: 16.0, color: Color(0xFFff8f00),),
                              value: selectedCurrency,
                              items: getCurrencyList(),
                              onChanged: (value) {

                                final progress = ProgressHUD.of(context);
                                progress.showWithText('Loading...');
                                Future.delayed(Duration(seconds: 1), ()
                                {
                                  progress.dismiss();

                                  setState(() async {
                                    selectedCurrency = value;
                                    showSpinner = false;

                                    var exchangeRate = await computeExchange();
                                    updateUI(exchangeRate);
                                  });
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // DropDownMenu container plus styling

          ],
        ),
      ),
    ),
      ),
    );
  }
  Future <dynamic> computeExchange() async {
    List<dynamic> amounts = [];
    for (String crypto in cryptoList){
      var exchangeRate = await model.getExchangeRate(crypto, selectedCurrency);
      amounts.add(exchangeRate);
    }
    return amounts;
  }

}


