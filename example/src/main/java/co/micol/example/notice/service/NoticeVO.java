package co.micol.example.notice.service;

import java.time.LocalDate;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int noticeId;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeSubject;
	
	private LocalDate noticeDate;
	private String noticeAttach;
	private String noticeAttachDir;
	private int noticeHit;
}
