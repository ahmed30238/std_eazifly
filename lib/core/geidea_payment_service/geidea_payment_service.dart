import 'package:flutter/rendering.dart';
import 'package:geideapay/geideapay.dart';

final plugin = GeideapayPlugin();

class GeideaService {
  Address billingAddress = Address(
    city: "Riyadh",
    countryCode: "SAU",
    street: "Street 1",
    postCode: "1000",
  );
  Address shippingAddress = Address(
    city: "Riyadh",
    countryCode: "SAU",
    street: "Street 1",
    postCode: "1000",
  );

  CheckoutOptions checkoutOptions = CheckoutOptions(
    123.45,
    "EGP",
    callbackUrl: "https://website.hook/", //Optional
    returnUrl: "https://returnurl.com",
    lang: "AR", //Optional
    // billingAddress: billingAddress, //Optional
    // shippingAddress: shippingAddress, //Optional
    customerEmail: "email@noreply.test", //Optional
    merchantReferenceID: "1234", //Optional
    paymentIntentId: null, //Optional
    paymentOperation: "Pay", //Optional
    showAddress: true, //Optional
    showEmail: true, //Optional
    textColor: const Color(0xFFffffff), //Optional
    cardColor: const Color(0xFFff4d00), //Optional
    payButtonColor: const Color(0xFFff4d00), //Optional
    cancelButtonColor: const Color(0xFF878787), //Optional
    backgroundColor: const Color(0xFF2c2222), //Optional
  );
}
