import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.system;
import ballerina.lang.strings;
@http:config {basePath:"/getCurrentExchangeRate"}
service<http> getCurrentExchangeRate {
    @http:POST{}
    @http:Path {value:"/"}
    resource getCurrentExchangeRate (message m) {
	string currencies = messages:getStringPayload(m);
	if (strings:length(currencies) == 6){	
		string currency1 = strings:subString(currencies , 0 , 3);
		string currency2 = strings:subString(currencies , 3 , 6);
		http:ClientConnector exchangeRateEP = create http:ClientConnector("http://apilayer.net");
		message request = {};
		message exchangeRateResponse = http:ClientConnector.post(exchangeRateEP, "/api/live?access_key=54db4acb276a5f61f13b377f1969e20b&currencies="+currency2+"&source="+currency1+"&format=1", request);
		system:println(messages:getStringPayload(exchangeRateResponse));
		message response = {};
		messages:setStringPayload(response, messages:getStringPayload(exchangeRateResponse));
		reply response;
	}
	else {
		message response = {};
		messages:setStringPayload(response, "Invalid currency codes. Eg: You need to specify in USDGBP format to get GBP rate for 1 USD");
		reply response;
	}
    }
}
