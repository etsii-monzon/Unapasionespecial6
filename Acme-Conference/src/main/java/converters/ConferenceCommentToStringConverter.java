
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.ConferenceComment;

@Component
@Transactional
public class ConferenceCommentToStringConverter implements Converter<ConferenceComment, String> {

	@Override
	public String convert(final ConferenceComment comment) {
		String result;

		if (comment == null)
			result = null;
		else
			result = String.valueOf(comment.getId());

		return result;
	}
}
