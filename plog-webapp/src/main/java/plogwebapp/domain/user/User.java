package plogwebapp.domain.user;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table("users")
public class User {
    @Id
    private Long id;
    private String username;
    private String email;
    private String password;
    private String nickname;
    @Column("profile_picture")
    private String profilePicture;
    @Column("github_link")
    private String githubLink;
    @Column("sns_link")
    private String snsLink;
    @Column("blog_link")
    private String blogLink;
    private String role;
    @Column("login_type")
    private String loginType;
    @Column("created_at")
    private LocalDateTime createdAt;
    @Column("is_active")
    private Boolean isActive;

}
