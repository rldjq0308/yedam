package co.yedam.gamerz.community.post.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostVO {
	private int postId;
	private String postTitle;
	private String postSubject;
	private String postWriter;
	private int postHit;
	private LocalDate postCreateDate;
	private LocalDate postUpdateDate;
	private String postAttach;
	private String postAttachDir;
	private String postWriterId;
	private String postReview;
	private String postPage;
}
