<img width="679" alt="plog_erd" src="https://github.com/christopher3810/plog_repo/assets/61622657/9707f5bf-1470-4c19-a779-1d4089b1a3a1"></img>

# plog_repo
private for public 

### 주요 기능

1. 글 작성 및 조회
2. 댓글 기능
3. 이모지 반응
4. 태그 기능
5. 소셜 로그인 (Google, Kakao)
6. 프로필 편집

### 사용자 시나리오
1. 사용자는 구글 또는 카카오톡 계정으로 로그인합니다.
2. 로그인한 사용자는 대시보드에서 글을 조회하거나, 특정 토픽이나 태그로 글을 검색할 수 있습니다.
3. 사용자는 특정 글을 클릭하여 내용을 확인하고, 댓글을 작성하거나 이모지로 반응할 수 있습니다.
4. 사용자는 자신의 프로필을 편집하여 닉네임, 이메일, 프로필 사진, Github 링크, SNS 링크, 블로그 링크 등을 업데이트할 수 있습니다.
5. 관리자는 새로운 글을 작성하거나 기존의 글을 편집할 수 있습니다.

### 초기 데이터베이스 설계
**함수 종속성(Functional Dependencies, FDs)**

FD1: User -> {Username, Email, Password, Nickname, ProfilePicture, GithubLink, SnsLink, BlogLink}

FD2: Post -> {UserID, TopicID, Title, ContentID, CreatedAt, UpdatedAt}

FD3: Comment -> {UserID, PostID, Content, CreatedAt, UpdatedAt, Likes}

FD4: Topic -> {Name}

FD5: Tag -> {Name}

FD6: PostTag -> {PostID, TagID}

FD7: Content -> {PostID, TextData}

FD8: Attachment -> {PostID, AttachmentData}

**클로저(Closure)**

User+ = {User, Username, Email, Password, Nickname, ProfilePicture, GithubLink, SnsLink, BlogLink}

Post+ = {Post, UserID, TopicID, Title, ContentID, CreatedAt, UpdatedAt}

Comment+ = {Comment, UserID, PostID, Content, CreatedAt, UpdatedAt, Likes}

Topic+ = {Topic, Name}

Tag+ = {Tag, Name}

PostTag+ = {PostTag, PostID, TagID}

Content+ = {Content, PostID, TextData}

Attachment+ = {Attachment, PostID, AttachmentData}

**ERD**

<img width="679" alt="plog_erd" src="https://github.com/christopher3810/plog_repo/assets/61622657/e3d05b3f-d962-4497-9091-5ac5776dfab1">
