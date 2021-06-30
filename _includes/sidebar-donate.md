
{% assign strings = site.data.strings.sidebars.donate %}

### {{ strings.heading }}

{{ strings.powered_by_donations }}

{: .donate-options}
 * {:.donate-option .opencollective} [![{{ strings.opencollective_alt }}]({% asset opencollective_button.png %})](https://opencollective.com/f-droid)
 * {:.donate-option .liberapay} [![{{ strings.liberapay_alt }}]({% asset liberapay_donate_button.svg %})](https://liberapay.com/F-Droid-Data/donate)
 * {:.donate-option .more} [{{ strings.more_options }}]({{ site.baseurl }}/donate)
