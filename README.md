# Flutter course, assignment 1


__Chuck Norris jokes__

## Table content
- [Description](#description)
- [Images](#Images)
- [Library](#Library)
- [Code](#Code)
- [APK](#APK)

## Description
The Flutter application that displays the image of Chunk Norris and his jokes is this one. The app based on tinder application idea where you can swipe to left if like and to right if it's not interesting, also in bottom align two buttons like and dislike.


## Images
|                    Scrolling jokes                     |                        page                        |                       dialog                     |
|:------------------------------------------------------:|:--------------------------------------------------------:|:----------------------------------------------------------------:|
| <img src="https://ibb.co/k8d9XKt" alt="Scrolling"> | <img src="https://ibb.co/jHY9rhD" alt="page"> | <img src="https://ibb.co/p0wqvDr" alt="dailog"> |


<!-- ![](https://ibb.co/k8d9XKt) ![](https://ibb.co/jHY9rhD) ![](https://ibb.co/p0wqvDr)-->



## Library
- [http](https://pub.dev/packages/http) - This library used to fetch quotes from this [site](https://api.chucknorris.io/)

## Code
___Fetching data with http lib with this function___
```
Future<JokeClass> getJoke() async {
  var response = await http.get(Uri.https('api.chucknorris.io', '/jokes/random'));
  if (response.statusCode != 200) throw Exception("SOMETHING WENT WRONG");
  return JokeClass.fromJson(jsonDecode(response.body));
}
```

Json main arguments:
```
var icon_url = "";
var id = "";
var url = "";
var value = "";
```

## APK

[release-apk](/apk-release.apk)