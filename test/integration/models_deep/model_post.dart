// PG post with deep nesting under a jsonb column. The depth chain:
//   ModelPost
//     └─ media: PG_jsonb-List<ModelMediaItem>
//        └─ details: PG_jsonb-ModelMediaDetails
//           └─ dimensions: PG_jsonb-ModelDimensions
//   ModelPost
//     └─ location: PG_jsonb-ModelLocation

import 'package:df_generate_dart_models_core/df_generate_dart_models_core.dart';

import '_enums.dart';
import 'model_account.dart';

part '_model_post.g.dart';
part '_model_location.g.dart';
part '_model_media_item.g.dart';
part '_model_media_details.g.dart';
part '_model_dimensions.g.dart';

// Bottom of the chain — a literal width/height pair.
@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['width'], fieldType: 'PG_integer-int'),
    Field(fieldPath: ['height'], fieldType: 'PG_integer-int'),
    Field(
      fieldPath: ['rotation'],
      fieldType: 'PG_integer-int',
      nullable: true,
    ),
  },
)
abstract class _ModelDimensions extends Model {
  const _ModelDimensions();
}

// Mid-tier — media-specific metadata. Embeds ModelDimensions.
@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['mime'],
      fieldType: 'PG_text-String',
    ),
    Field(
      fieldPath: ['byte_size'],
      fieldType: 'PG_bigint-int',
      nullable: true,
    ),
    Field(
      fieldPath: ['duration_ms'],
      fieldType: 'PG_integer-int',
      nullable: true,
    ),
    Field(
      fieldPath: ['dimensions'],
      fieldType: 'PG_jsonb-ModelDimensions',
      nullable: true,
    ),
    Field(
      fieldPath: ['alt_text'],
      fieldType: 'PG_text-String',
      nullable: true,
    ),
  },
)
abstract class _ModelMediaDetails extends Model {
  const _ModelMediaDetails();
}

// Item — appears as List<ModelMediaItem> inside ModelPostMedia/Post.
@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: 'PG_uuid-String',
      primaryKey: true,
    ),
    Field(
      fieldPath: ['kind'],
      fieldType: 'PG_enum(media_kind)-MediaKindType',
    ),
    Field(fieldPath: ['url'], fieldType: 'PG_text-String'),
    Field(
      fieldPath: ['thumbnail_url'],
      fieldType: 'PG_text-String',
      nullable: true,
    ),
    Field(
      fieldPath: ['details'],
      fieldType: 'PG_jsonb-ModelMediaDetails',
      nullable: true,
    ),
    Field(
      fieldPath: ['order'],
      fieldType: 'PG_integer-int',
      nullable: true,
    ),
  },
)
abstract class _ModelMediaItem extends Model {
  const _ModelMediaItem();
}

// jsonb location embedded directly on the post.
@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(fieldPath: ['latitude'], fieldType: 'PG_numeric(10,7)-double'),
    Field(fieldPath: ['longitude'], fieldType: 'PG_numeric(10,7)-double'),
    Field(
      fieldPath: ['accuracy_m'],
      fieldType: 'PG_real-double',
      nullable: true,
    ),
    Field(
      fieldPath: ['place_label'],
      fieldType: 'PG_text-String',
      nullable: true,
    ),
  },
)
abstract class _ModelLocation extends Model {
  const _ModelLocation();
}

// Top of the post chain.
@GenerateDartModel(
  keyStringCase: 'LOWER_SNAKE_CASE',
  shouldInherit: true,
  fields: {
    Field(
      fieldPath: ['id'],
      fieldType: 'PG_uuid-String',
      primaryKey: true,
    ),
    Field(
      fieldPath: ['author_id'],
      fieldType: 'PG_uuid-String',
      foreignKey: true,
      references: ModelAccount,
      onDelete: 'cascade',
    ),
    Field(
      fieldPath: ['visibility'],
      fieldType: 'PG_enum(post_visibility)-PostVisibilityType',
      nullable: true,
    ),
    Field(
      fieldPath: ['caption'],
      fieldType: 'PG_text-String',
      nullable: true,
    ),
    // Native PG array of text — hashtags.
    Field(
      fieldPath: ['hashtags'],
      fieldType: 'PG_text[]-List<String>',
      nullable: true,
    ),
    // List of media items, embedded as a jsonb array.
    Field(
      fieldPath: ['media'],
      fieldType: 'PG_jsonb-List<ModelMediaItem>',
      nullable: true,
    ),
    // Single location jsonb.
    Field(
      fieldPath: ['location'],
      fieldType: 'PG_jsonb-ModelLocation',
      nullable: true,
    ),
    Field(
      fieldPath: ['like_count'],
      fieldType: 'PG_integer-int',
      nullable: true,
    ),
    Field(fieldPath: ['created_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(fieldPath: ['updated_at'], fieldType: 'PG_timestamptz-DateTime'),
    Field(
      fieldPath: ['deleted_at'],
      fieldType: 'PG_timestamptz-DateTime',
      nullable: true,
    ),
  },
)
abstract class _ModelPost extends Model {
  const _ModelPost();
}
