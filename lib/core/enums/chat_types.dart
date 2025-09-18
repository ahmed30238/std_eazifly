enum ChatTypes { private, group }

extension ChatTypesEnum on ChatTypes {
  String get type {
    return switch (this) {
      ChatTypes.group => "group",
      ChatTypes.private => "private",
    };
  }
}

