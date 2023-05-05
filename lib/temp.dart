// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<void> makeRequest() async {
//   var apiKey = "448f21b7-5674-475b-a4bf-1f487fc1234d";
//   var url = "https://api.oneai.com/api/v0/pipeline";

//   var headers = {
//     "api-key": apiKey,
//     "content-type": "application/json"
//   };

//   var payload = {
//     "input": "I have soar throat. what should i do?",
//     "input_type": "article",
//     "output_type": "json",
//     "multilingual": {"enabled": true},
//     "steps": [{"skill": "gpt"}]
//   };

//   final response = await http.post(Uri.parse(url),
//       headers: headers, body: json.encode(payload));

//   if (response.statusCode == 200) {
//     var data = json.decode(response.body);
//     print(data);
//     print(data['output'][0]['contents'][0]['utterance']);
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }
