abstract class AudioState {}

class AudioInitial extends AudioState {}

class AudioRecordingState extends AudioState {}

class AudioRecordStoppedState extends AudioState {}

class AudioPlayingState extends AudioState {}

class AudioStoppedState extends AudioState {}

class AudioErrorState extends AudioState {
  final String message;

  AudioErrorState(this.message);
}