package co.micol.example.notice.web;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.micol.example.common.ViewResolve;
import co.micol.example.notice.service.NoticeService;
import co.micol.example.notice.service.NoticeVO;
import co.micol.example.notice.serviceImpl.NoticeServiceImpl;

@WebServlet("/noticeinsert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();	
		
		String saveDir = getServletContext().getRealPath("attach/notice/");
		int sizeLimit = 100 * 1024 * 1024;
		System.out.println(saveDir + "==========================");
		MultipartRequest multi = new MultipartRequest(
				request,
				saveDir,
				sizeLimit,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		String originalFile = multi.getOriginalFileName("file");
		if(originalFile != null) {
			String fileName = multi.getFilesystemName("file");
			vo.setNoticeAttach(originalFile);
			vo.setNoticeAttachDir(saveDir+fileName);
		}
		
		vo.setNoticeWriter(multi.getParameter("noticeWriter"));
		vo.setNoticeDate(LocalDate.parse(multi.getParameter("noticeDate")));
		vo.setNoticeTitle(multi.getParameter("noticeTitle"));
		vo.setNoticeSubject(multi.getParameter("noticeSubject"));
		
		int n = dao.noticeInsert(vo);
		
		if(n == 1) {
			request.setAttribute("message", "게시글이 정상적으로 입력 되었다.");
		}else {
			request.setAttribute("message", "게시글 작성이 실패되었다.");
		}
		
		String viewName = "notice/noticemessage";
		ViewResolve.forward(request, response, viewName);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
