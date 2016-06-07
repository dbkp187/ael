<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accountingTrans.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="accountingTrans.heading"/></h2>
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <div class="col-sm-12">
	    <form:form commandName="conditions" method="get"
			action="transportSearch" id="accountingtranForm" cssClass="well">
		     <div class="container-fluid">
		    	<div class="row">
				    <div class="form-group col-md-6">
				    <appfuse:label styleClass="control-label" key="customer.name"/>
				    <form:select path="customerId" class="form-control">
				    	<form:option value=""><fmt:message key="searchall" /></form:option>
		    			<c:forEach items="${customers}" var="customer">
				    				<c:choose>
					                    <c:when test="${customer.id == conditions.customerId}">
					                        <option value="${customer.id}" selected="selected">${customer.code} - ${customer.name}</option>
					                    </c:when>
					                    <c:otherwise>
					                        <option value="${customer.id}">${customer.code} - ${customer.name}</option>
					                    </c:otherwise>
					                </c:choose>
		    				
		    			</c:forEach>
			    	</form:select>
				    </div>
				    <div class="form-group col-md-3">
					    <appfuse:label styleClass="control-label" key="accountingnhathau.startdate"/>
					    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
				    </div>
				    
				    <div class="form-group col-md-3">
					    <appfuse:label styleClass="control-label" key="accountingnhathau.enddate"/>
					    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
				    </div>
				     <div class="form-group col-md-12">
						<appfuse:label styleClass="control-label"
							key="accountingnhathau.jobNo" />
						<form:select path="jobList" id="jobList" 
							cssClass="form-control select2" multiple="false">
							<form:option value=""><fmt:message key="searchall" /></form:option>
							<form:options items="${jobList}"/>
						</form:select>
					</div>
		    	</div>
		    </div>
		     <hr>
		    <div class="form-group form-actions">
		    <button class="btn btn-primary">
		    	<i class="fa fa-search"></i> <fmt:message key="button.search"/>
		    	<input type="submit" style="display: none;"/>
		    </button>
	    </div>
	    </form:form>
    </div>
    <fmt:formatDate value="${accountingNhathau.condition.startDate}" var="startDate" 
               type="date" pattern="dd/MM/yyyy" />
	<fmt:formatDate value="${accountingNhathau.condition.endDate}" var="endDate" 
               type="date" pattern="dd/MM/yyyy" />
    <c:if test="${not empty accountingTrans.condition.jobList }">
    	<c:forEach items="${accountingTrans.condition.jobList }" var="job">
    		<c:set var="listJob" value="&jobList=${job}${listJob}" />    		
    	</c:forEach>
    	<c:set var="sum" value="${fn:replace(listJob, 'amp;', '')}" />    
    </c:if>
    
    <table id="packageInfoList" class="datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="accountingtrans.companyName"/></th>
                <th><fmt:message key="accountingtrans.address"/></th>
                <th><fmt:message key="accountingtrans.taxno"/></th>
                <th><fmt:message key="accountingtrans.tel"/></th>
                <th><fmt:message key="accountingtrans.fax"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="accountingtrans.companyName"/></th>
                <th><fmt:message key="accountingtrans.address"/></th>
                <th><fmt:message key="accountingtrans.taxno"/></th>
                <th><fmt:message key="accountingtrans.tel"/></th>
                <th><fmt:message key="accountingtrans.fax"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${listCustomer}" var="cus" varStatus="idx">
        	<tr>
                <td>${idx.index+1}</td>
              	<td>${cus.name}</td>
              	<td>${cus.address}</td>
              	<td>${cus.taxno}</td>  
              	<td>${cus.tel}</td>
              	<td>${cus.fax}</td>             	
                <td>
                	<fmt:formatDate value="${accountingTrans.condition.startDate}" pattern="dd/MM/yyyy" var="startDate"/>
                	<fmt:formatDate value="${accountingTrans.condition.endDate}" pattern="dd/MM/yyyy" var="endDate"/>
                	<a href="transport?customerId=${cus.id}&startDate=${startDate}&endDate=${endDate}&_jobList=1${sum}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>                	
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

