import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CallAFriend/call_a_friend_page.dart';
import 'package:flutter_auth/Screens/StopWatch/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/model/bean/friend.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../constants.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'components/timer_buttons.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({
    Key key,
  }) : super(key: key);

  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

final _isHours = true;
AudioPlayer player;

class _StopWatchPageState extends State<StopWatchPage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();
  bool _canVibrate = true;
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
  ];

  @override
  void initState() {
    super.initState();
    /*_stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));*/
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));

    sendDrinkNotification();
    _stopWatchTimer.records.listen((value) => print('records $value'));
    init();


    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));
    friendList.add(new Friend("Eszter", "06203602610"));
    friendList.add(new Friend("Marci", "06203602610"));

    player = AudioPlayer();

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  init() async {
    await AudioService.connect(); // Note: the "await" is necessary!
    //AudioService.play();

    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
      _canVibrate
          ? print("This device can vibrate")
          : print("This device cannot vibrate");
    });
  }

  @override
  void dispose() async {
    super.dispose();
    player.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.green,
              width: double.infinity,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * 0.32),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: _stopWatchTimer.rawTime.value,
                      builder: (context, snap) {
                        final value = snap.data;
                        final displayTime = StopWatchTimer.getDisplayTime(value,
                            hours: _isHours);
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                displayTime,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Helvetica',
                                    color: darkGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  drawTimerButtons(context),
                  SizedBox(height: size.height * 0.1),
                  RoundedButton(
                    text: "CALL A FRIEND",
                    press: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CallAFriendPage();
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: "NEED HELP",
                    press: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SecoundPage();
                          },
                        ),
                      );*/
                    },
                  ),
                  RoundedButton(
                    text: "SETTINGS",
                    press: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SecoundPage();
                          },
                        ),
                      );*/
                    },
                  ),
                  ElevatedButton(
                    child: Text("call"),
                    onPressed: () => launch("tel://+36203602610"),
                  ),
                  /*ElevatedButton(child: Text("Stop"), onPressed: stop),
                  Container(
                    //color: Colors.red,
                    height: size.height*0.4,
                    width: size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          left: 2,
                          child: Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: new BoxDecoration(
                              color: transparentLight,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.call),
                              onPressed: null,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          //left: 60,
                          child: Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.help),
                              onPressed: null,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 2,
                          //left: 60,
                          child: Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: new BoxDecoration(
                              color: transparentLight,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.messenger_outline_outlined),
                              onPressed: (){
                                HapticFeedback.vibrate();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                    child: Text(
                      "Your only task for the next few hour to enjoy the night.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: darkGrey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "LET'S GET STARTED",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return StopWatchPage();
                          },
                        ),
                      );
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  start() =>
      AudioService.start(backgroundTaskEntrypoint: _backgroundTaskEntrypoint);

  stop() => AudioService.stop();

  Widget drawTimerButtons(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimerButton(
          icon: Icon(
            Icons.play_arrow,
            color: grey,
          ),
          press: () async {
            _stopWatchTimer.onExecute.add(StopWatchExecute.start);
          },
        ),
        SizedBox(width: size.width * 0.03),
        TimerButton(
          icon: Icon(
            Icons.pause,
            color: grey,
          ),
          press: () async {
            _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
          },
        ),
        SizedBox(width: size.width * 0.03),
        TimerButton(
          icon: Icon(
            Icons.refresh,
            color: grey,
          ),
          press: () async {
            _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
          },
        ),
      ],
    );
  }

  void sendDrinkNotification() {
    _stopWatchTimer.minuteTime.listen((value) => drinkWaterReminder(value));
  }

  drinkWaterReminder(int value) {
    if (value % 2 /*60*/ == 0 && value != 0) {
      print('minuteTime2 $value');
      sendNotification("Hi Bence!", "It's time to drink some water!");
      playSound();

      //doesn't work in the background :(
      //!_canVibrate ? null : Vibrate.vibrateWithPauses(pauses);
    }
  }

  void sendNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: '@mipmap/ic_launcher',
      //sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'item x');
  }

  Future<void> playSound() async {
    await player.setAsset('assets/sounds/first.m4a');
    player.play();
  }
}

_backgroundTaskEntrypoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  bool _finished = false;
  final _completer = Completer();

  @override
  Future<void> onStart(Map<String, dynamic> params) async {
    // Connect to the URL
    //var duration = await _audioPlayer.setFilePath('/assets/sounds/billie.mp3');

    try {
      await player.setAsset('assets/sounds/cow.mp3');
      player.play();
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      print("Error code: ${e.code}");
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web: a generic message
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      print("Connection aborted: ${e.message}");
    } catch (e) {
      // Fallback for all errors
      print(e);
    }
  }

  @override
  Future<void> onStop() async {
    // Stop playing audio
    await player.stop();
    // Shut down this background task
    await super.onStop();
  }
}
