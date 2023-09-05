package co.yedam.gamerz.review.service;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private int reviewId;
	private String reviewLocation;
	private LocalDateTime reviewDate;
	private String reviewWriter;
	private String reviewComment;
}
