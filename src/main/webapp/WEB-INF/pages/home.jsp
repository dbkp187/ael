<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="home.title"/></title>
</head>
<body class="home">

<h2><fmt:message key="home.heading"/></h2>
<p><fmt:message key="home.message"/></p>
<hr>
	<security:authorize ifAnyGranted="ROLE_USER">
		<div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="Home"/>
                </menu:useMenuDisplayer>
        </div>
	</security:authorize> 
	
    <security:authorize ifAnyGranted="ROLE_DOCS,ROLE_ADMIN"> 
    	 		<div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="DocsMenu"/>
                </menu:useMenuDisplayer>
                </div>
    </security:authorize>
    
    <security:authorize ifAnyGranted="ROLE_TRUCK,ROLE_ADMIN"> 
    	 		<div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="TrackingMenu"/>
                </menu:useMenuDisplayer>
                </div>
    </security:authorize>
    
    <security:authorize ifAnyGranted="ROLE_NHATHAU,ROLE_ADMIN"> 
    	 		<div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="NhathauMenu"/>
                </menu:useMenuDisplayer>
                </div>
    </security:authorize>
    
     <security:authorize ifAnyGranted="ROLE_ACCOUNTING,ROLE_ADMIN"> 
    	 		<div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="AccountingMenu"/>
                </menu:useMenuDisplayer>
                </div>
    </security:authorize>
    
    <security:authorize ifAnyGranted="ROLE_ADMIN"> 
                <div class="col-sm-2">
                <menu:useMenuDisplayer name="Velocity" config="navlistMenu.vm" permissions="rolesAdapter">
                    <menu:displayMenu name="AdminMenu"/>
                </menu:useMenuDisplayer>
                </div>
    </security:authorize>        
            
</body>