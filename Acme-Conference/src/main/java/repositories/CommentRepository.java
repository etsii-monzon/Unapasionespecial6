
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

	@Query("select c from Comment c where c.conference.id=?1")
	Collection<Comment> findCommentsOfConference(int conferenceId);

	@Query("select c from Comment c where c.activity.id=?1")
	Collection<Comment> findCommentsOfActivity(int activityId);

}
