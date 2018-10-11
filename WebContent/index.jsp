<%@ page import="java.sql.*"%>  
  
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter id");  
}else{  
int id=Integer.parseInt(s);  
out.print(id);  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/m1033511","root","root1234");  
PreparedStatement ps=con.prepareStatement("select * from employee where empid=?");  
ps.setInt(1,id);  
ResultSet rs=ps.executeQuery();  
while(rs.next()){  
out.print(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getDouble(3)+" "+rs.getString(4));  
}  
con.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>  