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
@Table("group_members")
public class GroupMember {
    @Id
    private Long id;
    @Column("group_id")
    private Long groupId;
    @Column("member_user_id")
    private Long memberUserId;
}
