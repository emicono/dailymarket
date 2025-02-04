<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/displaytag" prefix="ds" %>

<%@ page import="ar.com.dailyMarket.model.GroupUser" %>

<ds:table name="items" sort="list"  prop="formDisplaytag" export="false" id="row" pagesize="40" class="list"  cellspacing="0" cellpadding="3">

        <ds:column titleKey="GroupUserForm.name" headerClass="listTitle" property="name"/>
        <ds:column titleKey="GroupUserForm.description" headerClass="listTitle" property="description"/>
        <ds:column headerClass="listTitle"  title="&nbsp;">
			<img 
				src="images/common/editar.gif" 
				onclick="document.location='groupUser.do?VirtualDispatchName=findByPK&id=<%=((GroupUser)row).getId()%>'" 
				alt='<bean:message key="common.edit"/>'
				style="cursor: pointer;"/>
    	</ds:column>
    	<ds:column headerClass="listTitle"  title="&nbsp;">
			<img 
				src="images/common/eliminar.gif" 
				onclick="document.location='filterGroupUser.do?VirtualDispatchName=delete&id=<%=((GroupUser)row).getId()%>'" 
				alt='<bean:message key="common.delete"/>'
				style="cursor: pointer;"/>
    	</ds:column>        
</ds:table>
