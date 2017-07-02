Description
===========
This is a ballerina service which can be used to retrive latest exchange rates of currencies. 
This uses the free forex API provided by http://apilayer.net

Limitations
===========
Free API only supprts USD as the base currency.

Prerequisites
=============
1. Obtain the following parameters
    * Api Key
    * Curency codes eg: USD,GBP,LKR
2. Tested only with Ballerina v0.89. 

How to run this sample
======================
- bin$ ./ballerina run service $File_PATH/getLatestExchangeRate.bal
use curl to get the rates.
- curl -v http://localhost:9090/getCurrentExchangeRate -d "<SourceCurrencyConvertCurrency>" 

Check below examples. 

eg1: USD to LKR rate ( 1 USD = to how much LKR ) 
- curl -v http://localhost:9090/getCurrentExchangeRate -d "USDLKR"
  {
  "success":true,
  "terms":"https:\/\/currencylayer.com\/terms",
  "privacy":"https:\/\/currencylayer.com\/privacy",
  "timestamp":1498985886,
  "source":"USD",
  "quotes":{
    "USDLKR":153.449997
  }
eg2: USD to GBP rate.
- curl -v http://localhost:9090/getCurrentExchangeRate -d "USDGBP"
 {
  "success":true,
  "terms":"https:\/\/currencylayer.com\/terms",
  "privacy":"https:\/\/currencylayer.com\/privacy",
  "timestamp":1498985886,
  "source":"USD",
  "quotes":{
    "USDGBP":0.76765
  }
