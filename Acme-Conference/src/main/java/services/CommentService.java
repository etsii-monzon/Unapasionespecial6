
package services;

import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.CommentRepository;
import domain.Comment;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository	commentRepository;


	public Comment create() {
		Comment comment;

		comment = new Comment();

		comment.setMoment(new Date());

		return comment;
	}

	public Comment findOne(final int commentId) {
		Comment comment;
		comment = this.commentRepository.findOne(commentId);
		return comment;
	}

	public Collection<Comment> findAll() {
		return this.commentRepository.findAll();
	}

	public Comment save(final Comment comment) {
		Comment res;

		res = this.commentRepository.save(comment);

		return res;

	}
	public void delete(final Comment comment) {
		Assert.notNull(comment.getMoment());
		Assert.notNull(comment);

		this.commentRepository.delete(comment);

	}

}
