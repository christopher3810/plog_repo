-- users table
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       email VARCHAR(255),
                       password VARCHAR(255),
                       nickname VARCHAR(255),
                       profile_picture VARCHAR(255),
                       github_link VARCHAR(255),
                       sns_link VARCHAR(255),
                       blog_link VARCHAR(255),
                       role VARCHAR(255),
                       login_type VARCHAR(255),
                       created_at TIMESTAMP,
                       is_active BOOLEAN DEFAULT TRUE
);

-- topics table
CREATE TABLE topics (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(255) NOT NULL
);

-- tags table
CREATE TABLE tags (
                      id SERIAL PRIMARY KEY,
                      name VARCHAR(255) NOT NULL
);

-- posts table
CREATE TABLE posts (
                       id SERIAL PRIMARY KEY,
                       user_id INTEGER,
                       topic_id INTEGER,
                       title VARCHAR(255) NOT NULL,
                       visibility VARCHAR(255),
                       created_at TIMESTAMP,
                       updated_at TIMESTAMP,
                       is_active BOOLEAN DEFAULT TRUE,
                       FOREIGN KEY (user_id) REFERENCES users(id),
                       FOREIGN KEY (topic_id) REFERENCES topics(id)
);

-- comments table
CREATE TABLE comments (
                          id SERIAL PRIMARY KEY,
                          user_id INTEGER,
                          post_id INTEGER,
                          content TEXT,
                          created_at TIMESTAMP,
                          updated_at TIMESTAMP,
                          likes INTEGER DEFAULT 0,
                          is_active BOOLEAN DEFAULT TRUE,
                          FOREIGN KEY (user_id) REFERENCES users(id),
                          FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- post_tags table
CREATE TABLE post_tags (
                           post_id INTEGER,
                           tag_id INTEGER,
                           PRIMARY KEY (post_id, tag_id),
                           FOREIGN KEY (post_id) REFERENCES posts(id),
                           FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- contents table
CREATE TABLE contents (
                          post_id INTEGER PRIMARY KEY,
                          text_data TEXT,
                          FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- attachments table
CREATE TABLE attachments (
                             post_id INTEGER PRIMARY KEY,
                             attachment_data VARCHAR(255),
                             FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- emoji_reactions table
CREATE TABLE emoji_reactions (
                                 id SERIAL PRIMARY KEY,
                                 post_id INTEGER,
                                 user_id INTEGER,
                                 emoji VARCHAR(255) NOT NULL,
                                 FOREIGN KEY (post_id) REFERENCES posts(id),
                                 FOREIGN KEY (user_id) REFERENCES users(id)
);

-- friendly_groups table
CREATE TABLE friendly_groups (
                                 id SERIAL PRIMARY KEY,
                                 name VARCHAR(255) NOT NULL,
                                 creator_user_id INTEGER,
                                 FOREIGN KEY (creator_user_id) REFERENCES users(id)
);

-- group_members table
CREATE TABLE group_members (
                               group_id INTEGER,
                               member_user_id INTEGER,
                               PRIMARY KEY (group_id, member_user_id),
                               FOREIGN KEY (group_id) REFERENCES friendly_groups(id),
                               FOREIGN KEY (member_user_id) REFERENCES users(id)
);

-- group_post_visibility table
CREATE TABLE group_post_visibility (
                                       post_id INTEGER,
                                       group_id INTEGER,
                                       PRIMARY KEY (post_id, group_id),
                                       FOREIGN KEY (post_id) REFERENCES posts(id),
                                       FOREIGN KEY (group_id) REFERENCES friendly_groups(id)
);

-- Users table indices
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_username ON users(username);

-- Posts table indices
CREATE INDEX idx_posts_id ON posts(id);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_topic_id ON posts(topic_id);

-- Comments table indices
CREATE INDEX idx_comments_id ON comments(id);
CREATE INDEX idx_comments_post_id ON comments(post_id);
CREATE INDEX idx_comments_user_id ON comments(user_id);

-- Topics table index
CREATE INDEX idx_topics_id ON topics(id);

-- Tags table index
CREATE INDEX idx_tags_id ON tags(id);

-- PostTags table indices
CREATE INDEX idx_posttags_post_id ON post_tags(post_id);
CREATE INDEX idx_posttags_tag_id ON post_tags(tag_id);

-- Emoji_Reactions table indices
CREATE INDEX idx_emoji_reactions_post_id ON emoji_reactions(post_id);
CREATE INDEX idx_emoji_reactions_user_id ON emoji_reactions(user_id);

-- Friendly_Groups table indices
CREATE INDEX idx_friendly_groups_id ON friendly_groups(id);
CREATE INDEX idx_friendly_groups_creator_user_id ON friendly_groups(creator_user_id);

-- GroupMembers table indices
CREATE INDEX idx_groupmembers_group_id ON group_members(group_id);
CREATE INDEX idx_groupmembers_member_user_id ON group_members(member_user_id);

-- GroupPostVisibility table indices
CREATE INDEX idx_grouppostvisibility_post_id ON group_post_visibility(post_id);
CREATE INDEX idx_grouppostvisibility_group_id ON group_post_visibility(group_id);
