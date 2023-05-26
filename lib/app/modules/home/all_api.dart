import 'dart:convert';
import 'package:flutter_wallpaper/app/model/wallpaper_model.dart';
import 'package:http/http.dart'as http;


Future<WallpaperResponse?> fetchAllWallpaperData() async{
  try{
    http.Response response = await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers:{
          "Authorization": "sGf171nJYHlH2EEJCxy9yI782FNppiKA9CfBo1fgdwSap5xhKxrfmEYy",
        }
    );
    if(response.statusCode == 200){
      Map<String,dynamic> data = jsonDecode(response.body);
      WallpaperResponse s1 = WallpaperResponse.fromJson(data);
      print("==========AllWallpaper Data==========${response.body}");
      return s1;
    }
  } catch(e,s){
    print(e.toString());
    print(s.toString());
  }
  return null;
}

Future<WallpaperResponse?> fetchNatureData() async{
  try{
    http.Response response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=nature'),
        headers:{
          "Authorization": "sGf171nJYHlH2EEJCxy9yI782FNppiKA9CfBo1fgdwSap5xhKxrfmEYy",
        }
    );
    if(response.statusCode == 200){Map<String,dynamic> data = jsonDecode(response.body);
    WallpaperResponse s1 = WallpaperResponse.fromJson(data);
    print("==========Nature Data==========${response.body}");
    // log("======*************======${s1.totalResults}");
    return s1;
    }
  } catch(e,s){
    print(e.toString());
    print(s.toString());
  }
  return null;
}

Future<WallpaperResponse?> fetchArchitectureData() async{
  try{
    http.Response response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=architecture'),
        headers:{
          "Authorization": "sGf171nJYHlH2EEJCxy9yI782FNppiKA9CfBo1fgdwSap5xhKxrfmEYy",
        }
    );
    if(response.statusCode == 200){Map<String,dynamic> data = jsonDecode(response.body);
    WallpaperResponse s1 = WallpaperResponse.fromJson(data);
    print("==========Architecture Data==========${response.body}");
    // log("======*************======${s1.totalResults}");
    return s1;
    }
  } catch(e,s){
    print(e.toString());
    print(s.toString());
  }
  return null;
}

Future<WallpaperResponse?> fetchSunsetsData() async{
  try{
    http.Response response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=Sunsets'),
        headers:{
          "Authorization": "sGf171nJYHlH2EEJCxy9yI782FNppiKA9CfBo1fgdwSap5xhKxrfmEYy",
        }
    );
    if(response.statusCode == 200){Map<String,dynamic> data = jsonDecode(response.body);
    WallpaperResponse s1 = WallpaperResponse.fromJson(data);
    print("==========Sunsets Data==========${response.body}");
    // log("======*************======${s1.totalResults}");
    return s1;
    }
  } catch(e,s){
    print(e.toString());
    print(s.toString());
  }
  return null;
}

Future<WallpaperResponse?> fetchMountainsData() async{
  try{
    http.Response response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=mountains'),
        headers:{
          "Authorization": "sGf171nJYHlH2EEJCxy9yI782FNppiKA9CfBo1fgdwSap5xhKxrfmEYy",
        }
    );
    if(response.statusCode == 200){Map<String,dynamic> data = jsonDecode(response.body);
    WallpaperResponse s1 = WallpaperResponse.fromJson(data);
    print("==========Mountains Data==========${response.body}");
    // log("======*************======${s1.totalResults}");
    return s1;
    }
  } catch(e,s){
    print(e.toString());
    print(s.toString());
  }
  return null;
}