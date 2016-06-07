<%@ include file="/common/taglibs.jsp"%>
    	<table id="attachmentList" class="display table table-condensed inFormTable" cellspacing="0" width="100%">
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="attachment.fileName"/></th>
                <th><fmt:message key="attachment.description"/></th>
                <th><fmt:message key="attachment.viewFile"/></th>
                <th><fmt:message key="attachment.upFile"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${inland.docsgeneral.attachments}" var="attachment" varStatus="idx">
        	<tr class="${attachment.isAdded == true and empty attachment.id ? 'hidden' :''}">
                <td colType="index">${idx.index+1}</td>
                <td colType="generalInfo" class="hidden">
	                	<form:hidden path="docsgeneral.attachments[${idx.index}].id" />
	                	<form:hidden path="docsgeneral.attachments[${idx.index}].data.id" />
	                	<form:hidden path="docsgeneral.attachments[${idx.index}].isAdded" valueType="added" />
	                	<form:hidden path="docsgeneral.attachments[${idx.index}].isDeleted" valueType="deleted"/>
	            </td>
              	<td>
              			<spring:bind path="docsgeneral.attachments[${idx.index}].fileName">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="docsgeneral.attachments[${idx.index}].fileName" id="fileName${idx.index}" maxlength="250"  cssClass="form-control fileName"/>
					        <form:errors path="docsgeneral.attachments[${idx.index}].fileName" cssClass="help-block"/>
					    </div>
				</td>
              	<td>
              			<spring:bind path="docsgeneral.attachments[${idx.index}].description">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					    </spring:bind>
					        <form:input path="docsgeneral.attachments[${idx.index}].description" id="description${idx.index}" maxlength="250" cssClass="form-control"/>
					        <form:errors path="docsgeneral.attachments[${idx.index}].description" cssClass="help-block"/>
					    </div>
				</td>
				<td class="centerText">
					<c:if test="${not empty attachment.id}">
							<a href="download/offerAttachment?id=${attachment.id}" target="_blank"><i class="fa fa-file-pdf-o"></i></a>
					</c:if>
				</td>
				<td>
							<spring:bind path="docsgeneral.attachments[${idx.index}].data.data">
						    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						    </spring:bind>
						        <input name="docsgeneral.attachments[${idx.index}].data.data" id="data${idx.index}" class="form-control" type="file""/>
						        <form:input path="docsgeneral.attachments[${idx.index}].data.extension" class="hidden"/>
						        <form:errors path="docsgeneral.attachments[${idx.index}].data.data" cssClass="help-block"/>
						    </div>
				</td>
				<c:if test="${empty offerPrice.isValid or offerPrice.isValid==false}">
	                <td>
	                	<span class="iconButton removeRow" title="<fmt:message key='table.buttonEditTitle'/>">
		                			<i class="fa fa-trash"></i>
		                	</span>
	                </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
	    <div class="row">
		    	<div class="col-md-10"></div>
		    	<div class="col-md-2">
		    		<span class="btn btn-primary" target-table="attachmentList">
			            <i class="fa fa-plus"></i> <fmt:message key="button.add"/></span>
		    	</div>
	    </div>
    <hr>
     <script type="text/javascript" src="<c:url value='/scripts/custom/attachments.js'></c:url>"></script>