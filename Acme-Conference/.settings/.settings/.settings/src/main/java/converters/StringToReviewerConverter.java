
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.ReviewerRepository;
import domain.Reviewer;

@Component
@Transactional
public class StringToReviewerConverter implements Converter<String, Reviewer> {

	@Autowired
	private ReviewerRepository	reviewerRepository;


	@Override
	public Reviewer convert(final String text) {
		Reviewer result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.reviewerRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
