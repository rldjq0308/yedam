package co.yedam.gamerz.user.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	List<MemberVO> memberAuthorList(String value);
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
}
