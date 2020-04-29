
# react-native-log-mailer

## Getting started

`$ npm install react-native-log-mailer --save`

### Mostly automatic installation

`$ react-native link react-native-log-mailer`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-log-mailer` and add `RNLogMailer.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNLogMailer.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNLogMailerPackage;` to the imports at the top of the file
  - Add `new RNLogMailerPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-log-mailer'
  	project(':react-native-log-mailer').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-log-mailer/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-log-mailer')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNLogMailer.sln` in `node_modules/react-native-log-mailer/windows/RNLogMailer.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Log.Mailer.RNLogMailer;` to the usings at the top of the file
  - Add `new RNLogMailerPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNLogMailer from 'react-native-log-mailer';

// TODO: What to do with the module?
RNLogMailer;
```
  