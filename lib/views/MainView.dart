import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:paperwallet_generator/code/Bitcoin-Wallet.dart';
import 'package:paperwallet_generator/code/HeaderClipper.dart';
import 'package:paperwallet_generator/code/PdfGenerator.dart';
import 'package:paperwallet_generator/reusables/Expandable.dart';
import 'package:paperwallet_generator/reusables/copyableTextField.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MainView extends StatefulWidget {
  static const id = "MainView";

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  double _height, _width, _swiperWidth = 0, _swiperHeight = 0;
  BitcoinWallet _btcWallet;
  int _card = 0;
  double _animatedControllerHeight = 0;
  int _cardCount = 2;
  String _github = "https://github.com/TOMSLAUS";

  @override
  void initState() {
    _btcWallet = new BitcoinWallet();
    super.initState();
  }

  Future<void> generateWalletAndShowContainer() async {
    _animatedControllerHeight = _height * 0.25;
    var url = Uri.https('btcbackend.herokuapp.com', '/getWallet');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      setState(() {
        _btcWallet.adress = jsonResponse['address'];
        _btcWallet.mnemonic = jsonResponse['mnemonic'];
        _btcWallet.wif = jsonResponse['wif'];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void _launchURL() async => await canLaunch(_github)
      ? await launch(_github)
      : throw 'Could not launch $_github';

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: _height * 0.90,
                        width: _width,
                        color: Settings.primary,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(0, _height * 0.12, 0, 0),
                            child: Container(
                              height: _height * 0.5,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/example$_card.png",
                                    height: _height * 0.4,
                                    width: _width * 0.7,
                                  ),
                                  /* Positioned(
                                    top: _height * 0.4 * 0.2,
                                    left: (_width * 0.7) * 0.45,
                                    child: QrImage(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.white10,
                                      data: "1234567890",
                                      version: QrVersions.auto,
                                      size: _height * 0.90 * 0.13,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: _height * 0.01,
                                    right: _width * 0.01,
                                    child: QrImage(
                                      backgroundColor: Colors.white,
                                      data: "1234567890",
                                      version: QrVersions.auto,
                                      size: _height * 0.2,
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        )),
                    ClipPath(
                      child: Container(
                        height: _height * 0.10,
                        width: _width,
                        color: Settings.generateButtonColor,
                      ),
                      clipper: HeaderClipper(),
                    ),
                  ],
                ),
                AnimatedContainer(
                  color: Settings.secondary,
                  width: _width,
                  height: _width > 900
                      ? _animatedControllerHeight
                      : _animatedControllerHeight * 2.3,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height * 0.1,
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (_width > 900) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CopyableTextField("Seed phrase",
                                        _btcWallet.mnemonic, 10),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: CopyableTextField(
                                        "Address", _btcWallet.adress, 10),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: CopyableTextField(
                                        "Wallet import format",
                                        _btcWallet.wif,
                                        10),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            );
                          } else
                            return Container(
                              width: _width * 0.8,
                              child: Column(
                                children: [
                                  CopyableTextField(
                                      "Seed phrase", _btcWallet.mnemonic, 10),
                                  CopyableTextField(
                                      "Address", _btcWallet.adress, 10),
                                  CopyableTextField("Wallet import format",
                                      _btcWallet.wif, 10),
                                ],
                              ),
                            );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  //height: _height < 400 ?_height * 1.5 : _height * 2,
                  width: _width,
                  color: Settings.secondary,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        AutoSizeText(
                          "Our part in the future",
                          style: Settings.titleStyle,
                          maxFontSize: 35,
                          minFontSize: 5,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              _width * 0.03, 0, _width * 0.03, 0),
                          child: AutoSizeText(
                            "We believe that bitcoin is the future and the future of presents we give our loved ones.  Cash in birthday cards are going to be obsolete in few years, so we created this great platform where you can created BTC paper wallets with all kinds of cool designs that fit your friends character.",
                            style: Settings.textStyle,
                            maxFontSize: 25,
                            minFontSize: 5,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Expandable(
                          width: _width * 0.75,
                          title: "What is bitcoin paper wallet?",
                          text:
                              "A paper wallet is an offline mechanism for storing bitcoins. ... However, they still do not store physical bitcoins; the paper quality of these wallets refers primarily to the method of access for the cryptocurrency owner.",
                        ),
                        Expandable(
                          width: _width * 0.75,
                          title: "why bitcoin paper wallet?",
                          text:
                              "A paper wallet is considered an extremely secure way to keep bitcoins safe from cyber-attacks, malware, etc. But it's important to remember that it's not the bitcoins that are being printed out like regular currency. It's the information stored in a bitcoin wallet or digital wallet that gets printed out.",
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    AutoSizeText(
                                      "Donate bitcoin ",
                                      style: Settings.textStyle,
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        width: 150,
                                        child: CopyableTextField(
                                            "",
                                            "1HgL186FAEoMMx7VYxhAQKcoZCoa6bhDDu",
                                            0))
                                  ],
                                ),
                                SizedBox(width: 20),
                                QrImage(
                                  data: "1HgL186FAEoMMx7VYxhAQKcoZCoa6bhDDu",
                                  size: 100,
                                  foregroundColor: Settings.generateButtonColor,
                                ),

                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Settings.generateButtonColor,
                              ),
                              onPressed: _launchURL,
                              child: Text('Repo link'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: _height * 0.57,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (_width < 750) {
                    _swiperWidth = _width * 0.9;
                    _swiperHeight = _height * 0.2;
                  } else if (_width < 1050) {
                    _swiperWidth = _width * 0.45;
                    _swiperHeight = _height * 0.2;
                  } else {
                    _swiperWidth = _width * 0.4;
                    _swiperHeight = _height * 0.25;
                  }
                  return Container(
                    width: _swiperWidth,
                    height: _swiperHeight,
                    child: Swiper(
                      loop: false,
                      pagination:
                          new SwiperPagination(margin: new EdgeInsets.all(2.0)),
                      itemCount: _cardCount,
                      viewportFraction: 0.5,
                      scale: 0.5,
                      onIndexChanged: (index) {
                        setState(() {
                          _card = index;
                        });
                      },
                      onTap: (index) {
                        setState(() {
                          _card = index;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.asset(
                          "assets/images/sample$index.jpg",
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: _height * 0.85,
              //width: _width / 5,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Settings.generateButtonColor),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onPressed: () async {
                  await generateWalletAndShowContainer();
                  PdfGenerator.generate(_card, _btcWallet);
                },
                child: Container(
                  height: _height / 10,
                  width: _width / 3,
                  child: Center(
                    child: AutoSizeText(
                      "Generate new Paper wallet",
                      style: Settings.generateButtonStyle,
                      maxFontSize: 25,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
