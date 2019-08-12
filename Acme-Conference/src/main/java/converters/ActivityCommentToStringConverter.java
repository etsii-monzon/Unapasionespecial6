
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.ActivityComment;

@Component
@Transactional
public class ActivityCommentToStringConverter implements Converter<ActivityComment, String> {

	@Override
	public String convert(final ActivityComment comment) {
		String result;

		if (comment == null)
			result = null;
		else
			result = String.valueOf(comment.getId());

		return result;
	}
}
