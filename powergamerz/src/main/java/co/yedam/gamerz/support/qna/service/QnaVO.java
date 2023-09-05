package co.yedam.gamerz.support.qna.service;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaVO {
	private int qnaId;
	private String qnaWriter;
	private String qnaWriterId;
	private String qnaTitle;
	private String qnaSubject;
	private LocalDateTime qnaDate;
	private String qnaDone;
	private String qnaReview;
	private String qnaPage;
}
