<%@ page language="java" %>

<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/displaytag" prefix="ds" %>
<%@ page import="ar.com.dailyMarket.model.Product" %>

<bean:define id="ssop" property="simulatedSizeOfPurchaseArray" name="SimulatorForm" type="java.lang.String[]"></bean:define>
<bean:define id="srs" property="simulatedRepositionStockArray" name="SimulatorForm" type="java.lang.String[]"></bean:define>

<script type="text/javascript" src="yui/yahoo-min.js"></script>
<script type="text/javascript" src="yui/event-min.js"></script>

<script type="text/javascript">
var combo = eval(<bean:write property="comboProductos" name="SimulatorForm" filter="false"/>);
var productId = <bean:write property='productId' name='SimulatorForm' filter='false'/>;

function init() {
	changeCombo(document.getElementById("groupProducts"));
    if(productId != -1) {
		var products = document.getElementById("products");
		for(var i=0; i < products.options.length; i++){
			if(products.options[i].value == productId){
				products.selectedIndex = i;
				break;
			}
		}
    }
    
   	var checks = document.SimulatorForm.simuladorArray;
	var val = document.SimulatorForm.all;
	if (checks != undefined){
		onchecks();
	} else {
		val.disabled = true
	}
}

YAHOO.util.Event.onDOMReady(init);

function changeCombo(grupoProd) {
	var products = document.getElementById("products");
   	products.options.length = 0;
   	
   	if (grupoProd[grupoProd.selectedIndex].value == -1) {
		products.options[0]=new Option("TODOS", -1, true);
		var j = 1;
		for(var i = 0; i < combo.length; i++){
			var jsonPr = eval(combo[i]);
			products.options[j] = new Option(jsonPr.product, jsonPr.productId, false);
			j++;
		}
		products.selectedIndex = 0;
	} else {
		products.options[0] = new Option("TODOS", -1, true);
		var j = 1;
		for(var i = 0; i  < combo.length; i++) {
			var jsonPr = eval(combo[i]);
			if(jsonPr.groupId == grupoProd[grupoProd.selectedIndex].value) {
				products.options[j] = new Option(jsonPr.product, jsonPr.productId, false);
				j++;
			}
		}
		products.selectedIndex = 0;
	}
}







function checkOrUncheckAll(){
	var checks = document.SimulatorForm.simuladorArray;
	var val = document.SimulatorForm.all;
	if (val.checked)
		checkAll(checks);
	else
		uncheckAll(checks);
}

function checkAll(checks) {
	for (i = 0; i < checks.length; i++)
		checks[i].checked = true;
}

function uncheckAll(checks) {
	for (i = 0; i < checks.length; i++)
		checks[i].checked = false;
}

function onchecks() {
	var checks = document.SimulatorForm.simuladorArray;
	var val = document.SimulatorForm.all;
	for (i = 0; i < checks.length; i++) {
		if(checks[i].checked) {
			val.checked = true;
			break;
		}
	}
	if(i==checks.length)
		val.checked = false;
}
</script>

<TABLE class="form" cellSpacing="0" cellPadding="0" border="0">
	<TR> 
	    <TD colspan="4" align="left" valign="top"> 
			<h1 class="formtitle"><bean:message key="simulator.home"/></h1>
	    </TD> 
	</TR>
	<TR> 
		<TD colspan="4"> 
			<html:errors/>
		</TD>
	</TR> 
	<tr>
		<td colspan="4">&nbsp;</td>	
	</tr>
	<TR>
		<TH style="width:100px;padding-left:40px;"><bean:message key="ProductForm.groupProduct"/></TH>
		<TD width="100px;">
			<html:select property="groupProductId" styleId="groupProducts" onchange="changeCombo(this)">						
				<OPTION VALUE="-1">TODOS</OPTION>
				<html:options collection="groupsProduct" property="id" labelProperty="name" />				
			</html:select>
		</TD>
		<TH style="width:100px;padding-left:40px;"><bean:message key="reportes.ventasAnuales.producto"/></TH>
		<TD>
			<html:select property="productId" styleId="products">						
			</html:select>
		</TD>
	</TR>
	<tr>
		<td colspan="4">&nbsp;</td>	
	</tr>
	<tr>
		<td colspan="4">
			<TABLE align="right" class="buttons" border="0" cellspacing="0" cellpadding="3">
				<TR>	
					<td width="100%">&nbsp;</td>
					<TD align="right"  width="130px" >        				
					   <input width="130px" class="btn" value="Filtrar"
							 onclick="forms[0].VirtualDispatchName.value='executeFilter'; forms[0].submit();">
					</TD>	
				</TR>
			</TABLE>
		</td>	
	</tr>
	
<!--	SI SE APLICO EL FILTRO SE MUESTRA LO SIGUIENTE	-->
	<logic:notEmpty name="productsList">
		<TR>		
			<TH style="width:100px;padding-left:40px;"><bean:message key="SimulatorForm.daysSimulator"/></TH>
			<TD width="100px;"><html:text property="days" size="10"  maxlength="5"/></TD>
			<TH style="width:100px;padding-left:40px;"><bean:message key="SimulatorForm.margen"/></TH>
			<TD><html:text property="margen" size="10"  maxlength="5"/></TD>
		</TR>
		<tr>
			<td colspan="4">&nbsp;</td>	
		</tr>
		<TR>
			<TH style="width:100px;padding-left:40px;"><bean:message key="SimulatorForm.yearFrom"/></TH>			
			<TD width="100px;">
				<html:select property="yearFrom">
					<html:option value="2009">2009</html:option>
					<html:option value="2008">2008</html:option>
					<html:option value="2008">2007</html:option>
				</html:select>
			</TD>
			<TH style="width:100px;padding-left:40px;"><bean:message key="SimulatorForm.simulatedDate"/></TH>
			<TD><html:text property="simulatedDay" size="10"  maxlength="10"/></TD>
		</TR>
		<tr>
			<td colspan="4">&nbsp;</td>	
		</tr>		
		<tr>
			<td colspan="4">
				<TABLE align="right" class="buttons" border="0" cellspacing="0" cellpadding="3">
					<TR>	
						<td width="100%">&nbsp;</td>
						<TD align="right"  width="130px" >        				
						   <input width="130px" class="btn" value="Ejecutar Simulación" readonly="readonly"
								 onclick="forms[0].VirtualDispatchName.value='executeSimulator'; forms[0].submit();">
						</TD>	
						<TD align="right"  width="130px" >        				
						   <input width="130px" class="btn" value="Aplicar Cambios" readonly="readonly"
								 onclick="forms[0].VirtualDispatchName.value='aplicarCambios'; forms[0].submit();">
						</TD>	
					</TR>
				</TABLE>
			</td>	
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>	
		</tr>
		<TR> 
		    <TD colspan="4" align="left" valign="top"> 
				<h1 class="formtitle"><bean:message key="simulator.result"/></h1>
		    </TD> 
		</TR>

		<table width="100%" align="left" style="margin-left: 15px; clear:right;">
			<tr>
				<td>
					<% Integer i = 0; %>
					<ds:table name="productsList" sort="list"  prop="formDisplaytag" export="false" id="row" pagesize="40" class="list"  cellspacing="0" cellpadding="3" decorator="ar.com.dailyMarket.ui.decorators.ProductDecorator">
					        <ds:column titleKey="ProductForm.code" headerClass="listTitle" property="code"/>
					        <ds:column titleKey="ProductForm.name" headerClass="listTitle" property="name"/>
					        <ds:column titleKey="ProductForm.description" headerClass="listTitle" property="description"/>       
					        
					        <ds:column titleKey="simulator.ActualSizeOfPurchase" headerClass="listTitle">
					        	<%= ((Product)row).getSizeOfPurchase() %>
					        </ds:column>		
					        <ds:column titleKey="simulator.ActualRepositionStock" headerClass="listTitle">
					        	<%= ((Product)row).getRepositionStock() %>
					        </ds:column>
					        <ds:column titleKey="simulator.SimulatedSizeOfPurchase" headerClass="listTitle">
					        	<html:text property="simulatedSizeOfPurchaseArray" value="<%= ssop[i] %>"/>
					        </ds:column>
					        <ds:column titleKey="simulator.SimulatedRepositionStock" headerClass="listTitle">
					        	<html:text property="simulatedRepositionStockArray" value="<%= srs[i] %>"/>
					        </ds:column>
					        
					        <ds:column headerClass="listTitle" title="<input type='checkbox' name='all' value='1' onClick='checkOrUncheckAll()'>">
					        	<html:hidden property="productsArray" value="<%= ((Product)row).getId().toString() %>"/>
					        	<html:multibox property="simuladorArray" value="<%= ((Product)row).getId().toString() %>" onclick="onchecks()"/>
					        	<html:hidden property="simuladorArray" value="-1"/>
					        </ds:column>
					        
					        <% i++; %>
					</ds:table>
				</td>
			</tr>
		</table>
	</logic:notEmpty>
</TABLE>