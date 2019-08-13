
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	@Query("select c from Category c where c.englishTitle = 'CATEGORY' and c.parent = null")
	Category getRoot();

	@Query("select avg(1.0*(select count(c) from Conference c where c.category.id=cat.id)) from Category cat")
	Double avgNumberConferencesPerCategory();

	@Query("select stddev(1.0*(select count(c) from Conference c where c.category.id=cat.id)) from Category cat")
	Double stdDevNumberConferencesPerCategory();

	@Query("select max(1.0*(select count(c) from Conference c where c.category.id=cat.id)) from Category cat")
	Integer maxNumberConferencesPerCategory();

	@Query("select min(1.0*(select count(c) from Conference c where c.category.id=cat.id)) from Category cat")
	Integer minNumberConferencesPerCategory();
}
