package plogwebapp.domain.reaction;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table("emoji_reactions")
public class EmojiReaction {
    @Id
    private Long id;
    @Column("post_id")
    private Long postId;
    @Column("user_id")
    private Long userId;
    private String emoji;
}
