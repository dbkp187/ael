<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accountingnhathau.title"/></title>
    <meta name="menu" content="NhathauMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="accountingnhathau.heading"/></h2>
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form:form commandName="conditions" method="get"
		action="nhathauSearch" id="accountingNhathauForm" cssClass="well">
	     <div class="container-fluid">
	    	<div class="row">
			    <div class="form-group col-md-3">
				    <appfuse:label styleClass="control-label" key="nhathau.name"/>
				    <form:select path="nhathauId" id="nhathauId" class="form-control">
				    	<form:option value=""><fmt:message key="searchall" /></form:option>
		    			<c:forEach items="${nhathauList}" var="nhathau">
		    				<c:choose>
			                    <c:when test="${conditions.nhathauId == nhathau.id}">
			                        <option value="${nhathau.id}" selected="selected">${nhathau.code}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${nhathau.id}">${nhathau.code}</option>
			                    </c:otherwise>
			                </c:choose>
		    			</c:forEach>
			    	</form:select>
			    </div>
			    
			    <div class="form-group col-md-2">
					<appfuse:label styleClass="control-label"
						key="customer.title" />
					<form:select path="customerId" id="customercode"
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<c:forEach items="${docsSelection.customers}" var="cust">
							<form:option value="${cust.id}">${cust.code}</form:option>
						</c:forEach>
					</form:select>
				</div>
				
				<div class="form-group col-md-2">
					<appfuse:label styleClass="control-label"
						key="accountingnhathau.jobNo" />
					<form:select path="job" id="job" 
						cssClass="form-control select2">
						<form:option value=""><fmt:message key="searchall" /></form:option>
						<form:options items="${jobList }"/>
					</form:select>
				</div>
				
			    <div class="form-group col-md-2">
				    <appfuse:label styleClass="control-label" key="accountingnhathau.startdate"/>
				    <form:input path="startDate" provide="datepicker" maxlength="45"  class="form-control" id="startDate"/>
			    </div>
			    
			    <div class="form-group col-md-2">
				    <appfuse:label styleClass="control-label" key="accountingnhathau.enddate"/>
				    <form:input path="endDate" provide="datepicker" maxlength="45"  class="form-control" id="endDate"/>
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
    <fmt:formatDate value="${accountingNhathau.condition.startDate}" var="startDate" 
               type="date" pattern="dd/MM/yyyy" />
	<fmt:formatDate value="${accountingNhathau.condition.endDate}" var="endDate" 
               type="date" pattern="dd/MM/yyyy" />
    <table id="packageInfoList" class="datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
            	<th><fmt:message key="accountingnhathau.code"/></th>
                <th><fmt:message key="accountingnhathau.name"/></th>
                <th><fmt:message key="accountingnhathau.address"/></th>
                <th><fmt:message key="accountingnhathau.taxno"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="accountingnhathau.code"/></th>
                <th><fmt:message key="accountingnhathau.name"/></th>
                <th><fmt:message key="accountingnhathau.address"/></th>
                <th><fmt:message key="accountingnhathau.taxno"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${listNhathau}" var="nhathau" varStatus="idx">
        	<tr>
                <td>${idx.index+1}</td>
                <td>${nhathau.code}</td>
              	<td>${nhathau.name}</td>
              	<td>${nhathau.address}</td>
              	<td>${nhathau.taxNo}</td>              	
                <td>
                	<a href="nhathauDetail?nhathauId=${nhathau.id}&startDate=${startDate}&endDate=${endDate}&customerId=${accountingNhathau.condition.customerId}&job=${accountingNhathau.condition.job}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
