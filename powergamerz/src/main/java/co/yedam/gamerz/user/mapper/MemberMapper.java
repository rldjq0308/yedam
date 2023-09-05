package co.yedam.gamerz.user.mapper;

import java.util.List;

import co.yedam.gamerz.user.service.MemberVO;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	List<MemberVO> memberAuthorList(String value);
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
}
