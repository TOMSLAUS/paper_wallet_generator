import 'dart:convert';
import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'dart:io' show Platform;


main() async {
  var app = Angel();
  var http = AngelHttp(app);
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);


  app.get('/getWallet', chain([
  cors(),(req, res) {
BtcWallet wallet = new BtcWallet();
String mnemonic = bip39.generateMnemonic();
var seed = bip39.mnemonicToSeed(mnemonic);
var hdWallet = new HDWallet.fromSeed(seed);
wallet.address = hdWallet.address;
wallet.mnemonic = mnemonic;
wallet.publicKey = hdWallet.pubKey;
wallet.privateKey = hdWallet.privKey;
wallet.wif = hdWallet.wif;
res.write(jsonEncode(wallet));
  }]));

  await http.startServer( "0.0.0.0" , port);
}


class BtcWallet{
  String _address;
  String _mnemonic;
  String _privateKey;
  String _publicKey;
  String _wif;

  Map<String, dynamic> toJson() =>
      {
        'address': _address,
        'mnemonic': _mnemonic,
        'privateKey': _privateKey,
        'publicKey': _publicKey,
        'wif': _wif
      };

  set address(String value) {
    _address = value;
  }

  set wif(String value) {
    _wif = value;
  }

  set publicKey(String value) {
    _publicKey = value;
  }

  set privateKey(String value) {
    _privateKey = value;
  }

  set mnemonic(String value) {
    _mnemonic = value;
  }
}
