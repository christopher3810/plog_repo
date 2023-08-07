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
@Table("friendly_groups")
public class FriendlyGroup {
    @Id
    private Long id;

    private String name;
    @Column("creator_user_id")
    private Long creatorUserId;
}
