
CREATE TABLE IF NOT EXISTS servers (
    server_id bigint PRIMARY KEY,
    server_name varchar(50),
    server_owner_id bigint,
    server_owner_name varchar(50),
    server_join_position serial,
    prefix VARCHAR(5) DEFAULT '-'
);

CREATE TABLE IF NOT EXISTS logging (
    server_id bigint PRIMARY KEY,
    message_edits boolean,
    message_deletions boolean,
    role_changes boolean,
    channel_updates boolean,
    name_updates boolean,
    voice_state_updates boolean,
    avatar_changes boolean,
    bans boolean,
    leaves boolean,
    joins boolean,
    ignored_channels text,
    logchannel bigint,
    logging_webhook_id varchar(100)
);

CREATE TABLE IF NOT EXISTS users (
    index bigserial PRIMARY KEY,
    user_id bigint,
    server_id bigint,
    nicknames text,
    roles text,
    eyecount bigint DEFAULT 0 NOT NULL
);

CREATE TABLE IF NOT EXISTS mutes (
    muted_user bigint,
    server_id bigint,
    role_ids text,
    endtime timestamp
);

CREATE TABLE IF NOT EXISTS lockedchannels (
    channel_id bigint PRIMARY KEY,
    server_id bigint,
    command_executor bigint,
    everyone_perms text
);

CREATE TABLE IF NOT EXISTS warn (
    user_id bigint,
    server_id bigint,
    warnings smallint
);

CREATE TABLE IF NOT EXISTS last_seen (
    user_id bigint PRIMARY KEY,
    timestamp timestamp
);

CREATE TABLE IF NOT EXISTS messages (
    unix real,
    timestamp timestamp,
    content text,
    msg_id bigint,
    author_id bigint,
    channel_id bigint,
    server_id bigint
);

CREATE TABLE IF NOT EXISTS commands (
    index BIGSERIAL PRIMARY KEY,
    server_id BIGINT,
    channel_id BIGINT,
    author_id BIGINT,
    timestamp TIMESTAMP,
    prefix TEXT,
    command TEXT,
    failed BOOLEAN
);

CREATE TABLE IF NOT EXISTS blacklist (
    user_id BIGINT PRIMARY KEY,
    author_id BIGINT, -- OK this will only be the owner but ¯\＿( ͡° ͜ʖ ͡°)＿/¯
    reason TEXT,
    react BOOLEAN,
    timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS serverblacklist (
    server_id BIGINT PRIMARY KEY,
    reason TEXT,
    timestamp TIMESTAMP,
    executor TEXT,
    react BOOLEAN
);

CREATE TABLE IF NOT EXISTS ignored (
    server_id BIGINT,
    user_id BIGINT,
    author_id BIGINT,
    reason TEXT,
    react BOOLEAN,
    timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS snipe (
    channel_id bigint PRIMARY KEY,
    server_id bigint,
    author_id bigint,
    message_id bigint,
    content text,
    timestamp timestamp
);

CREATE TABLE IF NOT EXISTS profanity (
    server_id bigint PRIMARY KEY,
    words text
);

CREATE TABLE IF NOT EXISTS roleconfig (
    server_id bigint PRIMARY KEY,
    autoroles text,
    reassign boolean DEFAULT true
);

CREATE TABLE IF NOT EXISTS moderation (
    server_id bigint PRIMARY KEY,
    anti_invite boolean,
    mute_role bigint
);