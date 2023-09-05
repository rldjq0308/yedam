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

/**
 * Servlet implementation class NoticeEdit
 */
@WebServlet("/noticeedit.do")
public class NoticeEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		String saveDir = getServletContext().getRealPath("attach/notice/");
		int sizeLimit = 100 * 1024 * 1024;
		
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
		
		vo.setNoticeId(Integer.valueOf(multi.getParameter("noticeId")));
		vo.setNoticeDate(LocalDate.parse(multi.getParameter("noticeDate")));
		vo.setNoticeTitle(multi.getParameter("noticeTitle"));
		vo.setNoticeSubject(multi.getParameter("noticeSubject"));
		
		String viewName = "notice/noticeselect";
		int n = dao.noticeUpdate(vo);
		if( n==1) {
			vo = dao.noticeSelect(vo);
			request.setAttribute("n", vo);
			ViewResolve.forward(request, response, viewName);
		}else {
			request.setAttribute("message", "글 수정 중 오류가 발생하였습니다.");
			viewName = "notice/noticemessage";
			ViewResolve.forward(request, response, viewName);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
