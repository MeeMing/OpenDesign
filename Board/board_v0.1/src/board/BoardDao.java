package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;
	
	public BoardDao() {
		try {
			String dburl = "jdbc:mysql://localhost:3306/schema_board";
			String dbrootid = "root";
			String dbrootpw = "kms7410";
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dburl,dbrootid,dbrootpw);
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	public ArrayList<Board> list(){
		ArrayList<Board> boards = new ArrayList<Board>();
		try {
			String query = "select bId, bTitle, bContent, bTime_Make, bTime_Modi from board;";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int bId = resultSet.getInt("bId");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bTime_Make = resultSet.getTimestamp("bTime_Make");
				Timestamp bTime_Modi = resultSet.getTimestamp("bTime_Modi");
				
				Board data = new Board(bId, bTitle, bContent, bTime_Make, bTime_Modi);
				boards.add(data);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(resultSet!=null) resultSet.close();
				if(preparedStatement!=null) preparedStatement.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return boards;
	}
	
	
	public ArrayList<Board> view(String id) {
		ArrayList<Board> boards=new ArrayList<Board>();
		try {
			String query = "select bId, bTitle, bContent, bTime_Make, bTime_Modi "
					+ "from board where bId='"+id+"';";
			System.out.println(query);
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
//			System.out.println(resultSet.next());
			while(resultSet.next()) {
//				System.out.println("while");
				int bId = resultSet.getInt("bId");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bTime_Make = resultSet.getTimestamp("bTime_Make");
				Timestamp bTime_Modi = resultSet.getTimestamp("bTime_Modi");
				Board board = new Board(bId, bTitle, bContent, bTime_Make, bTime_Modi);
//				System.out.println(board.getbId());
				boards.add(board);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("exception1");
		} finally {
			// TODO: handle finally clause
			try {
				if(resultSet!=null) resultSet.close();
				if(preparedStatement!=null) preparedStatement.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
//		System.out.println(board.getbId());
//		if(board!=null) System.out.println("null");
		return boards;
	}
	
	
	public void delete(String id) {
		
		try {
			String query = "delete from board where bId=?;";
			System.out.println(query);
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			preparedStatement.executeUpdate();
//			resultSet = preparedStatement.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("exception1");
			e.printStackTrace();
		} finally {
			try {
//				if (resultSet != null) resultSet.close();
				if(preparedStatement!=null) preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void write(String title, String content) {
		try {
			String query = "insert into board (bTitle, bContent, bTime_Make, bTime_Modi) values(?,?,now(),now());";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, content);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(preparedStatement!=null) preparedStatement.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public void modify(String id, String title, String content) {
		try {
			String query = "update board set bTitle=?, bContent=?, bTime_Modi=now() where bId=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, content);
			preparedStatement.setString(3, id);
			preparedStatement.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			
		}
	}
}
