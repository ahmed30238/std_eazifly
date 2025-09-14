// import 'dart:async';
// import 'dart:io';
//
// import 'package:just_audio/just_audio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';
//
// class AudioService {
//   static final AudioService _instance = AudioService._internal();
//
//   factory AudioService() => _instance;
//
//   AudioService._internal();
//
//   late AudioRecorder _audioRecord;
//   late AudioPlayer _audioPlayer;
//
//   bool _isRecording = false;
//   bool _isPlaying = false;
//   String _recordPath = "";
//
//   final StreamController<bool> _recordingStateController =
//       StreamController<bool>.broadcast();
//   final StreamController<bool> _playingStateController =
//       StreamController<bool>.broadcast();
//
//   bool get isRecording => _isRecording;
//
//   bool get isPlaying => _isPlaying;
//
//   String get currentRecordPath => _recordPath;
//
//   Stream<bool> get recordingStateStream => _recordingStateController.stream;
//
//   Stream<bool> get playingStateStream => _playingStateController.stream;
//
//   // initializeRecordVars() {
//   //   audioPlayer = AudioPlayer();
//   //   audioRecord = AudioRecorder();
//   //
//   //   // Listen to player state changes
//   //   audioPlayer.playerStateStream.listen((PlayerState state) {
//   //     if (state.processingState == ProcessingState.completed) {
//   //       isPlaying = false;
//   //     }
//   //   });
//   // }
//   Future<void> initialize() async {
//     _audioPlayer = AudioPlayer();
//     _audioRecord = AudioRecorder();
//
//     _audioPlayer.playerStateStream.listen((PlayerState state) {
//       _isPlaying = state.playing;
//       _playingStateController.add(_isPlaying);
//
//       if (state.processingState == ProcessingState.completed) {
//         _isPlaying = false;
//         _playingStateController.add(false);
//       }
//     });
//   }
//
//   Future<String> _getRecordPath() async {
//     final directory = await getApplicationDocumentsDirectory();
//     return '${directory.path}/recording.wav';
//   }
//
//   // Future<String> getRecordPath() async {
//   //   final directory = await getApplicationDocumentsDirectory();
//   //   return '${directory.path}/recording.wav';
//   // }
//
//   Future<bool> startRecording() async {
//     try {
//       _recordPath = await _getRecordPath();
//
//       if (await _audioRecord.hasPermission()) {
//         await _audioRecord.start(
//           const RecordConfig(
//             encoder: AudioEncoder.wav,
//             androidConfig: AndroidRecordConfig(
//               audioSource: AndroidAudioSource.mic,
//             ),
//           ),
//           path: _recordPath,
//         );
//         _isRecording = true;
//         _recordingStateController.add(true);
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print('Error starting recording: $e');
//       return false;
//     }
//   }
//
//   // Future<void> startRecording() async {
//   //   recordPath = await getRecordPath();
//   //
//   //   if (await audioRecord.hasPermission()) {
//   //     await audioRecord.start(
//   //       const RecordConfig(
//   //         encoder: AudioEncoder.wav,
//   //         androidConfig: AndroidRecordConfig(
//   //           audioSource: AndroidAudioSource.mic,
//   //         ),
//   //       ),
//   //       path: recordPath,
//   //     );
//   //     isRecording = true;
//   //     emit(StartRecordState());
//   //   }
//   // }
//
//   Future<String?> stopRecording() async {
//     try {
//       String? path = await _audioRecord.stop();
//       _isRecording = false;
//       _recordingStateController.add(false);
//
//       if (path != null) {
//         _recordPath = path;
//       }
//       return path;
//     } catch (e) {
//       print('Error stopping recording: $e');
//       return null;
//     }
//   }
//
//   // Future<void> stopRecording() async {
//   //   String? path = await audioRecord.stop();
//   //   isRecording = false;
//   //   if (path != null) {
//   //     recordPath = path;
//   //   }
//   //   emit(StopRecordState());
//   // }
//
//   Future<bool> playAudio([String? audioPath]) async {
//     try {
//       final pathToPlay = audioPath ?? _recordPath;
//
//       if (pathToPlay.isNotEmpty && File(pathToPlay).existsSync()) {
//         await _audioPlayer.setFilePath(pathToPlay);
//         await _audioPlayer.play();
//         _isPlaying = true;
//         _playingStateController.add(true);
//         return true;
//       } else {
//         print('Audio file not found');
//         return false;
//       }
//     } catch (e) {
//       print('Error playing audio: $e');
//       return false;
//     }
//   }
//
//   // Future<void> playAudio() async {
//   //   if (recordPath.isNotEmpty && File(recordPath).existsSync()) {
//   //     try {
//   //       await audioPlayer.setFilePath(recordPath);
//   //       await audioPlayer.play();
//   //       isPlaying = true;
//   //       emit(PlayRecordState());
//   //     } catch (e) {
//   //       print('Error playing audio: $e');
//   //       isPlaying = false;
//   //     }
//   //   } else {
//   //     isPlaying = false;
//   //     print('No recording found to play');
//   //   }
//   // }
//   //
//   // Future<void> stopAudio() async {
//   //   if (isPlaying) {
//   //     await audioPlayer.pause();
//   //     isPlaying = false;
//   //     emit(StopPlayingRecordState());
//   //   }
//   // }
//
//   Future<void> pauseAudio() async {
//     try {
//       await _audioPlayer.pause();
//       _isPlaying = false;
//       _playingStateController.add(false);
//     } catch (e) {
//       print('Error pausing audio: $e');
//     }
//   }
//
//   Future<void> stopAudio() async {
//     try {
//       await _audioPlayer.stop();
//       _isPlaying = false;
//       _playingStateController.add(false);
//     } catch (e) {
//       print('Error stopping audio: $e');
//     }
//   }
//
//   void dispose() {
//     _audioPlayer.dispose();
//     _audioRecord.dispose();
//     _recordingStateController.close();
//     _playingStateController.close();
//   }
//
//   // Clear recording method مُحسنة
//   void clearRecording() {
//     // Stop any current playback
//     if (_isPlaying) {
//       stopAudio();
//     }
//
//     // Clear the record path
//     _recordPath = "";
//
//     // إشعار الـ streams بالتغيير
//     _playingStateController.add(false);
//
//     print('Recording cleared: $_recordPath'); // للتأكد من إن الدالة اتنفذت
//   }
// }
