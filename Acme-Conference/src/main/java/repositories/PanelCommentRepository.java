
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

	@Query("select avg(1.0*(select count(pc) from PanelComment pc where pc.panel.id=p.id)) from Panel p")
	Double avgCommentsPerPanel();

	@Query("select max(1.0*(select count(pc) from PanelComment pc where pc.panel.id=p.id)) from Panel p")
	Integer maxCommentsPerPanel();

	@Query("select min(1.0*(select count(pc) from PanelComment pc where pc.panel.id=p.id)) from Panel p")
	Integer minCommentsPerPanel();

	@Query("select 1.0*(select count(pc) from PanelComment pc where pc.panel.id=p.id) from Panel p")
	Collection<Double> getCommentsPerPanel();
}
