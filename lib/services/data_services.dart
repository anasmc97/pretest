part of "services.dart";

class DataServices {
  static Future<List<Data>> getData(String urlAPI,
      {http.Client? client}) async {
    Uri url = Uri.parse(urlAPI);

    client ??= http.Client();

    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      return [];
    }

    List data = json.decode(response.body);

    return data.map((e) => Data.fromJson(e)).toList();
  }

  static Future<Data> getSearchedData(String urlAPI, String idPost,
      {http.Client? client}) async {
    Uri url = Uri.parse(urlAPI + idPost);

    client ??= http.Client();

    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) {
      return Data();
    }

    var data = json.decode(response.body);
    Data result = Data(
        userId: data['userId'],
        id: data['id'],
        body: data['body'],
        title: data['title']);
    return result;
  }
}
