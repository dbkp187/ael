<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="accountingvantai.title"/></title>
    <meta name="menu" content="AccountingMenu"/>
</head>

<div class="col-sm-10">
    <h2><fmt:message key="accountingvantai.title"/></h2>
    <form:errors path="*" cssClass="alert alert-danger alert-dismissable" element="div"/>
    <form  method="get" action="vantai" id="accountingvantaiForm" class="well">
     <div class="container-fluid">
    	<div class="row">
		    <div class="form-group col-md-8">
		    <appfuse:label styleClass="control-label" key="accountingvantai.loai"/>
		    <select name="transId" class="form-control">
	    			<c:forEach items="${vantaiList}" var="ser">
	    				<option value="${ser.key}"><fmt:message key="${ser.value}"/></option>
	    			</c:forEach>
	    	</select>
		    </div>
		    
		    <div class="form-group col-md-2">
		    <appfuse:label styleClass="control-label" key="accounting.month"/>
		    <select name="month" class="form-control">
	    			<c:forEach begin="1" end="12" var="month">
	    				<option value="${month}">${month}</option>
	    			</c:forEach>
	    	</select>
		    </div>
		    
		    <div class="form-group col-md-2">
		    <appfuse:label styleClass="control-label" key="accounting.year"/>
		    <select name="year" class="form-control">
	    			<c:forEach begin="2015" end="2016" var="year">
	    				<option value="${year}">${year}</option>
	    			</c:forEach>
	    	</select>
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
    </form>
</div>

