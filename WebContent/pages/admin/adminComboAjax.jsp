<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>


<s:if test='"TravelOptionList".equals(reqFrom)'>
<div class="tbox"> <s:select name="optionName" id="optionName" list="travelOptionList" headerKey="" headerValue="---Select---" cssClass="inputBoxS" cssStyle="width:100%;" listKey="OPTION_ID" listValue="OPTION_NAME"/> </div>
</s:if>

<s:elseif test='"baserates".equals(reqFrom)'>
<td>
<s:select name="coverageID" id="coverageID" cssClass="inputSelect" headerKey="-1" headerValue="-- Select --" list="coverages" listKey="COVER_ID" listValue="COVER_NAME"/>
</td>                                 
</s:elseif>                                                            
<s:elseif test='"baserates1".equals(reqFrom)'>
<td>
<s:select name="coveyID" id="coveyID" cssClass="inputSelect" headerKey="-1" headerValue="-- Select --" list="covey" listKey="CONV_MEAN" listValue="CONVDESC" />
</td>
</s:elseif>

<s:elseif test='"cityIDs".equals(reqFrom)'>
<td id="cityIDs">
<s:select name="cityID" cssClass="inputSelect" id="cityID" list="cityList" listKey="CITY_ID" listValue="CITY_NAME" headerKey="-1" headerValue="-Select-"/>
</td>

</s:elseif>
<s:elseif test='"stagename".equals(reqFrom)'>
<s:select name="stagename" headerKey="-1" id="stagename" cssClass="inputSelect" headerValue="--Select--" list="stagenames" listKey="STAGE_ID" listValue="STAGE_DESC" cssStyle="width: 51%;" theme="simple"/>
</s:elseif>
<s:elseif test='"covername".equals(reqFrom)'>
<s:select name="covername" id="covername" cssClass="inputSelect" style="width:180px"  headerKey="-1" headerValue="-- Select --" list="coverNames" listKey="COVER_ID" listValue="COVER_NAME" theme="simple" />
</s:elseif>
<s:elseif test='"productselections".equals(reqFrom)'>
<%--<div id="loading" style="width:100%">
	   <img id="loading-image" src="<%=request.getContextPath()%>/images/ajax-loader-bar.gif" id="loader"/>
</div>
    --%><s:form name="productSelect" theme="simple">
    	<div class="row">
    		<div class="col-xs-12">
    			<s:if test='"newAjax".equals(mode1)'>
	    			<div class="panel panel-primary">
	    				<div class="panel-heading">
	    					<s:text name="broker.new.product" />
	    				</div>
	    				<div class="panel-body">
	    					<div class="row">
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:text name="product.product"/>&nbsp;&nbsp;&nbsp;:</div>
	    							<div class="tbox">
	    								<s:select name="productID" id="productID" list="productList" headerKey="" cssClass="inputBoxS" headerValue="---Select---" listKey="ProductId" listValue="ProductName" onchange="forward('%{agencyCode}','productselections', this.value,'newAjax');"/>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
    			</s:if>
    			<s:else>
	    			<div class="panel panel-primary">
	    				<div class="panel-heading">
	    					<s:text name="broker.modify.product" />
	    				</div>
	    				<div class="panel-body">
	    					<div class="row">
	    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
	    							<s:text name="product.product"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<s:property value="productName"/>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<s:hidden name="productName"/>
					<s:hidden name="productID"/>
    			</s:else>
    			<s:if test='%{"newAjax".equals(mode1) && productList.size==0}'>
	    			<div class="panel panel-primary">
	    				<div class="panel-body">
	    					<div class="row">
	    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
	    							<s:text name="product.product"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<s:property value="productName"/>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
    			</s:if>    			
    			<s:if test='"11".equals(productID)'>
    				<div class="panel panel-primary">
	    				<div class="panel-body">
	    					<div class="row">
	    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
	    							<s:submit name="bck1" value="Submit" cssClass="btn btn-sm btn-success" onclick="addProduct();"/>
									<s:if test='"editAjax".equals(mode1)'>
										&nbsp;&nbsp;&nbsp;<input type="button" name="bck1" value="Delete" class="btn btn-sm btn-danger" onclick="deleteProduct();"/>
									</s:if> 
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<s:hidden name="payReceipt" value="N"/>
					<s:hidden name="freight" value="N"/>
					<s:hidden name="remark" value="N"/>
					<s:hidden name="provision" value="Y"/>
					<s:hidden name="loadingPremium" value="0"/>
					<s:hidden name="discountPremium" value="0"/>
					<s:hidden name="user_Id_Creation" value="0"/>
    			</s:if>
    			<s:elseif test='"3".equals(productID)'>
    				<div class="panel panel-primary">
	    				<div class="panel-heading">
	    					<s:text name="broker.premium.details" />
	    				</div>
	    				<div class="panel-body">
	    					<div class="row">
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.commission" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:textfield name="commission" maxlength="10" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> SumInsured&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
	    							<div class="tbox">
	    								<s:textfield name="insurance_End_Limit" maxlength="10" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> <s:label key="product.minpremium" />&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
	    							<div class="tbox">
	    								<s:textfield name="min_Premium_Amount" maxlength="10" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.backdays" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:textfield name="back_Date_Allowed" maxlength="4" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="panel panel-primary">
	    				<div class="panel-heading">
	    					<s:text name="broker.provision.loadingYN" />
	    				</div>
	    				<div class="panel-body">
	    					<div class="row">	    						
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.provisionloading" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:radio name="provision" id="provision" list="#{'Y':'Yes','N':'No'}" value='%{provision==null?"N":provision}' onclick="provisionDisplay(this.value)"/>
	    							</div>
	    						</div>	    						
	    					</div>
	    					<div class="row" id="provision_Display" style="display: <s:if test='"Y".equals(provision)'></s:if><s:else>none</s:else>">
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.loading" /> <font color="red">*</font></div>
	    							<div class="tbox"><s:textfield name="loadingPremium" id="loadingPremium" maxlength="5"  size="10" cssClass="inputBox"/></div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> <s:label key="product.discount" /> <font color="red">*</font> </div>
	    							<div class="tbox"> <s:textfield name="discountPremium" id="discountPremium" maxlength="5" size="10" cssClass="inputBox" /> </div>
	    						</div>
    						</div>
	    				</div>
	    			</div>
	    			<div class="panel panel-primary">
	    				<div class="panel-heading">
	    					<s:text name="broker.provision.details" />
	    				</div>
	    				<div class="panel-body">
	    					<div class="row">	    						
	    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	    							<div class="text"><s:label key="product.provision" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:radio name="user_Id_Creation" list="#{'Y':'Yes','N':'No'}" value='%{user_Id_Creation==null?"N":user_Id_Creation}'/>
	    							</div>
	    						</div>	    												
	    					</div>
	    					<br class="clear" />
	    					<div class="row">	    						
	    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
	    							<s:submit name="bck1" value="Submit" cssClass="btn btn-sm btn-success" onclick="addProduct();"/>
									<s:if test='"editAjax".equals(mode1)'> &nbsp;&nbsp;&nbsp;
										<input type="button" name="bck1" value="Delete" class="btn btn-sm btn-danger" onclick="deleteProduct();"/>
									</s:if>
	    						</div>
	    					</div>	    					
	    				</div>
	    			</div>
	    			<s:hidden name="payReceipt" value="N"/>
					<s:hidden name="freight" value="N"/>
					<s:hidden name="remark" value="N"/>
    			</s:elseif>
    			<s:elseif test='"30".equals(productID)'>
    		 
    				<div class="row" id="sme">
				    		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.commission" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:textfield name="commission" maxlength="10" size="10" cssClass="inputBox" onkeypress="return isNumberKey(this.value);" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> SumInsured&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
	    							<div class="tbox">
	    								<s:textfield name="insurance_End_Limit" maxlength="10" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> <s:label key="product.minpremium" />&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
	    							<div class="tbox">
	    								<s:textfield name="min_Premium_Amount" maxlength="10" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.backdays" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:textfield name="back_Date_Allowed" maxlength="4" size="10" cssClass="inputBox" />
	    							</div>
	    						</div>
	    						<br class="clear" />
		    					<div class="row">
		    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		    							<s:submit name="bck1" value="Submit" cssClass="btn btn-sn btn-success" onclick="addProduct();"/>
		    							<s:if test='"editAjax".equals(mode1)'> &nbsp;&nbsp;&nbsp;
											<input type="button" name="bck1" value="Delete" class="btn btn-sm btn-danger" onclick="deleteProduct();"/>
										</s:if>
		    						</div>
		    					</div>
    						<s:hidden name="payReceipt" value="N"/>
							<s:hidden name="freight" value="N"/>
							<s:hidden name="remark" value="N"/>
							<s:hidden name="provision" value="N"/>
							<s:hidden name="loadingPremium" value="0"/>
							<s:hidden name="discountPremium" value="0"/>
							<s:hidden name="user_Id_Creation" value="0"/>		
				</div>
    			</s:elseif>
    			<s:elseif test='"33".equals(productID)' >
    				<div class="row" id="travel">
				    		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	   							<div class="text"><s:label key="product.commission" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:textfield name="commission" maxlength="10" size="10" cssClass="inputBox"  onkeypress="return isNumberKey(this.value);"/>
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> SumInsured&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
	    							<div class="tbox">
	    								<s:textfield name="insurance_End_Limit" maxlength="10" size="10" cssClass="inputBox" onkeypress="return isNumberKey(this.value);"/>
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"> <s:label key="product.minpremium" />&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
	    							<div class="tbox">
	    								<s:textfield name="min_Premium_Amount" maxlength="10" size="10" cssClass="inputBox" onkeypress="return isNumberKey(this.value);" />
	    							</div>
	    						</div>
	    						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	    							<div class="text"><s:label key="product.backdays" /> <font color="red">*</font></div>
	    							<div class="tbox">
	    								<s:textfield name="back_Date_Allowed" maxlength="4" size="10" cssClass="inputBox" onkeypress="return isNumberKey(this.value);"/>
	    							</div>
	    						</div>		
	    						<br class="clear" />
		    					<div class="row">
		    						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		    							<s:submit name="bck1" value="Submit" cssClass="btn btn-sn btn-success" onclick="addProduct();"/>
		    							<s:if test='"editAjax".equals(mode1)'> &nbsp;&nbsp;&nbsp;
											<input type="button" name="bck1" value="Delete" class="btn btn-sm btn-danger" onclick="deleteProduct();"/>
										</s:if>
		    						</div>
		    					</div>	
			    		</div>		
				     	<s:hidden name="payReceipt" value="N"/>
							<s:hidden name="freight" value="N"/>
							<s:hidden name="remark" value="N"/>
							<s:hidden name="provision" value="N"/>
							<s:hidden name="loadingPremium" value="0"/>
							<s:hidden name="discountPremium" value="0"/>
							<s:hidden name="user_Id_Creation" value="0"/>	
    			</s:elseif>
    			<s:elseif test='"65".equals(productID)'>
    				<div class="row" id="motor">
				    	<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
 							<div class="text"><s:label key="product.commission" /> <font color="red">*</font></div>
  							<div class="tbox">
  								<s:textfield name="commission" maxlength="10" size="10" cssClass="form-control" onkeypress="return isNumberKey(this.value);"/>
  							</div>
  						</div>--%>
  						<s:hidden name="commission" value="0"/>
  						<s:hidden name="insurance_End_Limit" value="0"/>
  						<s:hidden name="min_Premium_Amount" value="0"/>
  						<%--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  							<div class="text"> SumInsured&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
  							<div class="tbox">
  								<s:textfield name="insurance_End_Limit" maxlength="10" size="10" cssClass="form-control" onkeypress="return isNumberKey(this.value);"/>
  							</div>
  						</div>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  							<div class="text"> <s:label key="product.minpremium" />&nbsp;[<s:property value="%{#session.BrokerDetails.CurrencyName}"/>] <font color="red">*</font> </div>
  							<div class="tbox">
  								<s:textfield name="min_Premium_Amount" maxlength="10" size="10" cssClass="form-control" onkeypress="return isNumberKey(this.value);"/>
  							</div>
  						</div>--%>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  							<div class="text"><s:label key="product.backdays" /> <font color="red">*</font></div>
  							<div class="tbox">
  								<s:textfield name="back_Date_Allowed" maxlength="4" size="10" cssClass="form-control" onkeypress="return isNumberKey(this.value);" />
  							</div>
  						</div>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  							<div class="text"><s:label key="product.policy.type.selection" /> <font color="red">*</font></div>
  							<div class="tbox">
  								<a data-toggle="modal" class="btn btn-primary" data-target="#myModal" onclick="viewPolicyType();">Select Policy Type</a>
								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="margin: 30px 100px;">
								        <div class="modal-content modal-lg" style="width: 1000px;">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                 <h4 class="modal-title">Choose Policy Type</h4>
								            </div>
								            <div class="modal-body"><div class="te"></div></div>
								            <div class="modal-footer">
								                <table class="footable">
								                	<thead>
								                		<tr>
								                			<td></td>
								                			<td>Policy Type</td>
								                			<td>Commission%</td>
								                			<td>Min Premium</td>
								                			<td>SumInsured</td>
								                			<td>Policy Fee</td>
								                			<td>Najam Fee</td>
								                			<%--<td>Checker Yes/No</td>
								                		--%></tr>
								                	</thead>
								                	<tbody>
								                		<s:iterator value="ppolicyTypeDesc" var="list" status="count">
															<tr>
								                				<td>
																	<s:checkbox id='policyTypeList%{#count.index}' name='policyTypeList[%{#count.index}]' fieldValue="%{#count.index}"/>								                					
								                					<s:hidden name="ppolicyType[%{#count.index}]" id="ppolicyType_%{#count.index}"/>
								                				</td>
									                			<td align="left"><s:property/></td>
									                			<td> <s:textfield cssClass="form-control" onkeyPress="checkDecimals11(this);" name="pcommission[%{#count.index}]" /> </td>
									                			<td> <s:textfield cssClass="form-control" onkeyPress="checkDecimals11(this);" name="pminPremium[%{#count.index}]"/> </td>
									                			<td> <s:textfield cssClass="form-control" onkeyPress="checkDecimals11(this);" name="psumInsured[%{#count.index}]" /> </td>
									                			<td> <s:textfield cssClass="form-control" onkeyPress="checkDecimals11(this);" name="ppolicyFee[%{#count.index}]"/> </td>
									                			<td> <s:textfield cssClass="form-control" onkeyPress="checkDecimals11(this);" name="pnajamFee[%{#count.index}]" /> 
									                			<s:hidden name='pcheck_yn[%{#count.index}]' id="pcheck_yn%{#count.index}" value="N"/>
									                			</td>
									                			<%--<td> <s:radio name='pcheck_yn[%{#count.index}]' id="pcheck_yn%{#count.index}" list="#{'Y':'Yes','N':'No'}" /> </td>
									                		--%></tr>								                		
										                </s:iterator>
									                </tbody>
									            </table>
								                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								                <button type="button" class="btn btn-primary" onclick="fnPolicyTypeSubmit()">Save</button>
										    </div>
										 </div>
											        <!-- /.modal-content -->
									</div>
											    <!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
  								<s:hidden name="policyType" id="policyType"></s:hidden>
  							</div>
			  			</div>	
 					<%--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
 							<div class="text"><s:label key="product.checkerYn" /> <font color="red">*</font></div>
 							<div class="tbox">
 								<s:radio name="checkeryn" id="checkeryn" list="#{'Y':'Yes','N':'No'}" />
 							</div>
 						</div>--%>
 								<s:hidden name="checkeryn" id="checkeryn" value="N"></s:hidden>
 						<br class="clear" />
	   					<div class="row">
	   						<div class="col-xs-12" align="center">
	   							<s:submit name="bck1" value="Submit" cssClass="btn btn-sn btn-success" onclick="addProduct();" />
	   							<s:if test='"editAjax".equals(mode1)'> &nbsp;&nbsp;&nbsp;
										<input type="button" name="bck1" value="Delete" class="btn btn-sm btn-danger" onclick="deleteProduct();"/>
								</s:if>
								<s:submit name="cancel" value="Cancel" cssClass="btn btn-sn btn-warning" onclick="cancelProduct();" />
	   						</div>
	   					</div>						
				     </div>
				    <s:hidden name="payReceipt" value="N"/>
					<s:hidden name="freight" value="N"/>
					<s:hidden name="remark" value="N"/>
					<s:hidden name="provision" value="N"/>
					<s:hidden name="loadingPremium" value="0"/>
					<s:hidden name="discountPremium" value="0"/>
					<s:hidden name="user_Id_Creation" value="0"/>	
			 </s:elseif>   
    		</div>
    	</div>
        <s:hidden name="mode1"/>
        <s:hidden name="agencyCode"/>
		<s:hidden name="borganization"/>
		<s:hidden name="bcode"/>
		<s:hidden name="firstname"/>
		<s:hidden name="login_Id"/>
		<s:hidden name="comtypes"/>
		<s:token/>
    </s:form>
</s:elseif>

<s:elseif test='"policylistUW".equals(reqFrom)'>
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
   					<tr>	                                                 
    						<td class="bg"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
         						<tr>
         							<td width="20%"></td>
           						<td width="25%" align="right"><s:text name="policy.report.startdate"/> <font color="red">*</font></td>
              						<td width="3%"></td>
           					    <td width="32%" align="left">
           					    <sj:datepicker name="startDate" id="startDate3" cssClass="inputBox1"  displayFormat="dd/mm/yy" readonly="true"  duration="fast"  />
           					    </td>
               					<td width="20%"></td>
               				</tr>
         						<tr>
         							<td width="20%"></td>
           						<td width="25%" align="right"><s:text name="policy.report.enddate"/> <font color="red">*</font></td>
              						<td width="3%"></td>
           					    <td width="32%" align="left">
           					    <sj:datepicker name="endDate" id="endDate4" cssClass="inputBox1"  displayFormat="dd/mm/yy" readonly="true"  duration="fast"  />
           					    </td>
               					<td width="20%"></td>
               				</tr>
               				<tr>
         							<td width="20%"></td>
           						<td width="25%" align="right"><s:text name="policy.report.select.uw"/> <font color="red">*</font></td>
              						<td width="3%"></td>
           					    <td width="32%" align="left"><s:select name="broker" id="broker" list="uwList" headerKey="ALL" headerValue="-ALL-" listKey="login_id"  listValue="username" cssClass="inputSelect"/></td>
               					<td width="20%"></td>
               				</tr>
               				<tr>
         							<td width="20%"></td>
           						<td width="25%" align="right"><s:text name="policy.report.product"/> <font color="red">*</font></td>
              						<td width="3%"></td>
           					    <td width="32%" align="left"><s:select name="productID" id="productID" list="productList" headerKey="" headerValue="-Select-" listKey="PRODUCT_ID"  listValue="PRODUCT_NAME" cssClass="inputSelect"/></td>
                 					<td width="20%"></td>
                 				</tr>
           					   <tr><td colspan="5"></td></tr>
    						   </table></td>
    						</tr>
    						 <tr>
 							<td height="2" bgcolor="#FFFFFF"></td>
		    </tr>
			    <tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="25" align="center" valign="middle">
			<input type="button" name="submit1" class="btn" value="Submit" onclick="forward('reportUW',this.form)"/>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr align="center">
	<td height="20" colspan="2" >
		<div id="loaderImage" style="display:none">
			<br>
				<img src='<%=request.getContextPath()%>/images/ajax-loader.gif' width="50px" height="50px"/>
					<br>
				</div>
			</td>
		</tr>
</table>
  </s:elseif>
<s:elseif test='"policylistBR".equals(reqFrom)'>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
             					<tr>	                                                 
              						<td class="bg"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
                   						<tr>
                   							<td width="20%"></td>
                     						<td width="25%" align="right"><s:text name="policy.report.startdate"/> <font color="red">*</font></td>
                        						<td width="3%"></td>
                     					    <td width="32%" align="left">
                     					    <sj:datepicker name="startDate" id="startDate4" cssClass="inputBox1"  displayFormat="dd/mm/yy" readonly="true"  duration="fast"  />
                     					    </td>
                         					<td width="20%"></td>
                         				</tr>
                   						<tr>
                   							<td width="20%"></td>
                     						<td width="25%" align="right"><s:text name="policy.report.enddate"/> <font color="red">*</font></td>
                        						<td width="3%"></td>
                     					    <td width="32%" align="left">
                     					    <sj:datepicker name="endDate" id="endDate4" cssClass="inputBox1"  displayFormat="dd/mm/yy" readonly="true"  duration="fast"  />
                     					    </td>
                         					<td width="20%"></td>
                         				</tr>
                         				<tr>
                   							<td width="20%"></td>
                     						<td width="25%" align="right"><s:text name="policy.report.select.br"/> <font color="red">*</font></td>
                        						<td width="3%"></td>
                     					    <td width="32%" align="left"><s:select name="broker" id="broker1" list="brokerList" headerKey="ALL" headerValue="-ALL-" listKey="login_id"  listValue="COMPANY_NAME" cssClass="inputSelect"/></td>
                         					<td width="20%"></td>
                         				</tr>
                         				<tr>
                   							<td width="20%"></td>
                     						<td width="25%" align="right"><s:text name="policy.report.product"/> <font color="red">*</font></td>
                        						<td width="3%"></td>
                     					    <td width="32%" align="left"><s:select name="productID" id="productID1" list="productList" headerKey="" headerValue="-Select-" listKey="PRODUCT_ID"  listValue="PRODUCT_NAME" cssClass="inputSelect"/></td>
                         					<td width="20%"></td>
                         				</tr>
                   					   <tr><td colspan="5"></td></tr>
            						   </table></td>
            						</tr>
            						 <tr>
         							<td height="2" bgcolor="#FFFFFF"></td>
   							    </tr>
     						    <tr><td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="25" align="center" valign="middle">
											<input type="button" name="submit1" class="btn" value="Submit" onclick="forward('reportBR',this.form)"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr align="center">
							<td height="20" colspan="2" >
								<div id="loaderImage1" style="display:none">
									<br>
										<img src='<%=request.getContextPath()%>/images/ajax-loader.gif' width="50px" height="50px"/>
									<br>
								</div>
							</td>
						</tr>
					</table>
</s:elseif>

<s:elseif test='"depositTYPE".equals(reqFrom) && "INDIVIDUAL".equals(depositType)'>
	<s:radio name="productsId" id="productsId" list="productList" cssClass="input" listKey="PRODUCT_ID" listValue="PRODUCT_NAME"  onclick="radioOc()"/>
</s:elseif>
<s:elseif test='"depositTYPE".equals(reqFrom) && "FLOAT".equals(depositType)'>
	<s:checkboxlist name="productsId" id="productsId" list="productList" cssClass="input" listKey="PRODUCT_ID" listValue="PRODUCT_NAME" onclick="checkOc()"/>
</s:elseif>
<s:elseif  test='"scheme".equals(reqFrom)'>
        <table><tr>
	 	<td><s:text name="Choose Scheme" /><font color="red">*</font>
	  	<s:select name="schemeId" id="schemeId" list="scheme" headerKey="" headerValue="-Select-" listKey="SCHEME_ID" listValue="SCHEME_NAME" cssClass="input" onchange="fnOption(this.value)"/></td>
	  	</tr></table>
</s:elseif>
<s:elseif  test='"option".equals(reqFrom)'>
        <table><tr>
         <td><s:text name="Choose Option" /><font color="red">*</font><br />
		<s:checkboxlist name="linkOption"  list="option"  listKey="OPTION_ID" listValue="OPTION_NAME"/></td>
        
		<td><s:text name="travel.core.app.code" /><font color="red">*</font>
		<s:textfield name="linkOptionCode" id="linkOptionCode" cssClass="input" /></td>
		
		<td><s:text name="travel.effectivedate" /><font color="red">*</font>
		<s:textfield name="linkOptionDate"  readonly="true" id="effectiveDt"/></td>
		
		<td><s:text name="travel.status" /><font color="red">*</font>
		<s:radio list="#{'Y':'Active','N':'DeActive'}" name="linkOptionStatus" id="linkOptionStatus" value="%{linkOptionStatus==null?'N':linkOptionStatus}" cssClass="input2"/></td>
		
		<td align="center"><input type="button" name="sub" value="Submit" onclick="fnsubmit(this.form,'insert','')" class="btn" /></td>
		</tr></table>
</s:elseif>
<s:elseif  test='"coverage".equals(reqFrom)'>
        <table><tr>
	 	<td><s:text name="Choose Scheme" /><font color="red">*</font>
	  	<s:select name="schemeId" id="schemeId" list="scheme" listKey="SCHEME_ID" listValue="SCHEME_NAME" cssClass="input" onchange="fnOption(this.value)"/></td>
	  	</tr></table>
</s:elseif>
<s:elseif  test='"cover".equals(reqFrom)'>
        <table><tr>
        <td><s:text name="Choose Option" /><font color="red">*</font>
	 	<s:select name="linkCover" id="linkCover" list="cover" listKey="COVER_ID" listValue="COVER_NAME" cssClass="input" onchange=""/></td>
        
	 	<td><s:text name="travel.core.app.code" /><font color="red">*</font>
		<s:textfield name="linkCoverageCode" id="linkCoverageCode" cssClass="input" /></td>
	 	
		<td><s:text name="Select Coverages" /><font color="red">*</font></td>
		<td><s:checkboxlist name="linkCoverageId" list="#{'1':'Do you want to include Winter Sports Extension'}"  /></td>
		
		<td><s:text name="Rate" /><font color="red">*</font></td>
		<td><s:textfield name="linkCoverageRate" id="linkCoverageRate" cssClass="input" /></td>
		
		<td><s:text name="travel.effectivedate" /><font color="red">*</font>
		<s:textfield name="linkCoverageDate"  readonly="true" id="effectiveDt"/></td>
		
		<td><s:text name="Rate Status" /><font color="red">*</font>
		<s:radio list="#{'Y':'Loading','N':'Discount'}"  name="linkRateStatus" id="linkRateStatus" value="%{linkRateStatus==null?'Y':linkRateStatus}" onclick="Status(this);"/></td>
	 	<td><s:text name="Status" /><font color="red">*</font>
		<s:radio list="#{'Y':'Active','N':'DeActive'}" name="linkCoverageStatus" id="linkCoverageStatus" value="%{linkCoverageStatus==null?'N':linkCoverageStatus}" cssClass="input2"/></td>
		<td><input type="button" name="sub" value="Submit" onclick="fnsubmit(this.form,'insert','')" class="btn" /></td>
	 	</tr></table>
</s:elseif>
	<s:elseif test='("userListReport".equals(reqFrom))'>
		<label for="userCode">User Name</label>
		<s:select list="userNameList" name="userCode" id="userCode" cssClass="form-control" headerKey="ALL" headerValue="ALL" listKey="LOGIN_ID" listValue="USER_NAME"></s:select>
	</s:elseif>
<script type="text/javascript">
	    function fnPolicyTypeSubmit() {
	    	var checkedVal = $('input[type=checkbox]:checked').map(function() {return $('#ppolicyType_'+this.value).val();}).get().join(',');
	    	if(!checkedVal) {
	    		alert("Please Select Policy Type");
	    	} else {
	    		alert(checkedVal);
	    		document.getElementById("policyType").value=checkedVal;
	    		document.getElementById("policyType").value=checkedVal;
	    		$('#myModal').modal('hide');
	    	}
	    	
	    }
	    function viewPolicyType(){
	    	var agcode = document.getElementById("policyType").value;
	    	var strVale = agcode.split(",");
	    		for (var i=0; i<strVale.length; i++){ 
	    		<s:iterator value="ppolicyType" var="list" status="count">
	    			var ac='<s:property/>';
	    			var index='<s:property value="#count.index"/>';
	    			if(strVale[i]==ac){	  
	    				document.getElementById("policyTypeList"+(index)+"").checked = true;
	    			}
	    		</s:iterator>
		      	}	
	    		    	 	     
	    }
    </script>