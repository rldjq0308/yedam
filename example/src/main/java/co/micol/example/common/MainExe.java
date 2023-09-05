package co.micol.example.common;

import co.micol.example.notice.service.ReplyService;
import co.micol.example.notice.service.ReplyVO;
import co.micol.example.notice.serviceImpl.ReplyServiceImpl;

public class MainExe {
	public static void main(String[] args) {
		ReplyService service = new ReplyServiceImpl();

		ReplyVO reply = new ReplyVO();
		reply.setNoticeId(5);
		reply.setReply("수정22");
		reply.setReplyer("수정자");
		reply.setReplyId(3);

		// service.addReply(reply);

		service.editReply(reply);

		service.replyList(5).forEach((vo) -> {
			System.out.println(vo);
		});

	}
}
