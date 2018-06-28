<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String id = (String) session.getAttribute("id");
		class Student {
			String name;
			boolean isNow;
			boolean eye;

			Student(String name, boolean isNow, boolean eye) {
				this.name = name;
				this.isNow = isNow;
				this.eye = eye;
			}
		}
		ArrayList<Student> stu = new ArrayList<Student>();

		int stuCnt = Integer.parseInt(request.getParameter("stuCnt"));
		String[] now=request.getParameterValues("now");
		String[] eye=request.getParameterValues("eye");
		
		for(int i=0;i<stuCnt;i++){
			String name=request.getParameter("name"+(i+1));
			if(name=="")continue;//이름이 없으면 없는 걸로 간주
			boolean a=false;
			boolean b=false;
			if(now!=null){
				for(int j=0;j<now.length;j++){
					if((i+1)==Integer.parseInt(now[j])){
						a=true;
						break;
					}
				}
			}
			if(eye!=null){
				for(int j=0;j<eye.length;j++){
					if((i+1)==Integer.parseInt(eye[j])){
						b=true;
						break;
					}
				}
			}
			stu.add(new Student(name,a,b));
		}
		
		String filePath = application.getRealPath("/WEB-INF/"+id+".txt");
		PrintWriter wr = new PrintWriter(new FileWriter(filePath));
		BufferedWriter bw = new BufferedWriter(wr);
		
		for(int i=0;i<stu.size();i++){
			bw.write(stu.get(i).name+"/"+stu.get(i).isNow+"/"+stu.get(i).eye);
			if(i<stuCnt-1)bw.newLine();
		}
		bw.close();
		wr.flush();
	%>
	<meta http-equiv='refresh' content='0; url=main.jsp'>
</body>
</html>