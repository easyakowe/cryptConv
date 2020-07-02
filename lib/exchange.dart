import 'networking.dart';

const apiKey = 'BA1474AA-4BD7-451D-8BE4-9338B57CF27E';
const coinApiURL = 'https://rest-sandbox.coinapi.io/v1/exchangerate/';

//Ripple (XRP)
// Bitcoin Cash (BCH)
// EOS (EOS)

class ExchangeModel {

  Future <dynamic> getExchangeRate(String baseCurrency,
      String quoteCurrency) async {
    NetworkHelper helper = NetworkHelper(
        '$coinApiURL$baseCurrency/$quoteCurrency?apikey=$apiKey');
    var exchangeRate = await helper.getData();

    return exchangeRate;
  }
}