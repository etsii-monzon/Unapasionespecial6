
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.TutorialComment;

@Repository
public interface TutorialCommentRepository extends JpaRepository<TutorialComment, Integer> {

	@Query("select c from TutorialComment c where c.tutorial.id=?1")
	Collection<TutorialComment> findCommentsOfTutorial(int activityId);

}
