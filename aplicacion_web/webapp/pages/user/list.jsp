<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/displaytag" prefix="ds" %>

<%@ page import="ar.com.dailyMarket.model.User" %>

<ds:table name="items" sort="list"  prop="formDisplaytag" export="false" id="row" pagesize="40" class="list"  cellspacing="0" cellpadding="3">
		<ds:column titleKey="UserForm.id" headerClass="listTitle" property="id"/>
		<ds:column titleKey="UserForm.user" headerClass="listTitle" property="user"/>
        <ds:column titleKey="UserForm.name" headerClass="listTitle" property="name"/>
        <ds:column titleKey="UserForm.lastName" headerClass="listTitle" property="lastName"/>
        <ds:column titleKey="UserForm.dni" headerClass="listTitle" property="dni"/>
        <ds:column titleKey="UserForm.groupUser" headerClass="listTitle" property="groupUser.name"/>
        <ds:column headerClass="listTitle"  title="&nbsp;">
			<img 
				src="images/common/editar.gif" 
				onclick="document.location='user.do?VirtualDispatchName=findByPK&id=<%=((User)row).getId()%>'" 
				alt='<bean:message key="common.edit"/>'
				style="cursor: pointer;"/>
    	</ds:column>
    	<ds:column headerClass="listTitle"  title="&nbsp;">
			<img 
				src="images/common/eliminar.gif" 
				onclick="document.location='filterUser.do?VirtualDispatchName=delete&user=<%=((User)row).getUser()%>'" 
				alt='<bean:message key="common.delete"/>'
				style="cursor: pointer;"/>
    	</ds:column>        
</ds:table>
