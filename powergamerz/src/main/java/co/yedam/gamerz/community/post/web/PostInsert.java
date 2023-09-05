package co.yedam.gamerz.community.post.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.gamerz.common.ViewResolve;
import co.yedam.gamerz.community.post.service.PostService;
import co.yedam.gamerz.community.post.service.PostVO;
import co.yedam.gamerz.community.post.serviceImpl.PostServiceImpl;

@WebServlet("/postinsert.do")
public class PostInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		PostVO vo = new PostVO();
		
		String saveDir = getServletContext().getRealPath("attach/post/");
		int sizeLimit = 100 * 1024 * 1024;
		System.out.println(saveDir + "==========================");
		MultipartRequest multi = new MultipartRequest(
				request,
				saveDir,
				sizeLimit,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		String originalFile = multi.getOriginalFileName("file");
		System.out.println(originalFile + "=======");
		if(originalFile != null) {
			String fileName = multi.getFilesystemName("file");
			vo.setPostAttach(originalFile);
			vo.setPostAttachDir(saveDir+fileName);
		}
		
		vo.setPostWriter(multi.getParameter("postWriter"));
		vo.setPostTitle(multi.getParameter("postTitle"));
		vo.setPostSubject(multi.getParameter("postSubject"));
		vo.setPostWriterId(multi.getParameter("postWriterId"));
		
		System.out.println("작성자 아이디: " + multi.getParameter("postWriterId") + "," + "작성자 명: " + multi.getParameter("postWriter"));
		System.out.println("내용 :" + multi.getParameter("postSubject"));
		System.out.println("제목:" + multi.getParameter("postTitle"));
		
		int n = dao.postInsert(vo);
		
		if(n==1) {
			request.setAttribute("message", "게시글 작성 성공.");
		}else {
			request.setAttribute("message", "게시글 작성 실패.");
		}
		
		String viewName = "community/postmessage";
		ViewResolve.forward(request, response, viewName);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
