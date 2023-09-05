package co.yedam.gamerz.community.post.web;

import java.io.IOException;
import java.time.LocalDate;

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

@WebServlet("/postedit.do")
public class PostEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PostEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostService dao = new PostServiceImpl();
		PostVO vo = new PostVO();
		
		String saveDir = getServletContext().getRealPath("attach/post/");
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
			vo.setPostAttach(originalFile);
			vo.setPostAttachDir(saveDir+fileName); 
		}
		
		vo.setPostId(Integer.valueOf(multi.getParameter("postId")));
		vo.setPostCreateDate(LocalDate.parse(multi.getParameter("postCreateDate")));
		vo.setPostTitle(multi.getParameter("postTitle"));
		vo.setPostSubject(multi.getParameter("postSubject"));
		
		String viewName = "community/postselect";
		int n = dao.postUpdate(vo);
		if( n==1) {
			vo = dao.postSelect(vo);
			request.setAttribute("p", vo);
			ViewResolve.forward(request, response, viewName);
		}else {
			request.setAttribute("message", "글 수정 중 오류가 발생하였습니다.");
			viewName = "community/postmessage";
			ViewResolve.forward(request, response, viewName);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
