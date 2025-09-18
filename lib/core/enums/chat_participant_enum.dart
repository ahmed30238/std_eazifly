enum ChatParticipantEnum { user, client, instructor }

extension ChatParticipantEnumTitle on ChatParticipantEnum {
  String get title => switch (this) {
    ChatParticipantEnum.instructor => "Instructor",
    ChatParticipantEnum.user => "User",
    ChatParticipantEnum.client => "Client",
  };
}
