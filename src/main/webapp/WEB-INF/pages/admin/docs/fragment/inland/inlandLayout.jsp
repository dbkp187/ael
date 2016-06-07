<%@ include file="/common/taglibs.jsp"%>
	    <div class="row">
		    <spring:bind path="inland.docsgeneral.jobNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.jobNo"/>
		        <form:input path="docsgeneral.jobNo" id="jobNo" maxlength="45"  cssClass="form-control" readonly="true"/>
		        <form:errors path="docsgeneral.jobNo" cssClass="help-block"/>
		    </div>
		    <c:choose >
		    	<c:when test="${empty  inland.docsgeneral.customer}">
				   	<spring:bind path="inland.docsgeneral.customer.code">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.customerCode"/>
				        <form:select path="docsgeneral.customer.id" id="customercode"  cssClass="form-control select2">
				        	<c:forEach items="${docsSelection.customers}" var="cust">
				        		<form:option value="${cust.id}">${cust.code}</form:option>
				        	</c:forEach>
				        </form:select>
				        <form:errors path="docsgeneral.customer.id" cssClass="help-block"/>
				    </div>
				</c:when>
				<c:otherwise>
					<form:hidden path="docsgeneral.customer.id"/>
					<spring:bind path="inland.docsgeneral.customer.code">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.customerCode"/>
				        <form:input path="docsgeneral.customer.code" id="customercode" maxlength="45"  cssClass="form-control" disabled="true"/>
				        <form:errors path="docsgeneral.customer.code" cssClass="help-block"/>
				    </div>
				</c:otherwise>
		    </c:choose>
		    
		    <spring:bind path="inland.docsgeneral.docReceiveDate">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.docReceiveDate"/>
		        <form:input path="docsgeneral.docReceiveDate" provide="datepicker" id="docReceiveDate" maxlength="45"  cssClass="form-control"/>
		        <form:errors path="docsgeneral.docReceiveDate" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="inland.docsgeneral.typeOfContainer">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.typeOfContainer"/>
		        <c:if test="${inland.docsgeneral.doDelivery}">
			        <form:select 
		         showElements="-2:refNo,inlandSizesContainer,inlandSizeTab;-1:dateCutOff,dateExpired,contTypesListContainer,contsealListContainer,servicesTab,contTypesTab"
		        path="docsgeneral.typeOfContainer.id" id="typeOfContainer"   cssClass="form-control selectReadOnly" items="${docsSelection.selections['typeOfContainers']}"/>
		        <form:hidden path="docsgeneral.typeOfContainer.id"/>
			     </c:if>
			     <c:if test="${!inland.docsgeneral.doDelivery}">
			      <form:select 
		         showElements="-2:refNo,inlandSizesContainer,inlandSizeTab;-1:dateCutOff,dateExpired,contTypesListContainer,contsealListContainer,servicesTab,contTypesTab"
		        path="docsgeneral.typeOfContainer.id" id="typeOfContainer"   cssClass="form-control" items="${docsSelection.selections['typeOfContainers']}"/>
			       </c:if>
		        <form:errors path="docsgeneral.typeOfContainer.id" cssClass="help-block"/>
		    </div>
		    
	     	<spring:bind path="inland.docsgeneral.processingStaff">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.processingStaff"/>
		        <form:select path="docsgeneral.processingStaff.id" id="processingStaff"  cssClass="form-control select2">
		        	<c:forEach items="${docsSelection.staff}" var="st">
		        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option>
		        	</c:forEach>
		        </form:select>
		        <form:errors path="docsgeneral.processingStaff.id" cssClass="help-block"/>
		    </div>
		    
		   <%--  <spring:bind path="inland.docsgeneral.typeOfImport">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="configuration.typeOfImport"/>
		        <form:select path="docsgeneral.typeOfImport.id" id="typeOfImport"  
		        cssClass="form-control select2" items="${docsSelection.selections['importTypes']}"/>
		        <form:errors path="docsgeneral.typeOfImport.id" cssClass="help-block"/>
		    </div> --%>
		    
		    <spring:bind path="inland.docsgeneral.productDescription">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6 ">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.productDescription"/>
		        <form:textarea path="docsgeneral.productDescription" id="productDescription" maxlength="2000" cssClass="form-control "/>
		        <form:errors path="docsgeneral.processingStaff" cssClass="help-block"/>
		    </div>
		    
	    	 <spring:bind path="inland.docsgeneral.note">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6 has-warning">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.note"/>
		        <form:textarea path="docsgeneral.note" id="note" maxlength="2000" cssClass="form-control "/>
		        <form:errors path="docsgeneral.note" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="inland.typeOfInland">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.typeOfInland"/>
		        <form:select path="typeOfInland.id" id="typeOfInland"   cssClass="form-control" items="${docsSelection.selections['docsTypeOfServices']}"/>
		        <form:errors path="typeOfInland.id" cssClass="help-block"/>
		    </div>
		    
		    <%-- <spring:bind path="inland.dateRecPack">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.dateRecPack"/>
			        <form:input path="dateRecPack" provide="datepicker" id="dateRecPack"  cssClass="form-control"/>
			        <form:errors path="dateRecPack" cssClass="help-block"/>
			    </div>
			    
			    <spring:bind path="inland.dateDevPack">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.dateDevPack"/>
			        <form:input path="dateDevPack" provide="datepicker" id="dateDevPack"  cssClass="form-control"/>
			        <form:errors path="dateDevPack" cssClass="help-block"/>
			    </div> --%>
			    
			    <spring:bind path="inland.attachServices">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.attachServices"/>
					        <form:input path="attachServices" id="attachServices" maxlength="255"  cssClass="form-control"/>
					        <form:errors path="attachServices" cssClass="help-block"/>
					    </div>
					    
		    	<spring:bind path="inland.docsgeneral.placeRev">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.gettingPlace"/>
			        <form:input path="docsgeneral.placeRev" id="placeRev"  maxlength="255" cssClass="form-control"/>
			        <form:errors path="docsgeneral.placeRev" cssClass="help-block"/>
			    </div>
			    
			    <spring:bind path="inland.docsgeneral.placeDelivery">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.deliveryPlace"/>
			        <form:input path="docsgeneral.placeDelivery" id="placeDelivery"  maxlength="255" cssClass="form-control"/>
			        <form:errors path="docsgeneral.placeDelivery" cssClass="help-block"/>
			    </div>
			    
			    <%-- <spring:bind path="inland.docsgeneral.placeRev1">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.gettingPlace2"/>
			        <form:input path="docsgeneral.placeRev1" id="placeRev1"   cssClass="form-control"/>
			        <form:errors path="docsgeneral.placeRev1" cssClass="help-block"/>
			    </div>
			    
			    <spring:bind path="inland.docsgeneral.placeDelivery1">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.deliveryPlace2"/>
			        <form:input path="docsgeneral.placeDelivery1" id="deliveryPlace2"   cssClass="form-control"/>
			        <form:errors path="docsgeneral.placeDelivery1" cssClass="help-block"/>
			    </div> --%>
			    
<%-- 			    <spring:bind path="inland.docsgeneral.contactDelivery"> --%>
<%-- 				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6"> --%>
<%-- 				    </spring:bind> --%>
<%-- 				        <appfuse:label styleClass="control-label" key="inland.contactDelivery"/> --%>
<%-- 				        <form:input path="docsgeneral.contactDelivery" id="contactDelivery"   cssClass="form-control"/> --%>
<%-- 				        <form:errors path="docsgeneral.contactDelivery" cssClass="help-block"/> --%>
<!-- 				    </div> -->
				    
<%-- 				    <spring:bind path="inland.docsgeneral.infoInvoice"> --%>
<%-- 				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6"> --%>
<%-- 				    </spring:bind> --%>
<%-- 				        <appfuse:label styleClass="control-label" key="inland.infoInvoice"/> --%>
<%-- 				        <form:input path="docsgeneral.infoInvoice" id="infoInvoice"   cssClass="form-control"/> --%>
<%-- 				        <form:errors path="docsgeneral.infoInvoice" cssClass="help-block"/> --%>
<!-- 				    </div>	 -->
				    <spring:bind path="inland.docsgeneral.noOfPkgs">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.noOfPkgs"/>
				        <form:input path="docsgeneral.noOfPkgs" id="noOfPkgs" maxlength="10"  cssClass="form-control number"/>
				        <form:errors path="docsgeneral.noOfPkgs" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.docsgeneral.weigth">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.weigth"/>
				        <form:input path="docsgeneral.weigth" id="weigth" maxlength="12"  cssClass="form-control money2"/>
				        <form:errors path="docsgeneral.weigth" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.docsgeneral.cmb">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.cmb"/>
				        <form:input path="docsgeneral.cmb" id="cmb" maxlength="13"  cssClass="form-control money3"/>
				        <form:errors path="docsgeneral.cmb" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.otherInfo">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.otherInfo"/>
				        <form:input path="otherInfo" id="otherInfo"  maxlength="45" cssClass="form-control"/>
				        <form:errors path="otherInfo" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.refNo">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6" id="refNo">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.refNo"/>
				        <form:input path="refNo" maxlength="45"  cssClass="form-control"/>
				        <form:errors path="refNo" cssClass="help-block"/>
				    </div>
	    	</div>
	    	
	    	<div class="row">
				    <%-- <spring:bind path="inland.docsgeneral.placeEmptyUp">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.placeEmptyUp"/>
					        <form:input path="docsgeneral.placeEmptyUp" id="placeEmptyUp"  cssClass="form-control"/>
					        <form:errors path="docsgeneral.placeEmptyUp" cssClass="help-block"/>
					    </div>
					    
					<spring:bind path="inland.docsgeneral.placeEmptyDown">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.placeEmptyDown"/>
					        <form:input path="docsgeneral.placeEmptyDown" id="placeEmptyDown"   cssClass="form-control"/>
					        <form:errors path="docsgeneral.placeEmptyDown" cssClass="help-block"/>
					    </div> --%>

					    <spring:bind path="inland.dateCutOff">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3" id="dateCutOff">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.dateCutOff"/>
					        <form:input path="dateCutOff" provide="datepicker"  cssClass="form-control"/>
					        <form:errors path="dateCutOff" cssClass="help-block"/>
					    </div>
					     <spring:bind path="inland.dateExpired">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3" id="dateExpired">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.dateExpired"/>
					        <form:input path="dateExpired" provide="datepicker"  cssClass="form-control"/>
					        <form:errors path="dateExpired" cssClass="help-block"/>
					    </div>
	    	</div>
	    </div>
