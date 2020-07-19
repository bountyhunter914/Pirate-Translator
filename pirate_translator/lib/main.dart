import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(FirstRoute());

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.zero,
              color: Colors.transparent,
              width: double.infinity,
              child: Image.asset(
                'images/Fullbackone.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.zero,
              color: Colors.transparent,
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Image.asset(
                'images/ROPES.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.zero,
              color: Colors.transparent,
              height: 55,
              width: 145,
              margin: EdgeInsets.fromLTRB(160, 410, 0, 0),
              child: Image.asset(
                'images/ROPES.png',
                fit: BoxFit.cover,
              ),
            ),
            MyWidget(),
          ],
        ),
      ),
    );
  }
}

// widget class
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

// state class
// We will replace this class in each of the examples below
class _MyWidgetState extends State<MyWidget> {
  AudioPlayer advancedPlayer;
  AudioCache player = AudioCache(); //static
  final _controller = TextEditingController();
  String input = '';
  String output = '';

  void initState() {
    super.initState();
    advancedPlayer = new AudioPlayer();
    player = AudioCache(fixedPlayer: advancedPlayer);
    player.play('Pirate_Melody_Background.mp3');
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SafeArea(
                child: Container(
                  width: 360,
                  child: Image.asset(
                    'images/plankOne.png',
                    height: 150,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('images/boardwithoutROPE.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.all(50),
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  maxLength: 500,
                  maxLengthEnforced: true,
                  controller: _controller,
                  onChanged: (text) {
                    _changeOutput(text);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: _updateTranslation,
                padding: EdgeInsets.zero,
                color: Colors.transparent,
                child: Container(
                  height: 55,
                  width: 145,
                  color: Colors.transparent,
                  child: Image.asset(
                    'images/translatebutton.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateTranslation() {
    if (input.length != 0) {
      input = ' ' + input.toLowerCase() + '  ';
      List<String> end = [' , ', ' . ', ' ! ', ' ? ',];
      List<String> start = [',', '.', '!', '?',];
      input = input.replaceAll('.', ' . ');
      input = input.replaceAll(',', ' , ');
      input = input.replaceAll('!', ' ! ');
      input = input.replaceAll('?', ' ? ');
      //player.clear('Pirate_Melody_Background.mp3');
      List<String> phrase = [
        ' parents ',
        ' food ',
        ' mlh ',
        ' mlh ',
        ' major league hacking ',
        ' misha ',
        ' robbie ',
        ' the dairy dudes ',
        ' tf ',
        ' the fuck ',
        ' damn it ',
        ' guess what ',
        ' take a break ',
        ' no worries ',
        ' i don\'t believe it ',
        ' feel like ',
        ' want to ',
        ' holy shit ',
        ' holy crap ',
        ' jesus christ ',
        ' shaking my head ',
        ' smh ',
        ' are not ',
        ' aren\'t ',
        ' hello ',
        ' hi ',
        ' are ',
        ' you ',
        ' am ',
        ' ha ',
        ' put ',
        ' the ',
        ' is ',
        ' treasure ',
        ' greetings ',
        ' your ',
        ' i ',
        ' my ',
        ' lol ',
        ' lmao ',
        ' boy ',
        ' man ',
        ' male ',
        ' guy ',
        ' girl ',
        ' women ',
        ' female ',
        ' experienced ',
        ' understand ',
        ' yeah ',
        ' yes ',
        ' fine ',
        ' home ',
        ' dollar ',
        ' dollars ',
        ' money ',
        ' occasionally ',
        ' idiot ', ////
        ' actually ',
        ' have ',
        ' possibly ',
        ' wait ',
        ' min ',
        ' minute ',
        ' omw ',
        ' wanna ',
        ' for ',
        ' interesting ',
        ' intriguing ',
        ' lmk ',
        ' this ',
        ' bitch ',
        ' rat ',
        ' clumsy ',
        ' asshole ',
        ' clean ', //////////
        ' go ',
        ' died ',
        ' scam ',
        ' fraud ',
        ' cheat ',
        ' toilet ',
        ' bathroom ',
        ' intern ', //////////
        ' task ',
        ' friends ',
        'friend ',
        ' copy ', //////
        ' stuck ',
        ' week ',
        ' problem ', //////
        ' issue ',
        ' backpack ',
        ' bag ',
        ' bank ', //
        ' drunk ',
        ' darn ',
        ' here ', //////////////
        ' good ',
        ' handsome',
        ' beautiful ',
        ' app ',
        ' computer ',
        ' printer ',
        ' phone ',
        ' iphone ',
        ' android ',
        ' thx ', //
        ' bar ',
        ' ik ',
        ' luck ',
        ' would you ',
        ' drive ', //
        ' driving ',
        ' drove ',
        ' boi ',
        ' and ',
        ' because ',
        ' even',
        ' book ',
        ' child ',
        ' children ',
        ' kid ',
        ' kids ',
        ' mr ',
        ' mrs ',
        ' ms ',
        ' question ',
        ' room ',
        ' story ', //
        ' water ',
        ' a glass ',
        ' cup ',
        ' face ',
        ' company ',
        ' hey ',
      ];
      List<String> translate = [
        ' elders ',
        ' grub ',
        ' the saltiest dogs on the seven seas ',
        ' the saltiest dogs on the seven seas ',
        ' the saltiest dogs on the seven seas ',
        ' Cap\'n Blackbeard ',
        ' Ferryman Davvy Jones ',
        ' The Barbosa Brothers ',
        ' the seven seas ',
        ' the seven seas ',
        ' blimey ',
        ' yo ho ho ',
        ' rest ',
        ' no trouble ',
        ' blimey ',
        ' fancy ',
        ' fancy ',
        ' shiver me timbers ',
        ' shiver me timbers ',
        ' shiver me timbers ',
        ' blow me down ',
        ' blow me down ',
        ' ain\'t be ',
        ' ain\'t be ',
        ' ahoy ',
        ' aye ',
        ' be ',
        ' ye ',
        ' be ',
        ' ho ',
        ' poot ',
        ' th\' ',
        ' be ',
        ' booty ',
        ' yo ho ',
        ' yer ',
        ' me ',
        ' me ',
        ' ho ho ',
        ' ho ho ',
        ' lad ',
        ' lad ',
        ' lad ',
        ' lad ',
        ' lassie ',
        ' lassie ',
        ' lassie ',
        ' old ',
        ' savvy ',
        ' aye ',
        ' aye ',
        ' okay ',
        ' to land ',
        ' doubloon ',
        ' doubloons ',
        ' gold ',
        ' once in a blue moon ',
        ' half wit ',
        ' on me hook hand ',
        ' has ',
        ' maybe ',
        ' hold ',
        ' moment ',
        ' moment ',
        ' on me way ',
        ' fancy ',
        ' fer ',
        ' catching me fancy ',
        ' catching me fancy ',
        ' let me know ',
        ' tis\' ',
        ' betch ',
        ' bilge rat ',
        ' landlubber ',
        ' bilge rat ',
        ' ship shape ', ////////
        ' off ',
        ' be sleeping with the fishes ',
        ' hornswaggle ',
        ' hornswaggle ',
        ' hornswaggle ',
        ' poop deck ',
        ' poop deck ', //////
        ' swabbie ',
        ' job ',
        ' hearties ',
        ' matie ',
        ' aye aye ',
        ' caught ',
        ' seven suns ',
        ' crooked mast ',
        ' crooked mast ',
        ' duffle ',
        ' duffle ',
        ' coffer house ',
        ' three sheets to the wind ',
        ' blimey ',
        ' \'ere ', //
        ' fine ',
        ' fine ',
        ' fine ',
        ' magical thing ',
        ' magical thing ',
        ' magical thing ',
        ' magical thing ',
        ' magical thing ',
        ' magical thing ',
        ' thank ye ',
        ' tavern ',
        ' I be knowin\' that ',
        ' fortune ',
        ' WOODJA ',
        ' sail ', //
        ' sailing ',
        ' sailed ',
        ' mate ',
        '  n\' ',
        ' cause ',
        ' ev\'n ',
        ' tome ',
        ' sprog ',
        ' sprogs ',
        ' sprog ',
        ' sprog ',
        ' Cap\'n ',
        ' Cap\'n ',
        ' Cap\'n ',
        ' riddle ',
        ' cabin ', //
        ' tale ',
        ' grog ',
        ' a tankard ',
        ' tankard ',
        ' mug ',
        ' crew ',
        ' ahoy ',
      ];
      output = input;
      int change = 0;
      int x = 0;
      bool y = true;
      //Phrase Check
      while (y) {
        for (int i = 0; i < phrase.length; i++) {
          if (input.toLowerCase().contains(phrase[i])) {
            output =
                output.replaceFirstMapped(phrase[i], (match) => translate[i]);
            input = input.replaceFirstMapped(phrase[i], (match) => '   ');
            change++;
          }
        }
        if (change == 0) {
          y = false;
            change = 1;
            while (change != 0) {
              if (output.toLowerCase().contains('  ')) {
                output = output.replaceFirstMapped('  ', (match) => ' ');
                change++;
              }
              if (output.toLowerCase().contains(' , ')) {
                output = output.replaceFirstMapped(' , ', (match) => ', ');
                change++;
              }
              if (output.toLowerCase().contains(' . ')) {
                output = output.replaceFirstMapped(' . ', (match) => '. ');
                x = output.indexOf('.') + 1;
                change++;
                while (x < output.length - 1 && output[x] == ' ') {x++;}
                if (x < output.length - 1) {
                  change++;
                  output =
                      output.replaceRange(x, x + 1, output[x].toUpperCase());
                }
              }
              if (output.toLowerCase().contains(' ! ')) {
                output = output.replaceFirstMapped(' ! ', (match) => '! ');
                x = output.indexOf('!');
                change++;
                while (x < output.length - 1 && output[x] == ' ') {
                  x++;
                }
                if (x < output.length - 1) {
                  change++;
                  output =
                      output.replaceRange(x, x + 1, output[x].toUpperCase());
                }
              }
              if (output.toLowerCase().contains(' ? ')) {
                output = output.replaceFirstMapped(' ? ', (match) => '? ');
                change++;
                x = output.indexOf('?');
                while (x < output.length - 1 && output[x] == ' ') {
                  x++;
                }
                if (x < output.length - 1) {
                  change++;
                  output =
                      output.replaceRange(x, x + 1, output[x].toUpperCase());
                }
              }
              if (change == 1) {
                change = 0;
              } else {
                change = 1;
              }
            }
            output = output.replaceFirst(' ', '');
            output = output[0].toUpperCase() + output.substring(1);
          } else {
            change = 0;
          }
        }
        setState(() {
          advancedPlayer.pause();
          player.play('Pirate_Melody.mp3');
          _controller.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SecondRoute(
                      text: output,
                    )),
          );
        });
      }
    }

  void _changeOutput(String text) {
    setState(() {
      input = text;
    });
  }
}

class SecondRoute extends StatelessWidget {
  final String text;
  SecondRoute({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            width: double.infinity,
            child: Image.asset(
              'images/Fullbackone.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Image.asset(
              'images/ROPES.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            height: 55,
            width: 145,
            margin: EdgeInsets.fromLTRB(160, 410, 0, 0),
            child: Image.asset(
              'images/ROPES.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      width: 360,
                      child: Image.asset(
                        'images/plankOne.png',
                        height: 150,
                        width: 200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage('images/boardwithoutROPE.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.all(50),
                    child: SingleChildScrollView(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontFamily: 'Script',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.zero,
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 55,
                      width: 145,
                      color: Colors.transparent,
                      child: Image.asset(
                        'images/plank two.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
