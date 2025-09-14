// import 'dart:async';
// import 'dart:developer';
// import 'package:eazifly_student/presentation/controller/audio_controller/states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/audio_service.dart';
//
// class SimpleAudioCubit extends Cubit<AudioState> {
//   final AudioService _audioService = AudioService();
//   late StreamSubscription _recordingSubscription;
//   late StreamSubscription _playingSubscription;
//
//   SimpleAudioCubit() : super(AudioInitial()) {
//     _initializeService();
//   }
//
//   Future<void> _initializeService() async {
//     await _audioService.initialize();
//     _recordingSubscription = _audioService.recordingStateStream.listen((
//         isRecording,
//         ) {
//       if (isRecording) {
//         emit(AudioRecordingState());
//       } else {
//         emit(AudioRecordStoppedState());
//       }
//     });
//
//     _playingSubscription = _audioService.playingStateStream.listen((isPlaying) {
//       if (isPlaying) {
//         emit(AudioPlayingState());
//       } else {
//         emit(AudioStoppedState());
//       }
//     });
//   }
//
//   Future<void> startRecording() async {
//     final success = await _audioService.startRecording();
//     if (!success) {
//       emit(AudioErrorState('فشل في بدء التسجيل'));
//     }
//   }
//
//   Future<void> stopRecording() async {
//     await _audioService.stopRecording();
//   }
//
//   Future<void> playAudio([String? path]) async {
//     final success = await _audioService.playAudio(path);
//     if (!success) {
//       emit(AudioErrorState('فشل في تشغيل الصوت'));
//     }
//   }
//
//   Future<void> pauseAudio() async {
//     await _audioService.pauseAudio();
//   }
//
//   Future<void> stopAudio() async {
//     await _audioService.stopAudio();
//   }
//
//   // Getters
//   bool get isRecording => _audioService.isRecording;
//
//   bool get isPlaying => _audioService.isPlaying;
//
//   String get currentRecordPath => _audioService.currentRecordPath;
//
//   @override
//   Future<void> close() {
//     _recordingSubscription.cancel();
//     _playingSubscription.cancel();
//     return super.close();
//   }
//
//   void clearRecording() {
//     log('SimpleAudioCubit: Clearing recording...'); // للتأكد
//     _audioService.clearRecording();
//     emit(AudioStoppedState());
//     log('Current record path after clear: ${_audioService.currentRecordPath}');
//   }
// }