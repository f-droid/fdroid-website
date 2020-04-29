
{% assign strings = site.data.strings.sidebars.donate %}

### {{ strings.heading }}

{{ strings.powered_by_donations }}

{: .donate-options}
 * {:.donate-option .opencollective} [![{{ strings.opencollective_alt }}]({% assets %}/opencollective_button.png)](https://opencollective.com/f-droid)
 * {:.donate-option .liberapayID} [![{{ strings.liberapay_alt }}]({% assets %}/liberapay_donate_button.svg)](https://liberapay.com/F-Droid-Data/donate)
 * {:.donate-option .bitcoin-blockchain-info} [![{{ strings.bitcoin_alt }}]({% assets %}/bitcoin.png)](https://blockchain.info/address/15u8aAPK4jJ5N8wpWJ5gutAyyeHtKX5i18)
 * {:.donate-option .bitcoin-url} [`15u8aAPK4jJ5N8wpWJ5gutAyyeHtKX5i18`](bitcoin:15u8aAPK4jJ5N8wpWJ5gutAyyeHtKX5i18)
 * {:.donate-option .bank-transfer} {{ strings.via_bank_transfer }}
   * {{ strings.bank_transfer_name }}: F-Droid Limited
   * IBAN: GB92 BARC 2056 7893 4088 92
   * SWIFT: BARCGB22
 * {:.donate-option .hellotux} {{ strings.hellotux }}
   * [![{{ strings.hellotux_alt }}]({% assets %}/hellotux_banner.jpg)](https://www.hellotux.com/f-droid)
   * {{ strings.hellotux_donation }}
 * {:.donate-option .more} [More Options]({{ site.baseurl }}/donate)
