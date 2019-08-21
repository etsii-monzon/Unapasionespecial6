
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.PresentationComment;

@Repository
public interface PresentationCommentRepository extends JpaRepository<PresentationComment, Integer> {

	@Query("select c from PresentationComment c where c.presentation.id=?1")
	Collection<PresentationComment> findCommentsOfPresentation(int activityId);

	@Query("select avg(1.0*(select count(pc) from PresentationComment pc where pc.presentation.id=p.id)) from Presentation p")
	Double avgCommentsPerPresentation();

	@Query("select max(1.0*(select count(pc) from PresentationComment pc where pc.presentation.id=p.id)) from Presentation p")
	Integer maxCommentsPerPresentation();

	@Query("select min(1.0*(select count(pc) from PresentationComment pc where pc.presentation.id=p.id)) from Presentation p")
	Integer minCommentsPerPresentation();

	@Query("select 1.0*(select count(pc) from PresentationComment pc where pc.presentation.id=p.id) from Presentation p")
	Collection<Double> getCommentsPerPresentation();
}
