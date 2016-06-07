<%@ include file="/common/taglibs.jsp"%>

<menu:useMenuDisplayer name="Velocity" config="navbarMenu.vm" permissions="rolesAdapter">
<div class="collapse navbar-collapse" id="navbar">
<ul class="nav navbar-nav">
    <c:if test="${empty pageContext.request.remoteUser}">
        <li class="active">
            <a href="<c:url value="/login"/>"><fmt:message key="login.title"/></a>
        </li>
    </c:if>
    <menu:displayMenu name="Home"/>
    <menu:displayMenu name="SalesMenu"/>
    <menu:displayMenu name="DocsMenu"/>
    <menu:displayMenu name="TrackingMenu"/>
    <menu:displayMenu name="NhathauMenu"/>
    <menu:displayMenu name="AccountingMenu"/>
    <menu:displayMenu name="AdminMenu"/>
    
</ul>
</div>
</menu:useMenuDisplayer>
