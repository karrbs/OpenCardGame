import 'package:english_words/english_words.dart';
import 'package:ocg/models/invite_model.dart';
import 'package:ocg/utils/constants.dart';
import 'dart:math';

import 'package:ocg/extensions/string_extensions.dart';

class InviteService {
  static String generateFriendly() {
    Random random = Random();
    int next = random.nextInt(5000);
    int next1 = random.nextInt(5000);
    int next2 = random.nextInt(5000);

    List<String> nounList = nouns.take(next).toList();
    nounList.shuffle();
    String noun = nounList[nounList.length - 10];

    List<String> adjList1 = adjectives.take(next1).toList();
    adjList1.shuffle();
    String adj1 = adjList1[adjList1.length - 10];

    List<String> adjList2 = adjectives.take(next2).toList();
    adjList2.shuffle();
    String adj2 = adjList2[adjList2.length - 10];

    String friendlyCode = adj1.toCapitalized() +
        '-' +
        adj2.toCapitalized() +
        '-' +
        noun.toCapitalized();

    return friendlyCode;
  }

  static Future<Map<String, dynamic>> searchInvite(
      String friendlyCode, String password) async {
    final response = await supabase
        .from('invites')
        .select()
        .eq('friendly_code', friendlyCode)
        .execute();
    return response.toJson();
  }

  static void createInvite(String password) async {
    String friendlyCode = InviteService.generateFriendly();
    Invite newInvite = Invite(
        friendly_code: friendlyCode,
        created_on: DateTime.now(),
        expires_on: DateTime.now().add(const Duration(days: 1)));

    final response = await supabase.from('invites').insert([newInvite]);
  }
}
