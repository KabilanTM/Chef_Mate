import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'recipes.dart';

class CookingPage extends StatefulWidget {
  final Recipe recipe;
  final int personCount;

  const CookingPage({super.key, required this.recipe, required this.personCount});

  @override
  _CookingPageState createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  final FlutterTts flutterTts = FlutterTts(); // Updated to FlutterTts
  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player for alarm

  int _currentStep = 0;
  bool _isPaused = false;
  bool _isStepCompleted = false;
  int _timerValue = 0;
  double _progress = 1.0; // Progress indicator for the circular timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeTTS();
    _announceStep(); // Announce the first step
    _startTimer(widget.recipe.steps[_currentStep].time);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _initializeTTS() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
  }

  void _startTimer(int minutes) {
    setState(() {
      _timerValue = minutes * 60 * widget.personCount;
      _isPaused = false;
      _progress = 1.0; // Reset progress to full circle
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerValue > 0 && !_isPaused) {
        setState(() {
          _timerValue--;
          _progress = _timerValue / (minutes * 60 * widget.personCount); // Update progress
        });
      } else if (_timerValue == 0) {
        timer.cancel();
        setState(() {
          _isStepCompleted = true; // Mark step as completed when timer ends
        });
        _playAlarm();
      }
    });
  }

  void _pauseResumeTimer() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _nextStep() {
    if (_isStepCompleted) {
      if (_currentStep < widget.recipe.steps.length - 1) {
        setState(() {
          _currentStep++;
          _isStepCompleted = false; // Reset step completed flag
        });
        _announceStep(); // Announce the next step
        _startTimer(widget.recipe.steps[_currentStep].time);
      } else {
        _showCompletionScreen();
      }
    }
  }

  void _announceStep() async {
    final step = widget.recipe.steps[_currentStep];
    final scaledTime = step.time * widget.personCount;
    String message =
        "${step.description}. Estimated time for ${widget.personCount} person(s): $scaledTime minute(s).";
    await flutterTts.speak(message); // Speak the step description
  }

  Future<void> _playAlarm() async {
    await _audioPlayer.play(AssetSource('alarm.mp3'));
  }

  Future<void> _showCompletionScreen() async {
    await flutterTts.speak("You have completed the recipe. Enjoy your meal!");
    await _audioPlayer.play(AssetSource('alarm.mp3'));
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/finish.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🎉 Hooray! Cooking Complete! 🎉',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _audioPlayer.stop();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Finish'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = widget.recipe.steps[_currentStep];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Cooking ${widget.recipe.name}',
            style: const TextStyle(color: Color(0xFF229799))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/list_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentStep.description,
                style: const TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  double circleSize = constraints.maxWidth * 0.7;
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: circleSize,
                          width: circleSize,
                          child: CircularProgressIndicator(
                            value: _progress,
                            strokeWidth: 15,
                            backgroundColor: const Color.fromARGB(255, 88, 73, 73),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF48CFCB)),
                          ),
                        ),
                        Text(
                          '${(_timerValue ~/ 60).toString().padLeft(2, '0')}:${(_timerValue % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              if (_isStepCompleted)
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Step Completed! Press "Next Step" to continue.',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _pauseResumeTimer,
                    child: Text(_isPaused ? 'Resume' : 'Pause'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _isStepCompleted ? _nextStep : null,
                    child: const Text('Next Step'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
