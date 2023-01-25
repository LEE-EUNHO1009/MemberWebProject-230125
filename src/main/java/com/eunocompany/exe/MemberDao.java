package com.eunocompany.exe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDao {
	
	String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/webdb";
    String username = "root";
    String password = "1234"; 
    
    public int joinMember(String id, String pw, String name, String email) {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO members(id, password, name, email) VALUES (?,?,?,?)"; //int로 해야 성공 여부 확인 가능(void는 확인 불가)
    	
        
        int resultFlag = 0;
        
        try {
           Class.forName(driverName);//드라이버 불러오기
           conn = DriverManager.getConnection(url, username, password);//DB 연동
           
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, id);
           pstmt.setString(2, pw);
           pstmt.setString(3, name);
           pstmt.setString(4, email);
           
           resultFlag = pstmt.executeUpdate();//성공하면 1로 값이 변경
        
        } catch(Exception e) {
           e.printStackTrace();
        } finally {
           try {
              if(pstmt != null) {
                 pstmt.close();
              }
              if(conn != null) {
                 conn.close();
              }            
           }catch(Exception e2) {
              e2.printStackTrace();
           }
           
        }
        
        return resultFlag;
     }
}