part of 'cancelsession_cubit.dart';

abstract class CancelSessionState {}

class CancelsessionInitial extends CancelSessionState {}

class ChangelecturerInitial extends CancelSessionState {}

class ChooseChangeLecturerReasonState extends CancelSessionState {}

class IncrementBodyIndexState extends CancelSessionState {}

class DecrementBodyIndexState extends CancelSessionState {}

class ToggleTimeTypeState extends CancelSessionState {}

class ChangeSpecifiedDayState extends CancelSessionState {}

class ChangeDateTypeIndexState extends CancelSessionState {}

class ChangeSelectedTimeState extends CancelSessionState {}
