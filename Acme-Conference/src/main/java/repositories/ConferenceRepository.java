
package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Conference;

@Repository
public interface ConferenceRepository extends JpaRepository<Conference, Integer> {

	@Query("select c from Conference c  where (c.title like concat('%',?1,'%') or c.venue like concat('%',?1,'%'))")
	Collection<Conference> searchConferenceByKeyword(String keyword);

	@Query("select avg(c.fee) from Conference c")
	Double avgFeesPerConference();

	@Query("select stddev(c.fee) from Conference c")
	Double stdDevFeesPerConference();

	@Query("select min(c.fee) from Conference c")
	Double minFeesPerConference();

	@Query("select max(c.fee) from Conference c")
	Double maxFeesPerConference();

	@Query("select c.endDate from Conference c")
	Collection<Date> findEndDateFromConferencs();

	@Query("select c.startDate from Conference c")
	Collection<Date> findStartDateFromConferencs();
}
