
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
}
