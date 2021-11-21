package mvc2pac.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DBBean {
	
    private static DBBean instance = new DBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static DBBean getInstance() {
        return instance;
    }
    
    private DBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
        return ds.getConnection();
    }
 
    //board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
    public void insertArticle(DataBean article) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    if (num!=0) {  
		      sql="update board set re_step=re_step+1 where ref= ? and re_step> ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, ref);
			  pstmt.setInt(2, re_step);
			  pstmt.executeUpdate();
			  re_step=re_step+1;
			  re_level=re_level+1;
		     }else{
		  	  ref=number;
			  re_step=0;
			  re_level=0;
		     }	 
            // 쿼리를 작성
            sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
		    sql+="ref,re_step,re_level,content,ip) values(seq_board.nextval,?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getWriter());
            pstmt.setString(2, article.getEmail());
            pstmt.setString(3, article.getSubject());
            pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
            pstmt.setInt(6, ref);
            pstmt.setInt(7, re_step);
            pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
            pstmt.executeUpdate();
        } catch(Exception e) {
        	System.out.println("insertArticle(BoardDataBean article) 익셉션 발생");
            e.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //board테이블에 저장된 전체글의 수를 얻어냄(select문)<=list.jsp에서 사용
	public int getArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from board");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception e) {
        	System.out.println("getArticleCount() 익셉션 발생");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(Exception ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(Exception ex) {}
            if (conn != null) try { conn.close(); } catch(Exception ex) {}
        }
		return x;
    }

	//글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<DataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<DataBean> articleList=null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from (select rownum as rnum,A.* from (select * from board order by ref desc,re_step asc) A where rownum<=?) where rnum>=?");
            System.out.println("start : "+start+" end : "+end);
            pstmt.setInt(1, end);
			pstmt.setInt(2, start);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<DataBean>(end);
                do{
                  DataBean article= new DataBean();
				  article.setNum(rs.getInt("num"));
				  article.setWriter(rs.getString("writer"));
                  article.setEmail(rs.getString("email"));
                  article.setSubject(rs.getString("subject"));
                  article.setPasswd(rs.getString("passwd"));
			      article.setReg_date(rs.getTimestamp("reg_date"));
				  article.setReadcount(rs.getInt("readcount"));
                  article.setRef(rs.getInt("ref"));
                  article.setRe_step(rs.getInt("re_step"));
				  article.setRe_level(rs.getInt("re_level"));
                  article.setContent(rs.getString("content"));
			      article.setIp(rs.getString("ip")); 
				  
                  articleList.add(article);
			    }while(rs.next());
			}
        } catch(Exception ex) {
        	System.out.println("List<BoardDataBean> getArticles(int start, int end) 익셉션 발생");
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return articleList;
    }
 
	//글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	public DataBean getArticle(int num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
            	"select * from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new DataBean();
                article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));     
			}
        } catch(Exception ex) {
        	System.out.println("getArticle(int num) 익셉션");
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }
    
	//글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
    public DataBean updateGetArticle(int num)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"select * from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new DataBean();
                article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));     
			}
        } catch(Exception e) {
        	System.out.println("updateGetArticle(int num) 익셉션");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }

    //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
    public int updateArticle(DataBean article)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String dbpasswd="";
        String sql="";
		int x=-1;
        try {
            conn = getConnection();
            
			pstmt = conn.prepareStatement(
            	"select passwd from board where num = ?");
            pstmt.setInt(1, article.getNum());
            rs = pstmt.executeQuery();
            
			if(rs.next()){
			  dbpasswd= rs.getString("passwd"); 
			  if(dbpasswd.equals(article.getPasswd())){
                sql="update board set writer=?,email=?,subject=?,passwd=?";
			    sql+=",content=? where num=?";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, article.getWriter());
                pstmt.setString(2, article.getEmail());
                pstmt.setString(3, article.getSubject());
                pstmt.setString(4, article.getPasswd());
                pstmt.setString(5, article.getContent());
			    pstmt.setInt(6, article.getNum());
                pstmt.executeUpdate();
				x= 1;
			  }else{
				x= 0;
			  }
			}
        } catch(Exception e) {
        	System.out.println("updateArticle(BoardDataBean article) 익셉션");
            e.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
    public void deleteArticle(int num) 
        throws Exception {
    	Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			

			pstmt.executeUpdate();
				
			
        } catch(Exception e) {
        	System.out.println("deleteArticle(int num, String passwd) 익셉션");
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		
	}
  //글 삭제 시 비밀번호 체크를 하는 경우 <= deletePro 사용
  /*
      	public int deleteArticle(int num, String passwd)
        throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"select passwd from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement(
            	      "delete from board where num=?");
                    pstmt.setInt(1, num);
                    pstmt.executeUpdate();
					x= 1; //글삭제 성공
				}else
					x= 0; //비밀번호 틀림
			}
        } catch(Exception e) {
        	System.out.println("deleteArticle(int num, String passwd) 익셉션");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
 */
    
  //회원가입 처리
    public void insertUser(MemberBean mBean) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "";
    	try {
    		conn = getConnection();
    		// INSERT INTO boardmember VALUES (seq_board_member.NEXTVAL,'root', '관리자', '1234','010-1234-1234','ggg@naver.com', TO_DATE('2021-09-09', 'yyyy-mm-dd'), 2 )
    		sql = " INSERT INTO boardmember VALUES (seq_board_member.NEXTVAL,?,?,?,?,?,?,1 )";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, mBean.getUser_id());
    		pstmt.setString(2, mBean.getUser_name());
    		pstmt.setString(3, mBean.getUser_password());
    		pstmt.setString(4, mBean.getMobile());
    		pstmt.setString(5, mBean.getEmail());
    		pstmt.setTimestamp(6, mBean.getReg_date());
    		rs = pstmt.executeQuery();
    	}catch (Exception e) {
    		e.printStackTrace();
		}finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    //유저체크 메소드
    public int getUserCheck(String user_id, String user_password) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "";
    	try {
    		conn = getConnection();
    		sql = "select user_id,user_password "
    				+ "from boardmember"
    				+ " where user_id = ? and user_password = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, user_id);
    		pstmt.setString(2, user_password);
    		rs = pstmt.executeQuery();
    		    		
    		if(rs.next()) {
    			if(rs.getString("user_id").equals(user_id)) {
    				if(rs.getString("user_password").equals(user_password)) {
    					return 1;
    				}
    			}
    			
    		}
    		return 0;
    		
			
		} catch (Exception e) {e.printStackTrace();
		}finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    	return 0;
    }
    
    //user_id 중복체크
    public int getUser_idCheck(String user_id) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = "";
    	try {
    		conn = getConnection();
    		sql = "select user_id from boardmember where user_id = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, user_id);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return 1;
    		}		
    		
			
		} catch (Exception e) {e.printStackTrace();
		}finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    	return 0;
    }
    //박야큰 세션에서 (아이디, 이름, 이메일,패스워드,계정등급 )
    public MemberBean getSession(String id, String pw) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	MemberBean data = new MemberBean();
    	
    	try {
			conn = getConnection();
			String sql = "select user_name,u_level,email from boardmember where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,id);

			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				data.setUser_name(rs.getString("user_name"));
				data.setU_level(rs.getInt("u_level"));
				data.setEmail(rs.getString("email"));
				return data;
			}
				
		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
    //김윤서 유저 아이디 찾기 할때 쓰는 메소드
    public MemberBean getId(String email) {
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	MemberBean data = new MemberBean();
    	
    	try {
			conn = getConnection();
			String sql = "select user_id from boardmember where email = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,email);

			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				data.setUser_id(rs.getString("user_id"));
				
				return data;
			}
				
		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
    //정세솔 비밀번호 찾기 
    public String findPw(String id, String email) {
    	String user_password=null;
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        
        try {
        	conn = getConnection();
			pstmt = conn.prepareStatement(
            	"select user_password from boardmember where user_id= ? and email=?");
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();
           
			if(rs.next()){
			  user_password=rs.getString("user_password");
			} 
        }catch (Exception e) {
			e.printStackTrace();
		}finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.clearParameters(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    	return user_password;
    }

}