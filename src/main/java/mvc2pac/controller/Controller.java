package mvc2pac.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc2pac.model.DBBean;
import mvc2pac.model.DataBean;
import mvc2pac.model.MemberBean;
import mvc2pac.model.PageObject;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/newBoard")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doProcess(request, response);

	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8"); // 자바스크립트 한글 출력 코드
		String type = request.getParameter("type");
		Object obj = null;
		if (session.getAttribute("u_level") == null) {
			session.setAttribute("u_level", 0);
		}
		if (type == null)
			type = "list";
		switch (type) {

		// 첫 화면 이동 (리스트로 이동) 완료 후 수정

		// CSS view =>(이우림, 정세솔)
		// JavaScript 유효성 검사 =>(박야큰,이성규,정세솔,이우림)
		case "usercheck": {
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginForm.jsp");
			dispatcher.forward(request, response);
			break;
		}
		case "join": {
			RequestDispatcher dispatcher = request.getRequestDispatcher("join.jsp");
			dispatcher.forward(request, response);
			break;
		}
		// 회원가입 처리 =>(김윤서)
		case "joinPro": {
			MemberBean memberBean = new MemberBean();
			DBBean instance = DBBean.getInstance();
			PrintWriter out = response.getWriter();
			int id_check = instance.getUser_idCheck(request.getParameter("user_id"));
			if (id_check == 1) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script type=\"text/javascript\"> ");
				out.println("alert('아이디가 존재합니다.');");
				out.println("history.go(-1);");
				out.println("</script> ");
				out.flush();
				break;
			} else {
				Timestamp register = new Timestamp(System.currentTimeMillis());
				// System.out.println(register);
				memberBean.setUser_name(request.getParameter("user_name"));
				memberBean.setUser_id(request.getParameter("user_id"));
				memberBean.setUser_password(request.getParameter("user_password"));
				memberBean.setMobile(request.getParameter("mobile"));
				memberBean.setEmail(request.getParameter("email"));
				memberBean.setReg_date(register);
				instance.insertUser(memberBean);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script type=\"text/javascript\"> ");
				out.println("alert('회원가입이 완료되었습니다.');");
				out.println("location.href='newBoard?type=usercheck';");
				out.println("</script> ");
				out.flush();
				break;
			}

			// response.sendRedirect("loginForm.jsp");
			// RequestDispatcher dispatcher = request.getRequestDispatcher("loginForm.jsp");
			// dispatcher.forward(request, response);
			// break;
		}
		// 글 목록 보이기 => (이우림,정세솔)
		case "list": {
			// session.invalidate();

			DBBean instance = DBBean.getInstance();
			PageObject pgData = new PageObject();
			List<DataBean> list = null;

			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			int count = 0;
			int number = 0;
			try {
				count = instance.getArticleCount();
				// System.out.println("컨트롤러 count:" + count);
				number = count - (currentPage - 1) * pageSize;

				pgData.setPageSize(pageSize);
				pgData.setCurrentPage(currentPage);
				pgData.setStartRow(startRow);
				pgData.setEndRow(endRow);
				pgData.setTotalPage(count);
				pgData.setNumber(number);
				request.setAttribute("pgData", pgData);

				if (count > 0) {
					list = instance.getArticles(startRow, endRow);
				} else {
					list = instance.getArticles(0, 0);
				}

				obj = list;
			} catch (Exception e) {
				e.printStackTrace();
			} // 전체 글의 개수
			request.setAttribute("list", obj);
			RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
			dispatcher.forward(request, response);

			break;
		}

		// 본문으로 이동(리스트->글 내용) 정세솔
		case "showContent": {
			String number = request.getParameter("num");
			int num = Integer.parseInt(number);

			DBBean instance = DBBean.getInstance();
			DataBean data;
			try {
				data = instance.getArticle(num);
				obj = data;
				request.setAttribute("content", obj);
			} catch (Exception e) {
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("content.jsp");
			dispatcher.forward(request, response);
			break;
		}

		// 글쓰기 폼으로 이동 (박야큰)
		case "writeForm": {

			RequestDispatcher dispatcher = request.getRequestDispatcher("writeForm.jsp");
			dispatcher.forward(request, response);
			break;
		}
		// 글쓰기 완료후 리스트로 이동 (박야큰)
		case "write": {
			try {
				DataBean article = new DataBean();
				DBBean instance = DBBean.getInstance();

				article.setReg_date(new Timestamp(System.currentTimeMillis()));
				article.setIp(request.getRemoteAddr());

				String writer = request.getParameter("writer");
				String subject = request.getParameter("subject");
				String email = request.getParameter("email");
				String content = request.getParameter("content");
				String passwd = request.getParameter("passwd");
				// 수정 (추가)코드
				int re_level = Integer.parseInt(request.getParameter("re_level"));
				int re_step = Integer.parseInt(request.getParameter("re_step"));
				int ref = Integer.parseInt(request.getParameter("ref"));
				int num = Integer.parseInt(request.getParameter("num"));
				article.setRe_level(re_level);
				article.setRe_step(re_step);
				article.setRef(ref);
				article.setNum(num);
				// article.setNum(Integer.parseInt(request.getParameter("num")));// 이 방식사용 불가능
				// 이유를 모르겠음..

				article.setWriter(writer);
				article.setSubject(subject);
				article.setEmail(email);
				article.setContent(content);
				article.setPasswd(passwd);

				instance.insertArticle(article);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String pageNum = request.getParameter("pageNum");
			RequestDispatcher dispatcher = request.getRequestDispatcher("newBoard?type=list&pageNum=" + pageNum);
			dispatcher.forward(request, response);

			break;
		}
		// 답글 폼으로 이동 (이성규)
		case "reply": {

			RequestDispatcher dispatcher = request.getRequestDispatcher("writeForm.jsp");
			dispatcher.forward(request, response);
			break;
		}
		// 글 삭제 폼으로 이동 ->비밀번호 확인 (정세솔)
		case "delete": {
			String number = request.getParameter("num");
			int num = Integer.parseInt(number);

			DBBean instance = DBBean.getInstance();
			DataBean data;
			try {
				data = instance.getArticle(num);
				obj = data;
				request.setAttribute("delete", obj);
			} catch (Exception e) {
				e.printStackTrace();
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("newBoard?type=deletePro");
			dispatcher.forward(request, response);
			break;
		}
		// 글 삭제 요청 완료후 리스트로 이동 - > (정세솔 , 이우림)
		case "deletePro": {
			String number = request.getParameter("num");
			int num = Integer.parseInt(number);
			System.out.println(num);

			DBBean instance = DBBean.getInstance();

			try {
				String pageNum = request.getParameter("pageNum");
				instance.deleteArticle(num);

				// 삭제가 완료되면 글목록으로 이동
				RequestDispatcher dispatcher = request.getRequestDispatcher("newBoard?type=list&pageNum=" + pageNum);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			break;
		}
		/*
		 * 글 삭제 시 비밀번호 체크를 하는 경우 case "deletePro": { String number =
		 * request.getParameter("num"); int num = Integer.parseInt(number); String
		 * passwd = request.getParameter("passwd"); System.out.println(num);
		 * System.out.println(passwd);
		 * 
		 * DBBean instance = DBBean.getInstance(); int check; try { String pageNum =
		 * request.getParameter("pageNum"); check = instance.deleteArticle(num, passwd);
		 * // 자바스크립트 코드 출력 PrintWriter out = response.getWriter();
		 * response.resetBuffer(); response.setCharacterEncoding("utf-8");
		 * 
		 * if (check == 1) { out.println(
		 * "<meta http-equiv='Refresh' content='0;url=newBoard?type=list&pageNum=" +
		 * pageNum + "'>"); // 삭제가 완료되면 글목록으로 이동 } else {
		 * out.println("<script type=\"text/javascript\"> ");
		 * out.println("alert('비밀번호가 맞지 않습니다.');"); out.println("history.go(-1);");
		 * out.println("</script> "); } } catch (Exception e) { e.printStackTrace(); }
		 * 
		 * break; }
		 */

		// 글 수정 폼으로 이동 => (박야큰)
		case "updateForm": {
			String number = request.getParameter("num");
			int num = Integer.parseInt(number);

			DBBean dbPro = DBBean.getInstance();
			DataBean article;
			try {
				article = dbPro.updateGetArticle(num);
				obj = article;
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("update", obj);
			RequestDispatcher dispatcher = request.getRequestDispatcher("updateForm.jsp");
			dispatcher.forward(request, response);
			break;

		}
		// 글 수정요청 완료후 리스트로 이동=> (박야큰)
		case "update": {
			String number = request.getParameter("num");
			int num = Integer.parseInt(number);
			String dbpasswd = request.getParameter("passwd");
			System.out.println(num);
			System.out.println(dbpasswd);

			DBBean dbPro = DBBean.getInstance();
			DataBean article = new DataBean();

			article.setWriter(request.getParameter("writer"));
			article.setSubject(request.getParameter("subject"));
			article.setEmail(request.getParameter("email"));
			article.setContent(request.getParameter("content"));
			article.setPasswd(request.getParameter("passwd"));
			article.setNum(Integer.parseInt(request.getParameter("num")));

			int check;

			try {
				check = dbPro.updateArticle(article);
				String pageNum = request.getParameter("pageNum");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				if (check == 1) {
					out.println(
							"<meta http-equiv='Refresh' content='0;url=newBoard?type=list&pageNum=" + pageNum + "'>");
					// 수정이 완료되면 글목록으로 이동
				} else {
					out.println("<script type=\"text/javascript\"> ");
					out.println("alert('비밀번호가 맞지 않습니다.');");
					out.println("history.go(-1);");
					out.println("</script> ");
					out.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			break;
		} // 로그인 처리 -> (박야큰)
		case "login": {

			DBBean instance = DBBean.getInstance();
			MemberBean member = new MemberBean();

			String id = request.getParameter("user_id");
			String passwd = request.getParameter("user_password");

			int check = 0;

			try {
				check = instance.getUserCheck(id, passwd);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();

				if (check == 0) {
					out.println("<script type=\"text/javascript\"> ");
					out.println("alert('로그인 실패.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.flush();

				} else {
					member = instance.getSession(id, passwd);

					session.setAttribute("user_id", id);
					session.setAttribute("user_password", passwd);
					session.setAttribute("user_name", member.getUser_name());
					session.setAttribute("u_level", member.getU_level());
					session.setAttribute("email", member.getEmail());

					RequestDispatcher dispatcher = request.getRequestDispatcher("newBoard?type=list");
					dispatcher.forward(request, response);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		} // 로그아웃 = > 박야큰
		case "logout": {
			session.invalidate();

			RequestDispatcher dispatcher = request.getRequestDispatcher("newBoard?type=list");
			dispatcher.forward(request, response);
			break;

		}//id와 비밀번호 찾기
		case "IDPW": {

			RequestDispatcher dispatcher = request.getRequestDispatcher("IdPw.jsp");
			dispatcher.forward(request, response);
			break;
		}
		// 아이디 찾기 = > 김윤서
		case "findIdPw": {
			String idpw = request.getParameter("find");
			RequestDispatcher dispatcher = request.getRequestDispatcher(idpw + ".jsp");
			dispatcher.forward(request, response);
			break;
		}
		case "findIdPro": {
			String email = request.getParameter("email");
			DBBean instance = DBBean.getInstance();
			MemberBean memberBean = new MemberBean();
			memberBean = instance.getId(email);
			if (memberBean == null) {

				PrintWriter out = response.getWriter();
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script type=\"text/javascript\"> ");
				out.println("alert('아이디나 이메일이 존재하지 않습니다.');");
				out.println("window.location = 'newBoard?type=join';");
				out.println("</script> ");

			} else {
				String findID = memberBean.getUser_id();

				request.setAttribute("email", findID);
//
				RequestDispatcher dispatcher = request.getRequestDispatcher("findIdPro.jsp");
				dispatcher.forward(request, response);
			}
			break;
		}
		// 회원인증 비밀번호 찾기 = > 정세솔
		case "findPwPro": {
			RequestDispatcher dispatcher = request.getRequestDispatcher("findPwPro.jsp");
			dispatcher.forward(request, response);
			break;
		}

		default: {
			RequestDispatcher dispatcher = request.getRequestDispatcher("newBoard");
			dispatcher.forward(request, response);
			break;
		}
		}

	}
}

/*
 * case "home": { RequestDispatcher dispatcher =
 * request.getRequestDispatcher("list.jsp"); dispatcher.forward(request,
 * response); break; }
 */