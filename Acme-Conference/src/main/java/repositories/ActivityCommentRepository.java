
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.ActivityComment;

@Repository
public interface ActivityCommentRepository extends JpaRepository<ActivityComment, Integer> {

	@Query("select c from ActivityComment c where c.activity.id=?1")
	Collection<ActivityComment> findCommentsOfActivity(int activityId);
}
