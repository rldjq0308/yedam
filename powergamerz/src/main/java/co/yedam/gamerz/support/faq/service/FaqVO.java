package co.yedam.gamerz.support.faq.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FaqVO {
	private int faqId;
	private String faqWriter;
	private String faqWriterId;
	private String faqTitle;
	private String faqSubject;
	private LocalDate faqDate;
	private String faqReq;
}
