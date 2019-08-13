
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

	@Query("select avg(1.0*(select count(tc) from TutorialComment tc where tc.tutorial.id=t.id)) from Tutorial t")
	Double avgCommentsPerTutorial();

	@Query("select max(1.0*(select count(tc) from TutorialComment tc where tc.tutorial.id=t.id)) from Tutorial t")
	Integer maxCommentsPerTutorial();

	@Query("select min(1.0*(select count(tc) from TutorialComment tc where tc.tutorial.id=t.id)) from Tutorial t")
	Integer minCommentsPerTutorial();

	@Query("select 1.0*(select count(tc) from TutorialComment tc where tc.tutorial.id=t.id) from Tutorial t")
	Collection<Double> getCommentsPerTutorial();

}
