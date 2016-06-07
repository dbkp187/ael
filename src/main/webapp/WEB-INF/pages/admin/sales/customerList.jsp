<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="customerList.title"/></title>
    <meta name="menu" content="SalesMenu"/>
</head>

<div class="col-sm-12">
    <h2><fmt:message key="customerList.heading"/></h2>
    <div id="actions" class="btn-group">
        <a class="btn btn-primary" href="<c:url value='customer?method=Add&from=list'/>">
            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></a>

        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="fa fa-sign-out"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="customerList" class="display nestedDatatable" cellspacing="0" width="100%"
    	childDetailURL="/admin/sales/offerPriceList/list" 
    	emptyMessage="customerList.offerPrices.empty"
    	detailTableInfo="<fmt:message key="table.no"/>,<fmt:message key="offerPrice.typeOfService"/>,<fmt:message key="offerPrice.dateOffer"/>,<fmt:message key="table.action"/>"
    	detailTableMapping="typeOfServiveText*,dateOffer[Date]"
    	editDetail="/admin/sales/offerPrice"
    	successLoadMessage="customerList.offerPrices.loaded"
    >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/>
                <th><fmt:message key="customer.code"/></th>
                <th><fmt:message key="customer.name"/></th>
                <th><fmt:message key="customer.companyType"/></th>
                <th><fmt:message key="customer.country"/></th>
                <th><fmt:message key="customer.email"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
              <th><fmt:message key="table.no"/>
                <th><fmt:message key="customer.code"/></th>
                <th><fmt:message key="customer.name"/></th>
                <th><fmt:message key="customer.companyType"/></th>
                <th><fmt:message key="customer.country"/></th>
                <th><fmt:message key="customer.email"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${customerList}" var="customer" varStatus="idx">
        	<tr params="customerId=${customer.id}">
                <td colType="index">${idx.index+1}</td>
              	<td>${customer.code}</td>
              	<td>${customer.name}</td>
              	<td>${customer.companyType.value}</td>
              	<td>${customer.country.value}</td>
              	<td>${customer.email}</td>
                <td class="actions">
                	<a href="customer?id=${customer.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
<%--                 	<a href="offerPrice?customerId=${customer.id}" class="iconButton" title="<fmt:message key='button.addOffer'/>"><i class="fa fa-plus"></i></a> --%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

