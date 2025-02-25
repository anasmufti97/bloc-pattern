// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../../Utils/utils.dart';
//
// class ApiServices {
//   /// Post Api Service
//   // static Future<String?> postMethod({required String url, Map<String, dynamic>? body}) async {
//   //   try {
//   //     final headers = {
//   //       'Content-Type': 'application/json',
//   //       if (authProvider.getToken() != null) 'Authorization': 'Bearer ${authProvider.getToken()}'
//   //     };
//   //     final request = http.Request('POST', Uri.parse(url));
//   //     if (body != null) {
//   //       request.body = json.encode(body);
//   //     }
//   //     request.headers.addAll(headers);
//   //     http.StreamedResponse response = await request.send();
//   //
//   //     final result = await response.stream.bytesToString();
//   //     if (response.statusCode == 401) {
//   //       return null;
//   //     }
//   //
//   //     if (response.statusCode == 200 || response.statusCode == 201) {
//   //       return result;
//   //     } else {
//   //       try {
//   //         final message = json.decode(result)['message'];
//   //         return null;
//   //       } on Exception catch (e) {
//   //         return null;
//   //       }
//   //     }
//   //   } on Exception catch (e) {
//   //     return null;
//   //   }
//   // }
//
//   /// GET Api Service
//   static Future<String?> getMethod(String url) async {
//     try {
//       final headers = {
//         'Content-Type': 'application/json',
//         if (authProvider.getToken() != null) 'Authorization': 'Bearer ${authProvider.getToken()}'
//       };
//       final request = http.Request('GET', Uri.parse(url));
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//
//       final result = await response.stream.bytesToString();
//       if (response.statusCode == 401) {
//         // authProvider.logoutUser();
//         return null;
//       }
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return result;
//       }
//
//       final jd=json.decode(result);
//       return null;
//     } on Exception catch (e) {
//       return null;
//     }
//   }
//
//   /// Post multipart
//
//   static Future<String?> multipartPostMethod({
//     required String url,
//     required Map<String, String> fields,
//   }) async {
//     try {
//       final headers = {
//         'Content-Type': 'application/json',
//         if (authProvider.getToken() != null) 'Authorization': 'Bearer ${authProvider.getToken()}'
//       };
//
//       final request = http.MultipartRequest('POST', Uri.parse(url));
//       request.fields.addAll(fields);
//       request.headers.addAll(headers);
//
//       http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         final result = await response.stream.bytesToString();
//         return result;
//       } else {
//         final result = await response.stream.bytesToString();
//         final message = json.decode(result)['message'];
//         return null;
//       }
//     } on Exception catch (e) {
//       // Handle exceptions
//       if (kDebugMode) print(e.toString());
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:block_pattern_flutter_app/apisHandling/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = "https://413c-182-185-158-96.ngrok-free.app";

  static Future<void> addNote(Note note) async {
    Uri requestUri = Uri.parse("$_baseUrl/addNote");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    Uri requestUri = Uri.parse("$_baseUrl/delete");
    var response = await http.post(requestUri, body: note.toMap());
    var decoded = jsonDecode(response.body);
    log(decoded.toString());
  }

  static Future<List<Note>> fetchNotes() async {
    Uri requestUri = Uri.parse("$_baseUrl/read");
    var response = await http.get(requestUri);
    var decoded = jsonDecode(response.body);

    List<Note> notes = [];
    for (var noteMap in decoded) {
      Note newNote = Note.fromMap(noteMap);
      notes.add(newNote);
    }

    return notes;
  }
}
