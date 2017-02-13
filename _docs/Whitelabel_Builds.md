---
layout: page
title: Whitelabel Builds
redirect_from:
 - /wiki/page/Whitelabel_Builds

---

F-Droid can be rebranded and embedded in Android ROMs, building upon
F-Droid as the "white-label" version. This is a basic introduction for
how to do that. For this,
["_gradle_ flavors"](https://developer.android.com/studio/build/build-variants.html)
are used for building rebranded, configured versions of F-Droid.

Starting in *app/build.gradle*, add this:

```gradle
android {
    productFlavors {
       mycompany {
           applicationId "com.mycompany.appstore"
       }
    }
}
```

Then *gradle* will automatically look at whole set of folders for custom
versions of files:

- Java sources: _app/src/mycompany/java_
- Manifest file: _app/src/mycompany/AndroidManifest.xml_
- Android resources: _app/src/mycompany/res_
- Assets: _app/src/mycompany/assets_

There cannot be duplicate Java classes, but any extensions can be
managed there. For anything in _res/_, i.e. _strings.xml_ or drawable
resources, the files in _app/src/mycompany/res_ will take precedence
over the default F-Droid ones. For example, override the app icon by
providing _app/src/mycompany/res/drawable/ic\_launcher.xml_.

To specify a custom set of app repositories, provide
_app/src/mycompany/res/values/default\_repos.xml_. The format of that
file is a String array, with sets of 8 elements per repo. For example,
here's the Guardian Project repo config enabled by default with push
request always accepted by the client:

```xml
 <!-- name -->
 <item>Guardian Project</item>
 <!-- address -->
 <item>https://guardianproject.info/fdroid/repo</item>
 <!-- description -->
 <item>
   The official app repository of The Guardian
   Project. Applications in this repository are official
   binaries build by the original application developers and
   signed by the same key as the APKs that are released in the
   Google Play store.
 </item>
 <!-- version -->
 <item>13</item>
 <!-- enabled -->
 <item>1</item>
 <!-- priority -->
 <item>10</item>
 <!-- push requests: ignore, prompt, always -->
 <item>always</item>
 <!-- pubkey -->
 <item>
   308205d8308203c0020900a397b4da7ecda034300d06092a864886f70d01010505003081ad310b30090603550406130255533111300f06035504080c084e657720596f726b3111300f06035504070c084e657720596f726b31143012060355040b0c0b4644726f6964205265706f31193017060355040a0c10477561726469616e2050726f6a656374311d301b06035504030c14677561726469616e70726f6a6563742e696e666f3128302606092a864886f70d0109011619726f6f7440677561726469616e70726f6a6563742e696e666f301e170d3134303632363139333931385a170d3431313131303139333931385a3081ad310b30090603550406130255533111300f06035504080c084e657720596f726b3111300f06035504070c084e657720596f726b31143012060355040b0c0b4644726f6964205265706f31193017060355040a0c10477561726469616e2050726f6a656374311d301b06035504030c14677561726469616e70726f6a6563742e696e666f3128302606092a864886f70d0109011619726f6f7440677561726469616e70726f6a6563742e696e666f30820222300d06092a864886f70d01010105000382020f003082020a0282020100b3cd79121b9b883843be3c4482e320809106b0a23755f1dd3c7f46f7d315d7bb2e943486d61fc7c811b9294dcc6b5baac4340f8db2b0d5e14749e7f35e1fc211fdbc1071b38b4753db201c314811bef885bd8921ad86facd6cc3b8f74d30a0b6e2e6e576f906e9581ef23d9c03e926e06d1f033f28bd1e21cfa6a0e3ff5c9d8246cf108d82b488b9fdd55d7de7ebb6a7f64b19e0d6b2ab1380a6f9d42361770d1956701a7f80e2de568acd0bb4527324b1e0973e89595d91c8cc102d9248525ae092e2c9b69f7414f724195b81427f28b1d3d09a51acfe354387915fd9521e8c890c125fc41a12bf34d2a1b304067ab7251e0e9ef41833ce109e76963b0b256395b16b886bca21b831f1408f836146019e7908829e716e72b81006610a2af08301de5d067c9e114a1e5759db8a6be6a3cc2806bcfe6fafd41b5bc9ddddb3dc33d6f605b1ca7d8a9e0ecdd6390d38906649e68a90a717bea80fa220170eea0c86fc78a7e10dac7b74b8e62045a3ecca54e035281fdc9fe5920a855fde3c0be522e3aef0c087524f13d973dff3768158b01a5800a060c06b451ec98d627dd052eda804d0556f60dbc490d94e6e9dea62ffcafb5beffbd9fc38fb2f0d7050004fe56b4dda0a27bc47554e1e0a7d764e17622e71f83a475db286bc7862deee1327e2028955d978272ea76bf0b88e70a18621aba59ff0c5993ef5f0e5d6b6b98e68b70203010001300d06092a864886f70d0101050500038202010079c79c8ef408a20d243d8bd8249fb9a48350dc19663b5e0fce67a8dbcb7de296c5ae7bbf72e98a2020fb78f2db29b54b0e24b181aa1c1d333cc0303685d6120b03216a913f96b96eb838f9bff125306ae3120af838c9fc07ebb5100125436bd24ec6d994d0bff5d065221871f8410daf536766757239bf594e61c5432c9817281b985263bada8381292e543a49814061ae11c92a316e7dc100327b59e3da90302c5ada68c6a50201bda1fcce800b53f381059665dbabeeb0b50eb22b2d7d2d9b0aa7488ca70e67ac6c518adb8e78454a466501e89d81a45bf1ebc350896f2c3ae4b6679ecfbf9d32960d4f5b493125c7876ef36158562371193f600bc511000a67bdb7c664d018f99d9e589868d103d7e0994f166b2ba18ff7e67d8c4da749e44dfae1d930ae5397083a51675c409049dfb626a96246c0015ca696e94ebb767a20147834bf78b07fece3f0872b057c1c519ff882501995237d8206b0b3832f78753ebd8dcbd1d3d9f5ba733538113af6b407d960ec4353c50eb38ab29888238da843cd404ed8f4952f59e4bbc0035fc77a54846a9d419179c46af1b4a3b7fc98e4d312aaa29b9b7d79e739703dc0fa41c7280d5587709277ffa11c3620f5fba985b82c238ba19b17ebd027af9424be0941719919f620dd3bb3c3f11638363708aa11f858e153cf3a69bce69978b90e4a273836100aa1e617ba455cd00426847f
 </item>
```

### Customizations

When using gradle build flavors, it is very easy to customize any of
the XML files. So this is the recommended way to start with
customizing your build of F-Droid. Any XML file in _app/src/main/res_
can be overridden by placing an XML with the same name in
_app/src/mycompany/res_. Here are some examples


#### Removing ActionBar/Menu Items

To hide things like "Swap Apps" or "Repositories", override
_app/src/main/res/menu/main.xml_ by copying it into
_app/src/mycompany/res/menu/main.xml_, and removing and/or customizing
the items there.


#### Preferences

For a custom build that enables Automatic Updates by default, override
_app/src/main/res/xml/preferences.xml_. You can customize the
preferences and their default values in
_app/src/mycompany/res/xml/preferences.xml_. The fully automatic
update requires system/root access. With regular access, the updates
will only automatically download. The user still needs to click
install on each one.
