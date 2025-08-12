enum GetGeideaValues {
  geideaApiMerchantKey,
  geideaApiSecret,
  testGeideaApiMerchantKey,
  testGeideaApiSecret,
}

extension GeideaValues on GetGeideaValues {
  String get title {
    return switch (this) {
      GetGeideaValues.geideaApiMerchantKey => 'geidea_api_merchant_Key',
      GetGeideaValues.geideaApiSecret => 'geidea_api_secret',
      GetGeideaValues.testGeideaApiMerchantKey =>
        'test_geidea_api_merchant_Key',
      GetGeideaValues.testGeideaApiSecret => 'test_geidea_api_secret',
    };
  }
}
