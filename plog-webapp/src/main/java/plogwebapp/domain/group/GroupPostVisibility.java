package plogwebapp.domain.group;

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
@Table("group_post_visibility")
public class GroupPostVisibility {
    @Id
    private Long id;
    @Column("post_id")
    private Long postId;
    @Column("group_id")
    private Long groupId;

}
