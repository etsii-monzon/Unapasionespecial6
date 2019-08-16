
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

	@Query("select avg(c.comments.size) from Conference c")
	Double avgNumberCommentsPerConference();

	@Query("select stddev(c.comments.size) from Conference c")
	Double stdNumberCommentsPerConference();

	@Query("select min(c.comments.size) from Conference c")
	Double minNumberCommentsPerConference();

	@Query("select max(c.comments.size) from Conference c")
	Double maxNumberCommentsPerConference();

}
