## 초기 데이터베이스 설계

### 함수 종속성(Functional Dependencies, FDs)

FD1: User -> {Username, Email, Password, Nickname, ProfilePicture, GithubLink, SnsLink, BlogLink, Role, LoginType, is_active}

FD2: Post -> {UserID, TopicID, Title, Visibility, CreatedAt, UpdatedAt, is_active}

FD3: Comment -> {UserID, PostID, Content, CreatedAt, UpdatedAt, Likes, is_active}

FD4: Topic -> {Name}

FD5: Tag -> {Name}

FD6: PostTag -> {PostID, TagID}

FD7: Content -> {PostID, TextData}

FD8: Attachment -> {PostID, AttachmentData}

FD9: Emoji_Reaction -> {PostID, UserID, Emoji}

FD10: Friendly_Group -> {Name, CreatorUserID}

FD11: GroupMember -> {GroupID, MemberUserID}

FD12: GroupPostVisibility -> {PostID, GroupID}

### 클로저(Closure)

User+ = {ID, Username, Email, Password, Nickname, ProfilePicture, GithubLink, SnsLink, BlogLink, Role, LoginType, is_active}

Post+ = {ID, UserID, TopicID, Title, Visibility, CreatedAt, UpdatedAt, is_active}

Comment+ = {ID, UserID, PostID, Content, CreatedAt, UpdatedAt, Likes, is_active}

Topic+ = {ID, Name}

Tag+ = {ID, Name}

PostTag+ = {PostID, TagID}

Content+ = {PostID, TextData}

Attachment+ = {PostID, AttachmentData}

Emoji_Reaction+ = {ID, PostID, UserID, Emoji}

Friendly_Group+ = {ID, Name, CreatorUserID}

GroupMember+ = {GroupID, MemberUserID, PK}

GroupPostVisibility+ = {PostID, GroupID, PK}


### ERD

```mermaid
erDiagram

    users {
        id integer PK
        username varchar
        email varchar
        password varchar
        nickname varchar
        profile_picture varchar
        github_link varchar
        sns_link varchar
        blog_link varchar
        role varchar 
        login_type varchar 
        created_at timestamp
        is_active boolean
    }

    topics {
        id integer PK
        name varchar
    }

    tags {
        id integer PK
        name varchar
    }

    posts {
        id integer PK
        user_id integer
        topic_id integer
        title varchar
        visibility varchar 
        created_at timestamp
        updated_at timestamp
        is_active boolean
    }

    comments {
        id integer PK
        user_id integer
        post_id integer
        content text
        created_at timestamp
        updated_at timestamp
        likes integer
        is_active boolean
    }

    post_tags {
        post_id integer
        tag_id integer
    }

    contents {
        post_id integer PK
        text_data text
    }

    attachments {
        post_id integer PK
        attachment_data varchar
    }

    emoji_reactions {
        id integer PK
        post_id integer
        user_id integer
        emoji varchar
    }

    friendly_groups {
        id integer PK
        name varchar
        creator_user_id integer
    }

    group_members {
        group_id integer
        member_user_id integer
    }

    group_post_visibility {
        post_id integer
        group_id integer
    }

    users ||--o{ posts : "user_id"
    users ||--o{ comments : "user_id"
    users ||--o{ emoji_reactions : "user_id"
    users ||--o{ friendly_groups : "creator_user_id"
    users }o--|| group_members : "member_user_id"
    topics ||--o{ posts : "topic_id"
    tags ||--o{ post_tags : "tag_id"
    posts ||--o{ post_tags : "post_id"
    posts ||--o{ comments : "post_id"
    posts ||--o| contents : "post_id"
    posts ||--o| attachments : "post_id"
    posts ||--o{ emoji_reactions : "post_id"
    posts ||--o{ group_post_visibility : "post_id"
    friendly_groups ||--o{ group_members : "group_id"
    friendly_groups ||--o{ group_post_visibility : "group_id"
```

### 릴레이션 설명

`Users Table` : 사용자의 기본 정보 및 소셜 링크와 함께 로그인 유형을 저장합니다.

`Posts Table` : 게시물의 메타데이터와 함께 게시물의 가시성(예: 공개, 개인 또는 그룹) 정보를 저장합니다.

`Topics Table `: 게시물의 주제를 분류하는 데 사용됩니다.

`Tags & PostTags Tables` : 게시물에 태그를 부여하며, PostTags는 게시물과 태그 간의 다대다 관계를 구현합니다.

`Comments Table` : 게시물에 대한 댓글 정보를 저장합니다.

`Contents & Attachments Tables` : 게시물의 본문과 관련 첨부 파일을 저장합니다.

`Emoji_Reactions Table` : 게시물에 대한 이모티콘 반응을 저장합니다.

`Friendly_Groups & GroupMembers Tables` : 사용자가 속한 그룹과 그룹의 멤버를 관리합니다.

`GroupPostVisibility Table` : 그룹에게만 표시되는 게시물을 관리합니다.


### 인덱싱

|테이블 이름|인덱스 컬럼|이유|
|---|---|---|
|Users|id|사용자의 기본 키로서 데이터를 빠르게 참조하기 위해|
|Users|email|로그인, 회원가입, 사용자 검색 등에서 이메일로 사용자를 빠르게 찾기 위해|
|Users|username|사용자 이름으로 사용자를 빠르게 찾기 위해|
|Posts|id|게시물의 기본 키로서 데이터를 빠르게 참조하기 위해|
|Posts|user_id|특정 사용자가 작성한 게시물을 검색할 때 빠르게 찾기 위해|
|Posts|topic_id|특정 주제에 대한 게시물을 검색할 때 빠르게 찾기 위해|
|Comments|id|댓글의 기본 키로서 데이터를 빠르게 참조하기 위해|
|Comments|post_id|특정 게시물에 연관된 댓글을 빠르게 찾기 위해|
|Comments|user_id|특정 사용자가 작성한 댓글을 빠르게 찾기 위해|
|Topics|id|주제의 기본 키로서 데이터를 빠르게 참조하기 위해|
|Tags|id|태그의 기본 키로서 데이터를 빠르게 참조하기 위해|
|PostTags|post_id|특정 게시물에 연결된 태그를 빠르게 찾기 위해|
|PostTags|tag_id|특정 태그에 연결된 게시물을 빠르게 찾기 위해|
|Emoji_Reactions|post_id|특정 게시물에 대한 이모티콘 반응을 빠르게 찾기 위해|
|Emoji_Reactions|user_id|특정 사용자가 남긴 이모티콘 반응을 빠르게 찾기 위해|
|Friendly_Groups|id|그룹의 기본 키로서 데이터를 빠르게 참조하기 위해|
|Friendly_Groups|creator_user_id|특정 사용자가 생성한 그룹을 빠르게 찾기 위해|
|GroupMembers|group_id|특정 그룹의 멤버를 빠르게 찾기 위해|
|GroupMembers|member_user_id|어떤 그룹에 속해 있는지 특정 사용자를 빠르게 찾기 위해|
|GroupPostVisibility|post_id|특정 게시물의 그룹 가시성을 빠르게 확인하기 위해|
|GroupPostVisibility|group_id|특정 그룹에 표시되는 게시물을 빠르게 찾기 위해|

### Redis를 활용한 효율성 확보

`User`

사용자의 프로필, role, login_type 등 자주 참조되는 데이터를 캐싱하면 로그인 시나리오나 사용자 관련 피드를 더 빠르게 제공할 수 있어보임.

`Posts`

인기 있는 게시물이나 최신 게시물들을 캐싱하면 전체 페이지 로드 시간을 줄일 수 있어 보임.

`Comments`

특정 게시물에 대한 최신 댓글을 캐싱하여 댓글 로딩 시간을 줄일 수 있어보임.

`Topics & Tags`

이들은 변경 빈도가 낮을 것으로 예상되므로 Redis에서 캐싱하여 빠른 참조가 가능하게 만들 수 있어보임.


### 탈퇴시 삭제 메커니즘

탈퇴한 사용자의 데이터 처리 메커니즘

is_deleted 플래그를 사용하여 먼저 데이터를 UI에서 숨긴 후, 나중에 Spring Batch와 같은 배치 처리 시스템을 사용하여 정기적으로 비활성화된 데이터를 삭제. 

실시간 서비스의 성능 저하 없이 큰 양의 데이터를 안전하게 삭제할 수 있어보임.