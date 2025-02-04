<!--VENTAS MENSUALES POR PRODUCTO FILTER-->
<%@ page language="java" %>

<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/displaytag" prefix="ds" %>
<%@ page import="java.util.*" %>

<%
ArrayList<String> listaAnios = (ArrayList<String>) request.getAttribute("aniosList");
ArrayList<String> listaMeses = (ArrayList<String>)request.getAttribute("mesesList");
%>

<TABLE class="form"  border="0" cellpadding="0" cellspacing="0">	
	<TR> 
		<TD colspan="4"> 
			<ul class="errors" type="square">
				<html:messages id="mensaje" message="true" >
					<li><bean:write name="mensaje" /></li>
				</html:messages>
			</ul>
		</TD>
	</TR>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>	
	<TR>
		<TD colspan="4">
			<h1 class="formtitle"><bean:message key="estadisticas.ventasMensualesPorProductoFilter"/></h1>
		</TD>		
	</TR>		
	<tr align="left">
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr align="left">
		<th style="width:100px;padding-left:40px;"><bean:message key="commons.year"/></th>
		<td width="100px;">
			<html:select property="year">
				<% for(int i = 0; i < listaAnios.size(); i++) { %>
					<html:option  value="<%= listaAnios.get(i) %>"><%= listaAnios.get(i) %></html:option>
				<% } %>
			</html:select>
		</td>
		<th style="width:100px;padding-left:40px;"><bean:message key="commons.mes"/></th>		
		<td>
			<html:select property="month">
				<% for(Integer i = 0; i < listaMeses.size(); i++) { %>
					<html:option  value="<%= i.toString() %>"><%= listaMeses.get(i) %></html:option>
				<% } %>
			</html:select>
		</td>
	</tr>
	<tr align="left">
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr align="left">
		<th style="width:100px;padding-left:40px;"><bean:message key="commons.productos"/></th>
		<td width="100px;">
			<html:select property="productId">						
				<html:options collection="products" property="id" labelProperty="name" />				
			</html:select>
		</td>
		<th style="width:100px;padding-left:40px;"><bean:message key="commons.bandaHoraria"/></th>		
		<td>
			<html:select property="bandaHorariaId">
				<html:option value="-1">&nbsp;</html:option>
				<html:options collection="bandaList" property="id" labelProperty="detail"/>
			</html:select>
		</td>
	</tr>	
</TABLE>