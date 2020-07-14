<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mbrpf.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	MbrpfVO mbrpfVO = (MbrpfVO) request.getAttribute("mbrpfVO"); //mbrpfServlet.java(Concroller), �s�Jreq��mbrpfVO����
	
	if(request.getParameter("mbrpfno") != null){
		String mbrpfno = request.getParameter("mbrpfno");
		MbrpfService mbrpfSvc = new MbrpfService();
		mbrpfVO = mbrpfSvc.getOneMbrpf(mbrpfno);
		request.setAttribute("mbrpfVO", mbrpfVO);
	}
	
	
%>

<html>
<head>
<title>�|����� - listOneMbrpf.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>


<body>

<%@ include file="/back-end/back-end_nav.jsp"%>

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�|����� - ListOneMbrpf.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="<%= request.getContextPath()%>/front-end/images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�|���Ӥ�</th>
			<th>�|���s��</th>
			<th>�@��|���b��</th>
			<th>�@��|���K�X</th>
			<th>�|���m�W</th>
<!-- 			<th>�|���Ӥ�</th> -->
			<th>�X�ͦ~���</th>
			<th>�ʧO</th>
			<th>�q�l�l��</th>
			<th>�q��</th>
			<th>�����ڶ��b��</th>
			<th>�ʺ�</th>
			<th>�I�ƾl�B</th>
			<th>�@��|�����A</th>
			<th>�Q�����`�H��</th>
			<th>�Q�����`�P��</th>
			<th>���X�u����</th>
			<th>�`�ѹΦ���</th>
		</tr>
		<tr>
			<td><img width="100" height="100" src="<%= request.getContextPath()%>/mbrpf/mbrimg.do?mbrno=${mbrpfVO.mbrno}"></td>
			<td>${mbrpfVO.mbrno}</td>
			<td>${mbrpfVO.mbract}</td>
			<td>${mbrpfVO.mbrpw}</td>
			<td>${mbrpfVO.mbrname}</td>
<%-- 			<td><img width="100" height="100" src="<%= request.getContextPath()%>/mbrpf/mbrimg.do?mbrno=${mbrpfVO.mbrno}"></td> --%>
			<td>${mbrpfVO.birth}</td>
			<td>${mbrpfVO.sex}</td>
			<td>${mbrpfVO.mail}</td>
			<td>${mbrpfVO.phone}</td>
			<td>${mbrpfVO.mbrac}</td>
			<td>${mbrpfVO.nickname}</td>
			<td>${mbrpfVO.points}</td>
			<td>${mbrpfVO.status}</td>
			<td>${mbrpfVO.ratedtotal}</td>
			<td>${mbrpfVO.startotal}</td>
			<td>${mbrpfVO.unattend}</td>
			<td>${mbrpfVO.ttattend}</td>
		</tr>
	</table>

</body>
</html>