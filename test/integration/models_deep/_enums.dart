// Shared enums for the deep-nesting fixture. Every enum follows the
// `xxxType` naming convention the generator's `Type-?\w+|\w+-?Type`
// mapper recognises, so they round-trip via `.name` / `.values.valueOf`
// without any per-field annotation work.

enum AccountStatusType { active, suspended, banned, deleted, unknown }

enum AccountRoleType { user, moderator, admin, unknown }

enum PostVisibilityType { private, friends, public, unknown }

enum CommentStatusType { active, hidden, deleted, flagged, unknown }

enum MediaKindType { photo, video, audio, document, unknown }

enum FollowStatusType { pending, accepted, blocked, unknown }

enum NotificationKindType {
  like,
  comment,
  follow,
  mention,
  system,
  unknown,
}

enum DeviceKindType { ios, android, web, desktop, unknown }
