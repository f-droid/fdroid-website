---
layout: post
title: Adding React Native Apps to F-Droid
author: "tasn"
---

[React Native](https://reactnative.dev/) is a popular open-source app development framework that makes it easy to build cross-platform applications using the platform's native UI components. This makes it an ideal choice for developers building apps for all platforms.

That's why we chose it when we started working on the new [EteSync Notes](https://github.com/etesync/etesync-notes/) app. It enabled us to build an app in a very short time reusing 100% of the code on Android, iOS, the web, and once we release the desktop clients, the desktop too.

Being an open-source project ourselves, and long-time (very happy) users of F-Droid, one of our main concerns before building the app was: can react-native applications be built on F-Droid? Looking online we couldn't find a clear answer. We then looked at the [fdroiddata repository](https://gitlab.com/fdroid/fdroiddata/) we saw some mentions of react-native, which led us to react native apps that are available on 
F-Droid. So we know it can be done, we were just missing the how.

The rest of this post assumes you are familiar with the F-Droid metadata files and [how to build normal Android applications](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md).

There are a few main challenges with building React Native applications on F-Droid:

1. React Native apps have two build and dependency management systems (the React Native one, and the Android one).
2. React Native apps require a more recent NodeJS environment than is available on F-Droid.
3. React Native apps have pre-built dependencies that are shipped using the JavaScript dependency management systems, and we need to tell F-Droid these components are actually FLOSS and compatible with F-Droid.

Before we go on with explaining the important components and how they play together, here is the [working EteSync Notes spec file](https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/com.etesync.notes.yml) for your reference.

The first thing you need to take care of is the `subdir` directive. React Native applications have their android build system in a subdirectory of the repo rather than the root. It's usually `android/app`, but it may be different in your setup.

The next thing we need, which may not be required in your case, is to get a recent enough version of `node` and `yarn`. F-Droid uses Debian Stretch for the build system, which didn't even have a recent enough `node` version in backports. So the easiest way to get node was using a pre-built binary, and verify its checksum, and then installing `yarn` using `npm`. This is how it looks like:

```yaml
    sudo:
      - curl -Lo node.tar.xz https://nodejs.org/dist/v10.18.1/node-v10.18.1-linux-x64.tar.xz
      - echo "8cc40f45c2c62529b15e83a6bbe0ac1febf57af3c5720df68067c96c0fddbbdf node.tar.xz"
        | sha256sum -c -
      - tar xJf node.tar.xz
      - cp -a node-v10.18.1-linux-x64/. /usr/local/
      - npm -g install yarn
```

The next step is to install all of the JavaScript dependencies, this can be done using the `init` directive, like so: `init: yarn install`.

Now we should have everything we need to get our React Native app to build, though the builds will still fail. The reason for that is that F-Droid automatically detects potentially non-free dependencies in the build, and won't let the build continue if found. Therefore, the next thing we should do is to tell it to automatically get rid of all of the non-free dependencies pulled by our JavaScript deps, like so:

```yaml
    scandelete:
      - node_modules/
```

Now we are making progress, and all of the potentially non-free dependencies are being removed. Though the build will still fail because some of these dependencies were actually needed!
Now, the responsibility is on us to find and make sure the deps that we require and that are indeed FLOSS and F-Droid compatible. The most common error is about an "unrecognized maven repository" pointing to `../node_modules/...`. Assuming all of your JavaScript dependencies are indeed FLOSS, these can be safely ignored, as they just mean that the deps come from a JavaScript dependency instead of through Maven (again, very common). We will deal with these in a moment.
The second, more serious issue is about `.jar`, `.aar` and `.so` files being removed. Here you need to take extra care to make sure that these files are indeed FLOSS, come from a trusted source, and are just pre-compiled for ease of distribution. Once you found all of the occurrences of the two issues above, you can tell F-Droid to ignore them. For example, this is what we have in EteSync Notes:

```yaml
    scanignore:
      - android/build.gradle
      - node_modules/jsc-android
      - node_modules/react-native/android/com/facebook/react/react-native/*/
      - node_modules/react-native-appearance/android/build.gradle
      - node_modules/react-native-reanimated/android/build.gradle
      - node_modules/react-native-safe-area-context/android/build.gradle
      - node_modules/react-native-screens/android/build.gradle
      - node_modules/react-native-sodium/libsodium/*/lib/libsodium.so
      - node_modules/react-native-vector-icons/android/build.gradle
      - node_modules/@react-native-community/async-storage/android/build.gradle
      - node_modules/@react-native-community/masked-view/android/build.gradle
      - node_modules/@react-native-community/netinfo/android/build.gradle
```

The first three lines are required by all React Native applications. They are just the main React Native deps, which are indeed FLOSS. The rest should be added depending on your own dependencies as outlined above. Please note that some [Expo](https://expo.io/) modules depend on non-free components, so they may be incompatible with F-Droid.

This is it, your app should now build for F-Droid. Just make sure to go through the [contribution guidelines](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md) to make sure everything is in order.


## Closing notes

As you can see, it's quite easy to build React Native applications on F-Droid once you know how. However, there are a few improvements that could go into F-Droid that would make the process easier. It would be great if the F-Droid build machines will include an up-to-date Node, and potentially maybe a directive to include some of the above steps automatically.

The above is everything we needed to do in order to get [EteSync Notes](https://github.com/etesync/etesync-notes/) to correctly build on F-Droid. We, at EteSync, are trying to make it easier to build FLOSS, end-to-end encrypted, and privacy respecting applications, which is why we recently released [Etebase](https://www.etebase.com/). If you share our passion of protecting user freedoms and privacy, please come and [join our community](https://www.etebase.com/about/#contact).
