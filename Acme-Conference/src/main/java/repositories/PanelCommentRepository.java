
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.PanelComment;

@Repository
public interface PanelCommentRepository extends JpaRepository<PanelComment, Integer> {

	@Query("select c from PanelComment c where c.panel.id=?1")
	Collection<PanelComment> findCommentsOfPanel(int activityId);
}
