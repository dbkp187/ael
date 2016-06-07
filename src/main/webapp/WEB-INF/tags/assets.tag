<%@ tag body-content="empty" %>
<%@ attribute name="group" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="base" value="${pageContext.request.contextPath}"/>
<c:if test="${empty group}"><c:set var="group" value="main"/></c:if>
<c:if test="${not empty param.debug}">
    <c:set var="debugAssets" value="${param.debug}" scope="session"/>
</c:if>
<c:choose>

    <c:when test="${sessionScope.debugAssets}">
        <link rel="stylesheet" type="text/css" href="${base}/webjars/bootswatch/3.0.0/spacelab/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${base}/styles/style.css"/>
        <link rel="stylesheet" type="text/css" href="${base}/scripts/libs/datatable/css/jquery.dataTables.css"/>

        <script type="text/javascript" src="${base}/webjars/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="${base}/webjars/bootstrap/3.0.2/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${base}/webjars/jquery-cookie/1.3.1/jquery.cookie.js"></script>
        <script type="text/javascript" src="${base}/scripts/script.js"></script>
        <script type="text/javascript" src="${base}/scripts/libs/datatable/js/jquery.dataTables.js"></script>
    </c:when>
    <c:otherwise>
<%--         <link rel="stylesheet" type="text/css" href="${base}/assets/v/${applicationScope.assetsVersion}/${group}.css"/> --%>
<%--         <script type="text/javascript" src="${base}/assets/v/${applicationScope.assetsVersion}/${group}.js"></script> --%>
<%-- 		<link rel="stylesheet" type="text/css" href="${base}/webjars/bootswatch/3.0.0/united/bootstrap.min.css"/> --%>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/bootswatch-united/3.3.1+2/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/font-awesome/4.2.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/datatables/1.10.4/css/jquery.dataTables.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/datatables-bootstrap/2-20120201/DT_bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/Eonasdan-bootstrap-datetimepicker/4.7.14/bootstrap-datetimepicker.min.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker.min.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/select2/3.5.2/select2.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/select2-bootstrap-css/1.4.4/select2-bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${base}/webjars/pnotify/2.0.1/pnotify.core.css"/>
        <link rel="stylesheet" type="text/css" href="${base}/styles/style.css"/>
<%--         <link rel="stylesheet" type="text/css" href="${base}/styles/slate.css"/> --%>
        <link rel="stylesheet" type="text/css" href="${base}/styles/united.css"/>
        
        <script type="text/javascript" src="${base}/webjars/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript" src="${base}/webjars/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${base}/webjars/jquery-cookie/1.3.1/jquery.cookie.js"></script>
        <script type="text/javascript" src="${base}/webjars/datatables/1.10.4/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${base}/webjars/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="${base}/webjars/momentjs/2.9.0/moment.js"></script>
        <script type="text/javascript" src="${base}/webjars/Eonasdan-bootstrap-datetimepicker/4.7.14/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="${base}/webjars/select2/3.5.2/select2.js"></script>
        <script type="text/javascript" src="${base}/webjars/pnotify/2.0.1/pnotify.core.js"></script>
        <script type="text/javascript" src="${base}/webjars/jquery-i18n-properties/1.0.9/jquery.i18n.properties.js"></script>
		<script type="text/javascript" src="${base}/scripts/libs/jquery.blockUI.js"></script>
		<script type="text/javascript" src="${base}/scripts/libs/accounting.js"></script>
		<script type="text/javascript" src="${base}/scripts/libs/bootstrap.file-input.js"></script>
		<script type="text/javascript" src="${base}/scripts/inFormTable.js"></script>
		<script type="text/javascript" src="${base}/scripts/inFormTableWithDetail.js"></script>
		<script type="text/javascript" src="${base}/scripts/nestedDatatable.js"></script>
		<script type="text/javascript" src="${base}/scripts/custom/selectionControl.js"></script>
        <script type="text/javascript" src="${base}/scripts/utils.js"></script>
        <script type="text/javascript" src="${base}/scripts/script.js"></script>
        <script type="text/javascript" src="${base}/scripts/jquery.confirm.min.js"></script>
    </c:otherwise>
</c:choose>
