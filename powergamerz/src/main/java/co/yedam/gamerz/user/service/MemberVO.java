package co.yedam.gamerz.user.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberBirth;
	private String memberPhone;
	private String memberAddress;
	private String memberEmail;
	private String memberAuthor;
	private LocalDate memberEdate;
	private String memberImg;
	private String memberDir;
}
